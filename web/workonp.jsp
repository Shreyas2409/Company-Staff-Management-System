<%-- 
    Document   : workonp
    Created on : 11 Nov, 2018, 9:17:46 PM
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
           String _prid=request.getParameter("prid");
           String _depid=request.getParameter("depid");
           
           
           
            if(_prid!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
                 
           
            
                CallableStatement calsat=con.prepareCall("{CALL workson(?,?)}");
                calsat.setString(1,_prid);
                calsat.setString(2,_depid);
               
                 ResultSet rs=calsat.executeQuery();
                 con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("main.html");
            } 
            
            %>
    </body>
</html>
