<%-- 
    Document   : attendance
    Created on : 11 Nov, 2018, 9:18:41 PM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@ page import="java.sql.*;"%>
        <%@ page import="javax.sql.*;"%>
        <%
           String _login=request.getParameter("login");
           String _logout=request.getParameter("logout");
           String _eid=request.getParameter("eid");
           
           
           
            if(_eid!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
                 
           
            
                CallableStatement calsat=con.prepareCall("{CALL attendance(?,?,?)}");
                calsat.setString(1,_login);
                calsat.setString(2,_logout);
                calsat.setString(3,_eid);
               
                ResultSet rs=calsat.executeQuery();
                con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("worksonp.html");
            } 
            
            %>
    </body>
</html>
