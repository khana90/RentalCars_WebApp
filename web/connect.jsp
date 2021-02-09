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

    </head>
    
    <body>

        <%
            
              String email = request.getParameter("email");
            String password = request.getParameter("password");
           String query="select email, password from register where email = '"+email+"' and password = '"+password+"'";
            try{

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/RentalCars", "root", "root");
                
                PreparedStatement pst = conn.prepareStatement(query);
                ResultSet res= pst.executeQuery();
       
                if(res.next()){
                    pst.setString(1, res.getString("email"));
                    pst.setString(2,res.getString("password"));
                    
                    
                }
                System.out.println("Login successfully");
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
                
            %>
         
    </body>
</html>

   