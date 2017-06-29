/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sarpestein.Catalogue;
import sarpestein.DBHelper;

/**
 *
 * @author Programming
 */
@WebServlet(urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            String type = request.getParameter("type");
            String brand = request.getParameter("brand");
            double ram = (request.getParameter("ram").equals("")) ? 0.0 : Double.parseDouble(request.getParameter("ram"));
            double screenSize = (request.getParameter("screenSize").equals("")) ? 0.0 : Double.parseDouble(request.getParameter("screenSize"));
            double storageSize = (request.getParameter("storageSize").equals("")) ? 0.0 : Double.parseDouble(request.getParameter("storageSize"));
            double minCost = (request.getParameter("minCost").equals("")) ? 0.0 : Double.parseDouble(request.getParameter("minCost"));
            //double maxCost = (request.getParameter("maxCost").equals("")) ? 0.0 : Double.parseDouble(request.getParameter("maxCost"));
            
            Catalogue catalogue = new Catalogue();
            
            String[] ids = catalogue.GetMatchedItemsId(type, brand, ram, storageSize, screenSize, minCost);
            String cartItem = "";
            
            
            DBHelper dbAssistant  = new DBHelper();
            String query = "SELECT * FROM catalogue WHERE ";
            
            int count = 0;
            for(String id : ids)
            {
                if(count++ == 9)
                {
                    query += String.format("id = '%s' ;", id);
                    break;
                }
                else
                    query += String.format("id = '%s' OR ", id);
            }
            
            ResultSet set = dbAssistant.ExecuteQuery(query);
            
            try
            {
                while(set.next())
                {
                    if(set.getString("type").toLowerCase().equals("laptop"))
                    {
                        cartItem += String.format(""
                                + "<div class=\"col-md-4 text-center col-sm-6 col-xs-6\">\n"
                                + "<div class=\"thumbnail product-box\">\n"
                                + "<img src=\"assets/img/%s\" alt=\"\" class=\"img-responsive\" style=\"width: 250px; height: 180px\"/>\n"
                                + "<hr class=\"padding: 0 50px 0 50px;\">"
                                + "<div class=\"caption\">\n"
                                + "<h3><a href=\"#\">%s</a></h3>\n"
                                + "<p>Price : <strong>%s</strong>  </p>\n"
                                + "<p>Supplier: <a href=\"#\">%s</a> <br>\n"
                                + "RAM: <a href=\"#\">%s</a> <br>\n"
                                + "Storage Size: <a href=\"#\">%s</a> <br>\n"
                                + "Screen Size: <a href=\"#\">%s</a> \n"
                                + "</p> <br>"
                                + "<p>"
                                + "<a href=\"#\" class=\"btn btn-success\" role=\"button\">Add To Cart</a> "
                                + "<a href=\"#\" class=\"btn btn-primary\" role=\"button\">See Details</a>"
                                + "</p>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>",
                                
                                
                                
                                
                                "laptops/" + set.getString("picturePath") ,
                                set.getString("brandName") + " " + ((set.getString("model") == null) ? "" : set.getString("model")),
                                "N " + set.getString("cost"),
                                set.getString("supplier"),
                                set.getString("ram") + "GB",
                                set.getString("StorageSize") + "GB",
                                set.getString("screenSize") + "GB");
                    }
                    else
                        cartItem += String.format(
                                "<div class=\"col-md-4 text-center col-sm-6 col-xs-6\">\n"
                                + "<div class=\"thumbnail product-box\">\n"
                                + "<img src=\"assets/img/%s\" alt=\"\" class=\"img-responsive\" style=\"width: 250px; height: 180px\"/>\n"
                                + "<hr class=\"padding: 0 50px 0 50px;\">"
                                + "<div class=\"caption\">\n"
                                + "<h3><a href=\"#\">%s</a></h3>\n"
                                + "<p>Price : <strong>%s</strong>  </p>\n"
                                + "<p>Supplier: <a href=\"#\">%s</a> <br>\n"
                                + "RAM: <a href=\"#\">%s</a> <br>\n"
                                + "Storage Size: <a href=\"#\">%s</a>  <br>\n"
                                + "Screen Size: <a href=\"#\">%s</a>  \n"
                                + "</p> <br>"
                                + "<p>"
                                + "<a href=\"#\" class=\"btn btn-success\" role=\"button\">Add To Cart</a> "
                                + "<a href=\"#\" class=\"btn btn-primary\" role=\"button\">See Details</a>"
                                + "</p>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>",
                                
                                
                                "tabs/" + set.getString("picturePath"),
                                set.getString("brandName") + " " + ((set.getString("model") == null) ? "" : set.getString("model")),
                                "N " + set.getString("cost"),
                                set.getString("supplier"),
                                set.getString("ram") + "GB",
                                set.getString("StorageSize") + "GB",
                                set.getString("screenSize") + "GB");
                }
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
            
            out.print(cartItem);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

