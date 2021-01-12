<%-- 
    Document   : login
    Created on : 11-Jan-2021, 22:01:41
    Author     : A
--%>

<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <h1>Login!</h1>
    </head>
    <body>
        <%
            try{
               
              String email = request.getParameter("username");
            String password = request.getParameter("password");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/RentalCars", "root", "root");
                PreparedStatement pst = conn.prepareStatement("select * from register where id =? ");
                pst.setString(1, email);
                ResultSet res= pst.executeQuery();
               
                if (res.next()){
                    if(password.equals(res.getString(1))){
                    out.println("<h1> ---Login successful------</h1>");
                }
                }else{
                    out.println("User Not exist");
                }
            }catch (Exception e){
                
            }
                
            %>
         
    </body>
</html>

   