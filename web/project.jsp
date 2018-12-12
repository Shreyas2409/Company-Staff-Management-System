<%-- 
    Document   : project
    Created on : 11 Nov, 2018, 9:14:27 PM
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
           String _pid=request.getParameter("pid");
           String _pname=request.getParameter("pname");
           String _did=request.getParameter("did");
           String _emid=request.getParameter("emid");
           
           
            if(_pid!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
                 
           
            
                CallableStatement calsat=con.prepareCall("{CALL project(?,?,?,?)}");
                calsat.setString(1,_pid);
                calsat.setString(2,_pname);
                calsat.setString(3,_did);
                calsat.setString(4,_emid);               
                ResultSet rs=calsat.executeQuery();
                con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("attendance.html");
            } 
            %>
            
    </body>
</html>
