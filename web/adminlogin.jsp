<%-- 
    Document   : adminlogin
    Created on : 11 Nov, 2018, 8:39:27 PM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
         <%@ page import="java.sql.*;"%>
        <%@ page import="javax.sql.*;"%>
        <%
           String _adminname=request.getParameter("adminname");
            String _password=request.getParameter("password");
            if(_adminname!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
            
              
                    String Query="select * from register where adminname=? and password=?";
                    PreparedStatement psm=con.prepareStatement(Query);
                    psm.setString(1,_adminname );
                    psm.setString(2,_password);
                    ResultSet rs=psm.executeQuery();
                    if(rs.next())
                        
                    {
                        response.sendRedirect("department.html");
                    }
                    else
                    {
                        out.println("login failed type again");
                    }
                }
            
            %>
    </body>
</html>
