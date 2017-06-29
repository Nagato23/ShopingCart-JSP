/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sarpestein.DBHelper;

/**
 *
 * @author Programming
 */
@WebServlet(urlPatterns = {"/AddItemToCart"})
public class AddItemToCart extends HttpServlet {

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
            double price = 0.0;
            String id = request.getParameter("id");
            
            HttpSession session = request.getSession(true);
            
            String itemsString = (String)session.getAttribute("cartDetails");
            
            if(id == "-500")
            {
                out.println(itemsString);
            }
            else
            {
                DBHelper db = new DBHelper();
                ResultSet set = db.ExecuteQuery("SELECT cost FROM catalogue WHERE id = '" + id + "' LIMIT 1; ");

                try
                {
                    while(set.next())
                    {
                        price = Double.parseDouble(set.getString("cost"));
                    }
                }
                catch (Exception ex)
                {
                    ex.printStackTrace();
                }

                HttpSession session = request.getSession();

                String cartDetails = "";
                cartDetails += (String)session.getAttribute("cartDetails");

                if(price == 0.0)
                {
                    out.println("invalid");
                }
                else if (! (cartDetails == null || cartDetails.equals("")))
                {
                    String cartItem = String.format("(id:%s-price:%s);", id, price) + cartDetails;

                    session.setAttribute("cartDetails", cartItem);
                    int itemsCount = session.getAttribute("cartDetails").toString().split(";").length;

                    String[] data = { String.valueOf(itemsCount) };
                    out.println(String.valueOf(itemsCount));
                }
                else
                {
                    session.setAttribute("cartDetails", String.format("(id:%s-price:%s)", id, price));
                    out.println("1");
                }
            }
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
