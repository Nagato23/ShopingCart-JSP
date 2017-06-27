<%-- 
    Document   : HeaderLibrary
    Created on : Jun 26, 2017, 3:25:10 PM
    Author     : Programming
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%
  final Connection con = ((Connection) DriverManager.getConnection("jdbc:mysql://localhost/sarpestein_db", "root", ""));
  final Statement st = (Statement) con.createStatement();
  final Statement st2 = (Statement) con.createStatement();
  
  Boolean loggedIn = false;
  
  String query = "";
//  final Cookie[] a = request.getCookies();
//
//    for (Cookie ast : a) {
//        if (ast.getName().equals("USERID"))
//        {
//            out.print("logged in");
//            loggedIn = true;
//            break;
//        }
//        else
//        {
//            loggedIn = false;
//        }
//    }
%>