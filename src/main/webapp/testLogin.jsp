<%@ page import="projectel.projectel.Login" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 2:14 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="" method="post">
<input type="text" placeholder="Εισαγωγή ονόματος χρήστη" name="email">
<input type="password" placeholder="Εισαγωγή κωδικού" name="password">
    <button type="submit">Δημιουργία Λογαριασμού</button>
</form>
<%
    request.setCharacterEncoding("UTF-8");
    if ("POST".equalsIgnoreCase(request.getMethod())){
        String userId = Login.checkCredentials(request.getParameter("email"),request.getParameter("password"));
        if (userId != null){
            
            out.println("Userid="+userId);
        }else{
            out.println("Wrong username or password");
        }
    }
%>
</body>
</html>
