<%-- 
    Document   : connection
    Created on : 31-Dec-2020, 01:00:38
    Author     : A
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            String email = request.getParameter("username");
            String password = request.getParameter("password");
            String rept_pass = request.getParameter("rptpassword");

           
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RentalCars", "root", "root");
                PreparedStatement pst = conn.prepareStatement("insert into register(email,password,rept_pass)values(?,?,?)");
                pst.setString(1, email);
                pst.setString(2, password);
                pst.setString(3, rept_pass);

                
            if (password.equals(rept_pass)) {
                out.println("Data has been inserted successfully !");
                pst.executeUpdate();
            } else {
                out.println("Password doesn't match !");
            }
            } catch (Exception e) {
                out.println(e.getMessage());
            }
            

        %>




    </body>
</html>
