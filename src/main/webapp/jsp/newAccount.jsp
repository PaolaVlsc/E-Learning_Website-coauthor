<%@ page import="java.sql.Connection" %>
<%@ page import="projectel.projectel.DbConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 6:57 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="el">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <meta charset="UTF-8">
    <title>Μαθηματικά Ε - ΒΕΜΠΛΗΧΑ</title>
    <style>
        body {
            background-image: url('../assets/mathBackground4.png');
            background-attachment: fixed;
            background-size: 100% 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            background: rgba(200, 129, 90, 0.3);
            position: absolute;
            border: 2px solid #de5454;
            top: 18%;
            left: 25%;
            width: 50%;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 2px -30px 2px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        i{
            cursor: pointer;
        }

        button {
            background-color: rgb(44, 121, 165);
            color: white;
            padding: 14px 20px;
            margin: 2px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .button1 {
            background-color: #de5454;
            padding: 8px 16px;/*μέγεθος κουμπιού*/
            font-size: 16px; /*μέγεθος γραμμάτων*/
            width: 25%;
            color: white;
            position:fixed;
            left:38%;
            bottom:3%;
        }
        .img-container {
            text-align: center;
            margin: 2px 0 0 0;
        }
        a, a:visited {
            color: inherit;
        }
        img.avatar {
            width: 12%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }


        @media (max-width: 680px){
            form {
                left: 10%;
                width: 80%;
            }
        }
        @media (max-height: 590px){
            form {
                left: 10%;
                width: 80%;
            }
            .img-container {
                display: none;
            }
        }
    </style>
</head>
<body>
<script>
    function tooglePassword(c){
        let type;
        if (c.className == "bi bi-eye-slash") {
            c.className = "bi bi-eye";
            type="text";
        } else {
            c.className = "bi bi-eye-slash";
            type="password";
        }
        document.getElementById("password").setAttribute('type',type);
    }
</script>
<form action="" method="post">
    <div class="img-container">
        <img src="../assets/cat_glasses.jpg" alt="Avatar" class="avatar">
    </div>

    <div class="container">
        Συμπλήρωσε τα παρακάτω για να δημιουργήσεις έναν λογαριασμό!
        <br><br>
        <label for="email"><b>Email χρήστη</b></label>
        <%
            request.setCharacterEncoding("UTF-8");
            if ("POST".equalsIgnoreCase(request.getMethod())){
                Connection conn = DbConnection.getConnection();
                if (conn!=null) {
                    PreparedStatement dbStmt;
                    try {
                        dbStmt = conn.prepareStatement("SELECT 1 FROM users WHERE email=?;");
                        String email = request.getParameter("email");
                        dbStmt.setString(1,email);
                        dbStmt.execute();
                        final ResultSet dbRs = dbStmt.executeQuery();
                        if (dbRs.next()) {
                            out.println("<FONT COLOR=\"#ff0000\"> Υπάρχει ήδη λογαριασμός με αυτή την διεύθυνση email</FONT>");
                        }else{
                            dbStmt = conn.prepareStatement("INSERT INTO users (name,password,email) VALUES (?,?,?);");
                            dbStmt.setString(1,request.getParameter("name"));
                            dbStmt.setString(2,request.getParameter("password"));
                            dbStmt.setString(3,request.getParameter("email"));
                            dbStmt.executeUpdate();
                            response.sendRedirect("../index.jsp");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        response.sendRedirect("../html/error.html");
                    }
                    //PreparedStatement dbStmt = conn.prepareStatement("INSERT INTO users (name,password,email) VALUES (?,?,?);");
                }else{
                    response.sendRedirect("../html/error.html");
                }
            }
        %>
        <input type="text" placeholder="Εισαγωγή email χρήστη" name="email" id="email" required maxlength="100">
        <br>
        <label for="name"><b>Το όνομά σου</b></label>
        <input type="text" placeholder="Εισαγωγή του ονόματός σου" name="name" id="name" required maxlength="25">
        <br>
        <label for="password"><b>Κωδικός</b></label>
        <input type="password" placeholder="Εισαγωγή κωδικού" name="password" id="password" required maxlength="32">
        <i class="bi bi-eye-slash" id="togglePassword" onclick="tooglePassword(this)"></i>
        <br><br>
        <button type="submit">Δημιουργία Λογαριασμού</button>
    </div>
</form>
<button class="button1" onclick="location.href='../index.jsp'">Γύρνα πίσω στην αρχική</button>
</body>
</html>


