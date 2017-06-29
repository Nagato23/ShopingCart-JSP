/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sarpestein;

import java.sql.ResultSet;
import java.sql.SQLException;

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
            double screenSize, double cost)
    {
        
        double maxPriceInCatalogue = this.GetMinCostInDB();
        double minPriceInCatalogue = this.GetMaxCostInDB();
        
        HEOM  matcher = 
                new HEOM(deviceType, brandName, ramSize, storageSize, screenSize, cost, maxPriceInCatalogue, minPriceInCatalogue);
        
        
        HEOMData[] output = matcher.PerformMatching();
        String[] ids = new String[output.length];
        
        for(int i = 0; i < output.length; i++)
        {
            ids[i] = output[i].id;
        }
        
        return ids;
    }
    
    
    private double GetMinCostInDB()
    {
        DBHelper db = new DBHelper();
        String query = "";
        
        double minPriceInCatalogue = 0.0;
        
        try
        {
            query = "SELECT * FROM catalogue ORDER BY cost DESC LIMIT 1";
            
            ResultSet set = db.ExecuteQuery(query);
            
            while(set.next())
            {
                //System.out.println(set.getString("cost"));
                minPriceInCatalogue = Double.parseDouble(set.getString("cost"));
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return minPriceInCatalogue;
    }
    
    
    private double GetMaxCostInDB()
    {
        String query = "SELECT cost FROM catalogue ORDER BY cost ASC LIMIT 1";
        
        DBHelper db = new DBHelper();
        ResultSet set = db.ExecuteQuery(query);
        
        double maxPriceInCatalogue = 0.0;
        
        try
        {
            while(set.next())
            {
                maxPriceInCatalogue = Double.parseDouble(set.getString("cost"));
                //System.out.println(set.getString("cost"));
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        
        return maxPriceInCatalogue;
    }
}
