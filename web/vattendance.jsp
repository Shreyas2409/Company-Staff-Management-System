<%-- 
    Document   : vattendance
    Created on : 27 Nov, 2018, 10:31:44 PM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<td>login</td>
<td>logout</td>
<td>emplyoee id</td>


</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
statement=connection.createStatement();
String sql ="select * from attendance";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("login") %></td>
<td><%=resultSet.getString("logout") %></td>
<td><%=resultSet.getString("eid") %></td>

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
