<%-- 
    Document   : reg2
    Created on : 11 Nov, 2018, 8:30:07 PM
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
          <%@  page import="java.sql.*;"%>
          <%@ page  import="javax.sql.*;"%>
        <%
           
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String adminname=request.getParameter("adminname");
            String password=request.getParameter("password1");
            String _type=request.getParameter("type");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
            
            if(_type.equals("admin"))
            {
                CallableStatement calsat=con.prepareCall("{CALL reg2(?,?,?,?,?,?)}");
                calsat.setString(1,firstname);
                calsat.setString(2,lastname);
                calsat.setString(3,email);
                calsat.setString(4,adminname);
                calsat.setString(5,password);
                calsat.setString(6,_type);
                ResultSet rs=calsat.executeQuery();
                con.close();
                    calsat.close();
                    out.println("succesful");
                    response.sendRedirect("adminlogin.html");
                
            }
            %>
    </body>
</html>
