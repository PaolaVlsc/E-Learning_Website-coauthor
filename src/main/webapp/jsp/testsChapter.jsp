<%@ page import="projectel.projectel.Login" %>
<%@ page import="projectel.projectel.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 2:14 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! String message;
    Boolean isLogged;%>
<%
    message="Καλή τύχη! Εάν θέλεις να αποθηκευτεί η πρόοδός σου θα πρέπει πρώτα να συνδεθείς!"; //default μήνυμα αν δεν έχει συνδεθεί
    isLogged=Login.isLoggedIn(session);
    if(isLogged){
        message="Καλή τύχη ω συνδεδεμένε χρήστη"; // default μήνυμα αν έχει συνδεθεί
        if(request.getParameter("chapter").equals("5")){
            //Αν δεν καταφέρει να συνδεθεί με τη βάση δε χρειάζεται να του πετάξει μήνυμα εσωτερικού σφάλματος, απλά θα του εμφανίσει το ακόλουθο default μήνυμα.
            message="Το επαναληπτικό είναι δύσκολο, μήπως να ξαναδοκιμάσεις κάποιο άλλο κεφάλαιο πρώτα;"; //default μήνυμα για το επαναληπτικό τεστ αν έχει συνδεθεί.
            Connection conn = DbConnection.getConnection();
            if(conn != null){
                PreparedStatement statement;
                try {
                    statement = conn.prepareStatement("SELECT COUNT( DISTINCT chapter_id) FROM GRADES WHERE user_id=? AND chapter_id<5;");
                    statement.setString(1,Login.getUserId(session));
                    statement.execute();
                    final ResultSet dbRs = statement.executeQuery();
                    if(dbRs.next()){
                        if(dbRs.getInt(1)<4){
                            message="Είσαι σίγουρος πως θες να δοκιμάσεις το επαναληπτικό; Δεν έχεις δει τα προηγούμενα κεφάλαια.";
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        }else {

        }
    }else{

    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Τεστς | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/test_chapters_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<nav class="navbar">
    <div class="wrapper">
        <div class="icon a menu-btn">
            <a><i class="fa fa-list-ul"></i></a>
        </div>
        <div class="logo">
            ΒΕΜΠΛΗΧΑ
        </div>
        <ul class="menu-list">
            <li>
                <div class="icon cancel-btn">
                    <i class="fa fa-close"></i>
                </div>
            </li>
            <li><a href="../index.jsp">Αρχική</a></li>
            <li>
                <div class="dropdown">
                    <a href="chapters.jsp">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                        <a href="sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                        <a href="sub-chapters/chapter04.jsp">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a class="current" href="tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="quiz.jsp">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="quiz.jsp">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="quiz.jsp">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="quiz.jsp">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="quiz.jsp">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="../jsp/statistics.jsp">Στατιστικά</a></li>
            <li><a href="../jsp/games.jsp">Παιχνίδια</a></li>
        </ul>

        <div class="logout">
            <a href="<%=Login.isLoggedIn(session)?"../logout-servlet":"login.jsp"%>">
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<script src="../js/app.js"></script>

<script>
    navbar.classList.add("sticky");
</script>
<div class="main-wrap">
    <h1><%=message%></h1>
    <br>
    <button onclick="location.href='quiz.jsp?chapter=<%=request.getParameter("chapter")%>'">Έναρξη τεστ</button>
</div>

<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p> <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
</body>
</html>