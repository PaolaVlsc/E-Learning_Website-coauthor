<%@ page import="projectel.projectel.Login" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 4:57 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="el">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <meta charset="UTF-8">
    <title>Σύνδεση | SINP</title>
    <style>
        body {
            background-image: url('../assets/simple_background5.png');
            background-attachment: fixed;
            background-size: 100% 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            background: rgba(200, 129, 90, 0.3);
            position: absolute;
            border: 2px solid #f1f1f1;
            top: 18%;
            left: 8%;
            width: 33%;
        }

        input[type=text],input[type=password] {
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

        .button1 {
            background-color:rgb(131, 79, 120);
            padding: 8px 16px;/*μέγεθος κουμπιού*/
            font-size: 16px; /*μέγεθος γραμμάτων*/
            width: 25%;
            color: white;
            position:absolute;
            left:38%;
            bottom:1px;
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
        a, a:visited {
            color: inherit;
        }

        button:hover {
            opacity: 0.8;
        }
        .img-container {
            text-align: center;
            margin: 2px 0 0 0;
        }

        img.avatar {
            width: 15%;
            border-radius: 50%;
        }

        .container {
            padding: 8px;
        }
        @media (max-width: 680px){
            form {
                width: 80%;
            }
        }
        @media (max-height: 490px){
            form {
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
 function togglePassword(c){
     let type;
     if (c.className === "bi bi-eye-slash") {
         c.className = "bi bi-eye";
         type="text";
     } else {
         c.className = "bi bi-eye-slash";
         type="password";
     }
     document.getElementById("password").setAttribute('type',type);
 }
</script>
<!--
<div style = "position:absolute; left:18%; bottom:82%">
    <h1  style="color:rgb(44, 121, 165); font-size:70px;">Ας αρχίσουμε να μαθαίνουμε!</h1>
</div>
-->
<form action="" method="post">
    <div class="container">
        <div class="img-container">
            <img src="../assets/cat_glasses.jpg" alt="Avatar" class="avatar">
        </div>

        <label for="email"><b>Email χρήστη</b></label>
        <input type="text" placeholder="Εισαγωγή email χρήστη" name="email" id="email" required maxlength="100">
        <br>
        <label for="password"><b>Κωδικός</b></label>
        <input type="password" placeholder="Εισαγωγή κωδικού" name="password" id="password" required maxlength="32"/>
        <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePassword(this)"></i>
        <br>
        <%
            //Αν είναι ήδη συνδεδεμένος ανακατεύθυνε τον στην αρχική σελίδα
            if (Login.isLoggedIn(session) ){
                response.sendRedirect("../index.jsp");
            }
            //Σύνδεση χρήστη
            request.setCharacterEncoding("UTF-8");
            if ("POST".equalsIgnoreCase(request.getMethod())){
                if (Login.checkCredentials(request.getParameter("email"),request.getParameter("password"),session)){
                    response.sendRedirect("../index.jsp");
                }else{
                    out.println("<FONT COLOR=\"#ff0000\">Λάθος στοιχεία</FONT><br>");
                }
            }
        %>
        <button type="submit">Σύνδεση</button>
        <br>
        <div style="text-align: center;">Ή</div>
        Εάν είναι η πρώτη σου φορά εδώ, πάτα το παρακάτω κουμπί για να δημιουργήσεις έναν λογαριασμό!
        <button type="button" onclick="location.href='newAccount.jsp'">Δημιουργία Λογαριασμού</button>
    </div>

</form>
<!--<a href="#" style="color:rgb(44, 121, 165);position:fixed; left:36%; bottom:0%;"><h1><-Γύρνα πίσω στην αρχική</h1></a>-->

<button class="button1" type="button" style="margin-bottom: 40px" onclick="location.href='../index.jsp'">Γύρνα πίσω στην αρχική</button>

</body>
</html>

