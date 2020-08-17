<%-- 
    Document   : demoConnection
    Created on : Aug 17, 2020, 8:30:28 PM
    Author     : STUDENT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "");
            
            if (conn != null) {
                out.println("Connected !");
                Statement st = conn.createStatement();
                //st.executeUpdate("INSERT INTO `product`(`ID`, `Name`) VALUES (1,\"apple\")");
                
                ResultSet rs = st.executeQuery("SELECT `ID`, `Name` FROM `product`");
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString("Name");
                    
                    out.println("ID: " + id + "/<br/>");
                    out.println("Name: " + name);
                }
                
            } else {
                out.println("Not Conneted !");
            } 
        %>
    </body>
</html>
