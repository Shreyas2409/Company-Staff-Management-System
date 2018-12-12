<%-- 
    Document   : vproject
    Created on : 1 Dec, 2018, 10:18:21 AM
    Author     : shreyas.H.C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<td>project id</td>
<td>project name</td>
<td>employee id</td>
<td>department id</td>


</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company?useSSL=false","root","appe.hcj");
statement=connection.createStatement();
String sql ="select * from project";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("pid") %></td>
<td><%=resultSet.getString("pname") %></td>
<td><%=resultSet.getString("did") %></td>
<td><%=resultSet.getString("emid") %></td>

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