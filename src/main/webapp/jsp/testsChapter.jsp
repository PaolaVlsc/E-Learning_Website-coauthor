<%@ page import="projectel.projectel.Login" %>
<%@ page import="projectel.projectel.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  this jsp will have a text and a button with a message
  that will tell the user the difficulty of the test and a helpful message
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! String message;
    Boolean isLogged;%>
<%
    message="Καλή τύχη!"; //default μήνυμα αν δεν έχει συνδεθεί
    if (request.getParameter("chapter").equals("4")){
        message+="<br>Να προσέχεις, γιατί αυτό το κεφάλαιο είναι δύσκολο!";
    }else if (request.getParameter("chapter").equals("5")){
        message+="<br>Το επαναληπτικό είναι δύσκολο!<br>Θα πρέπει να ξέρεις καλά όλα τα κεφάλαια!";
    }else if (request.getParameter("chapter").equals("3")){
        message+="<br>Θα πρέπει να ξέρεις καλά θεωρία σε αυτό το κεφάλαιο!";
    }
    message+="<br>Εάν θέλεις να αποθηκευτεί η πρόοδός σου θα πρέπει πρώτα να συνδεθείς!";
    isLogged=Login.isLoggedIn(session);
    if(isLogged){
        message="Καλή τύχη, "+Login.getUserName(session)+"!"; // default μήνυμα αν έχει συνδεθεί
        if(request.getParameter("chapter").equals("5")){
            //Αν δεν καταφέρει να συνδεθεί με τη βάση δε χρειάζεται να του πετάξει μήνυμα εσωτερικού σφάλματος, απλά θα του εμφανίσει το ακόλουθο default μήνυμα.
            message="Καλή τύχη, "+Login.getUserName(session)+"!<br>Πρόσεχε, το επαναληπτικό είναι δύσκολο."; //default μήνυμα για το επαναληπτικό τεστ αν έχει συνδεθεί.
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
                            message="Καλή τύχη, "+Login.getUserName(session)+"!<br>Είσαι σίγουρος πως θες να δοκιμάσεις το επαναληπτικό;<br>Δεν έχεις δει τα προηγούμενα κεφάλαια.";
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        }else if (request.getParameter("chapter").equals("4")){
            message+="<br>Πρόσεχε, αυτό το τεστ είναι δύσκολο.";
        }else if (request.getParameter("chapter").equals("3")){
            message+="<br>Πρόσεχε, σε αυτό το τεστ θα πρέπει να ξέρεις καλά θεωρία.";
        }
    }else{

    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Τεστ | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/test_chapters_style.css">
    <link rel="stylesheet" href="../css/popup.css">
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
                        <a href="testsChapter.jsp?chapter=1">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="testsChapter.jsp?chapter=2">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="testsChapter.jsp?chapter=3">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="testsChapter.jsp?chapter=4">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="testsChapter.jsp?chapter=5">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="../jsp/statistics.jsp">Στατιστικά</a></li>
            <li><a href="../jsp/games.jsp">Παιχνίδια</a></li>
        </ul>
        <div class="logout">
            <a id="log" <%if(!Login.isLoggedIn(session)){%>href="login.jsp"<%}%>>
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<script src="../js/app.js"></script>

<!-- contain the message in space under navbar -->
<div class="main-wrap">
    <h1><%=message%></h1>
    <br>
    <button onclick="location.href='quiz.jsp?chapter=<%=request.getParameter("chapter")%>'">Έναρξη τεστ</button>
</div>
<!-- The Modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>Είσαι σίγουρος;</h2>
        </div>
        <div class="modal-body">
            <p>Είσαι σίγουρος πως θες να αποσυνδεθείς;</p>
        </div>
        <div class="modal-footer">
            <button id="choice" class="button button2">Ναι, θέλω να φύγω.</button>
        </div>
    </div>

</div>
<!-- script for modal -->
<script>
    <%if(Login.isLoggedIn(session)){%>
    // Get the modal
    let modal = document.getElementById("myModal");
    let choice = document.getElementById("choice");
    let log = document.getElementById("log");

    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    log.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href ="../logout-servlet";
        }
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    <%}%>
</script>
<script>
    navbar.classList.add("sticky");
</script>
<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p> <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
</body>
</html>