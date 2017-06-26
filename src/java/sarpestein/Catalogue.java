/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sarpestein;

import java.sql.ResultSet;

/**
 *
 * @author Programming
 */

public class Catalogue {
    public ResultSet GetAllItems()
    {
        DBHelper  db = new DBHelper();
        String query = "SELECT * FROM catalogue";
        
        return db.ExecuteQuery(query);
    }
    
    
    public String[] GetMatchedItemsId(String deviceType, String brandName, double ramSize, double storageSize,
            double screenSize, double minUserCost, double maxUserCost, double maxPriceInCatalogue, double minPriceInCatalogue)
    {
        HEOM  matcher = 
                new HEOM(deviceType, brandName, ramSize, storageSize, screenSize, minUserCost, maxUserCost, maxPriceInCatalogue, minPriceInCatalogue);
        
        
        HEOMData[] output = matcher.PerformMatching();
        String[] ids = new String[output.length];
        
        for(int i = 0; i < output.length; i++)
        {
            ids[i] = output[i].id;
        }
        
        return ids;
    }
    
    
}

class HEOM
{
    private final String deviceType;
    private final String brandName;
    private final double ramSize;
    private final double storageSize;
    private final double screenSize;
    private final double minUserCost;
    private final double maxUserCost;
    private final double maxPriceInCatalogue;
    private final double minPriceInCatalogue;
    
    HEOM(String deviceType, String brandName, double ramSize, double storageSize,
            double screenSize, double minUserCost, double maxUserCost, double maxPriceInCatalogue, double minPriceInCatalogue)
    {
        this.deviceType = deviceType;
        this.brandName = brandName;
        this.ramSize = ramSize;
        this.storageSize = storageSize;
        this.screenSize = screenSize;
        this.minUserCost = minUserCost;
        this.maxUserCost = maxUserCost;
        this.maxPriceInCatalogue = maxPriceInCatalogue;
        this.minPriceInCatalogue = minPriceInCatalogue;
    }
    
    public HEOMData[] PerformMatching()
    {
        ResultSet set = this.GetInitialMatch();
        HEOMData[] values = new HEOMData[1000]; // [id] [heom_score] 
        
        try
        {
            int count = 0;
            double score = 0.0;
            while(set.next())
            {
                score += (deviceType.equals("")) ? 1.0 : overlap(deviceType, set.getString("type"));
                score += (brandName.equals("")) ? 1.0 : overlap(brandName, set.getString("brandName"));
                score += (ramSize == 0.0) ? 1.0 : overlap(String.valueOf(ramSize), set.getString("ram"));
                score += (storageSize == 0.0) ? 1.0 : overlap(String.valueOf(storageSize), set.getString("storageSize"));
                score += (screenSize == 0.0) ? 1.0 : overlap(String.valueOf(screenSize), set.getString("screenSize"));
                
                if((minUserCost == 0.0 ) && (maxUserCost == 0.0))
                    score += 1.0;
                else
                    score += rnDiff(minUserCost, maxUserCost, maxPriceInCatalogue, minPriceInCatalogue);
                
                HEOMData data = new HEOMData();
                values[count].id = set.getString("id");
                values[count].score = score;
                
                count++;
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
            
        return this.Sort(values);
    }
    
    private HEOMData[] Sort(HEOMData[] output)
    {
        for (int i = 0; i < output.length; i++)
        {
            for (int j = 0; j < output.length; j++)
            {
                if(output[j].score > output[i].score)
                {
                    HEOMData temp = output[i];
                    output[i] = output[j];
                    output[j]= temp;
                }
            }
        }
        
        return output;
    }
    
    private int overlap(String x, String y)
    {
        if (x.equals(y))
            return 0;
        
        return 1;
    }
    
    private double rnDiff(double  x, double y, double max, double min)
    {
        return ( Math.abs(x - y) / (max- min) );
    }

    private ResultSet GetInitialMatch()
    {
        String[] queriesParts = new String[6];
        
        int count = 0;
        
        if (!deviceType.equals(""))
            queriesParts[count++] = String.format("type = {0}", deviceType);
        
        if (!brandName.equals(""))
        {
            queriesParts[count++] = String.format("brandName = {0}", brandName);
            
        }
        if (!(ramSize == 0.0))
            queriesParts[count++] = String.format("ram = {0}", ramSize);
        
        if (!(storageSize == 0.0))
            queriesParts[count++] = String.format("storageSize = {0}", storageSize);
        
        if (!(screenSize == 0.0))
            queriesParts[count++] = String.format("screenSize = {0}", screenSize);
        
        if (minUserCost != maxUserCost)
            queriesParts[count++] = String.format("(cost > {0}  AND cost < {1})", minUserCost, maxUserCost);
        
        String query = this.GenerateQuery(queriesParts);
        
        DBHelper db = new DBHelper();
        
        
        return db.ExecuteQuery(query);
    }
    
    private String GenerateQuery(String[] queriesParts)
    {
        String query = "SELECT * FROM catalogue WHERE ";
        
        for (int i = 0; i < queriesParts.length; i++)
        {
            if(i != (queriesParts.length - 1))
                query += queriesParts[i] + " AND ";
            else
                query += queriesParts[i] + ";";
        }
        
        return query;
    }
}