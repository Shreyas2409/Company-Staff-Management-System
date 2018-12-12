<%-- 
    Document   : department
    Created on : 11 Nov, 2018, 9:13:44 PM
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
           String _deptid=request.getParameter("deptid");
            String _deptname=request.getParameter("deptname");
            if(_deptid!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
                 
           
            
                CallableStatement calsat=con.prepareCall("{CALL department(?,?)}");
                calsat.setString(1,_deptid);
                calsat.setString(2,_deptname);
               
                ResultSet rs=calsat.executeQuery();
                con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("emp.html");
            } 
            
            %>
              
    </body>                
</html>
