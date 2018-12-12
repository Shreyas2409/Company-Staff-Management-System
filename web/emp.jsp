<%-- 
    Document   : emp
    Created on : 11 Nov, 2018, 7:57:24 PM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLOYEE DETAILS</title>
    </head>
    <body>
        
   
          
        <%@ page import="java.sql.*;"%>
        <%@ page import="javax.sql.*;"%>
        <%
           String _eid=request.getParameter("eid");
           String _fname=request.getParameter("fname");
           String _lname=request.getParameter("lname");
           String _address=request.getParameter("address");
           String _deptid=request.getParameter("deptid");
           String _startdate=request.getParameter("startdate");
           
           
            if(_eid!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
                 
           
            
                CallableStatement calsat=con.prepareCall("{CALL employee(?,?,?,?,?,?)}");
                calsat.setString(1,_eid);
                calsat.setString(2,_fname);
                calsat.setString(3,_lname);
                calsat.setString(4,_address);
                calsat.setString(5,_deptid);
                calsat.setString(6,_startdate);
               
                ResultSet rs=calsat.executeQuery();
                con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("supervisor.html");
            } 
            %>
            
            
    </body>
</html>
