<%-- 
    Document   : vemp
    Created on : 1 Dec, 2018, 10:01:58 AM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : vdepartment
    Created on : 27 Nov, 2018, 2:10:52 PM
    Author     : shreyas.H.C
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/company?useSSL=false";
String database = "company";
String userid = "root";
String password = "appe.hcj";
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
    <h1> department details</h1>
<table border="1">
<tr>
<td>department id</td>
<td>department name</td>


</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
statement=connection.createStatement();
String sql ="select * from employee";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("eid") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("deptid") %></td>
<td><%=resultSet.getString("startdate") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
