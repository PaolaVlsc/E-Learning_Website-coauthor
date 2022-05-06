<%@ page import="projectel.projectel.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Παιχνίδια | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/games.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<!-- Start Top Nav -->
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
            <li><a id="startPage" href="../index.jsp">Αρχική</a></li>

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
                    <a href="tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="quiz.jsp">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="quiz.jsp">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="quiz.jsp">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="quiz.jsp">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="quiz.jsp">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="statistics.jsp">Στατιστικά</a></li>
            <li><a class="current" href="games.jsp">Παιχνίδια</a></li>
        </ul>
        <div class="logout">
            <a href="<%=Login.isLoggedIn(session)?"../logout-servlet":"login.jsp"%>">
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<!-- Close Top Nav -->

<div class="main-wrap" style="padding-bottom: 100px;">
    <h1>Διάλεξε ποιο παιχνίδι θέλεις να παίξεις!</h1>
    Μπορείς να παίξεις με φίλους!<br>
    <button onclick="window.open('https://create.kahoot.it/details/b16a1924-bdc9-461e-9440-a4af1188f620','_blank');" >Kahoot!</button><br>
    Εάν θέλεις να εξασκηθείς στην προπαίδεια του 2, 3, 4:<br>
    <a target="_blank" href="http://users.sch.gr/sudiakos/stapenalti/story_html5.html">
        <img src="../assets/mult2.jpg" alt="προπαίδεια 2 3 4" style="width:400px;height:250px;">
    </a><br>
    Εάν θέλεις να εξασκηθείς στην προπαίδεια του 5, 6, 7:<br>
    <a target="_blank" href="http://users.sch.gr/sudiakos/stapenalti1/story_html5.html">
    <img src="../assets/mult5.jpg" alt="προπαίδεια 5 6 7" style="width:400px;height:250px;">
    </a><br>
    Εάν θέλεις να εξασκηθείς στην προπαίδεια του 8, 9, 10:<br>
    <a target="_blank" href="http://users.sch.gr/sudiakos/stapenalti2/story_html5.html">
    <img src="../assets/mult8.jpg" alt="προπαίδεια 8 9 10" style="width:400px;height:250px;">
    </a><br>
    Εάν θέλεις να εξασκηθείς στα κριτήρια διαιρετότητας:<br>
    <a target="_blank" href="http://users.sch.gr/gregzer/M/M-E/%CE%9A%CF%81%CE%B9%CF%84%CE%AE%CF%81%CE%B9%CE%B1%20%CE%B4%CE%B9%CE%B1%CE%B9%CF%81%CE%B5%CF%84%CF%8C%CF%84%CE%B7%CF%84%CE%B1%CF%82%20-%20%CE%95%CE%BE%CE%AC%CF%83%CE%BA%CE%B7%CF%83%CE%B7/story_html5.html">
        <img src="../assets/chap3.jpg" alt="κριτήρια διαιρετότητας" style="width:400px;height:220px;">
    </a><br>

</div>
<!-- Start Footer -->

<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p>
        <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000
    </p>
</footer>
<!-- Close Footer -->

<!-- Start Script -->
<script src="../js/app.js"></script>

<script>
    navbar.classList.add("sticky");
</script>
</body>
</html>
