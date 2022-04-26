<%@ page import="projectel.projectel.Login" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 2:14 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Κεφάλαια | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/chapters_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!----------------------------------------- Start of navbar ------------------------------------------>
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
                    <a  class="current" href="chapters.jsp">Κεφάλαια Μαθηματικών</a>
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
                    <a href="../jsp/tests.jsp">Έλεγξε τις γνώσεις σου!</a>
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
        </ul>

        <div class="logout">
            <a href="<%=Login.isLoggedIn(session)?"logout-servlet":"login.jsp"%>">
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<!--------- Start: Js navbar ---------->
<script src="../js/app.js"></script>
<script>
    navbar.classList.add("sticky");

    function toggleText(x) {
        var texts = document.getElementsByClassName(x);
        var i;
        for (i = 0; i < texts.length; i++) {
            var text = texts[i];
            if (text.style.display === "none") {
                text.style.display = "block";
            } else {
                text.style.display = "none";
            }
        }
    }

</script>
<!---------- End: Js navbar ----------->
<!---------------------------------------- Close of navbar ------------------------------------------->

<!------------------------------------ Start Main Container ------------------------------------------>

<div class="mother-ship">

    <div class="main-container">
        <!-- <div class="header-banner center">
            <img src="../assets/kefalaia_banner.jpg" style="width:690px;height:300px;  ">
        </div> -->
        <div class="content-area">
            <div class="column1">
                <a href="sub-chapters/chapter01.jsp"><img src="../assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                                           style="width:240px;height:300px;"></a>
                <a href="sub-chapters/chapter01.jsp">
                    <center> ΠΡΟΣΘΕΣΗ & ΑΦΑΙΡΕΣΗ </center>
                </a>
            </div>
            <div class="column2">
                <a href="sub-chapters/chapter02.jsp"><img src="../assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                 style="width:240px;height:300px;"></a>
                <a href="sub-chapters/chapter02.jsp">
                    <center> ΠΟΛΛΑΠΛΑΣΙΑΣΜΟΣ </center>
                </a>
            </div>
            <div class="column3">
                <a href="sub-chapters/chapter03.jsp"><img src="../assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                 style="width:240px;height:300px;"></a>
                <a href="sub-chapters/chapter03.jsp">
                    <center> ΠΟΛΛΑΠΛΑΣΙΑ & ΔΙΑΙΡΕΤΕΣ</center>
                </a>
            </div>
            <div class="column4">
                <a href="sub-chapters/chapter04.jsp"><img src="../assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                 style="width:240px;height:300px;"></a>
                <a href="sub-chapters/chapter04.jsp">
                    <center> ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ </center>
                </a>
            </div>
        </div>
    </div>

</div>
<!------------------------------------ Close Main Container ------------------------------------------>


<!------------------------------------------ Link the js  -------------------------------------------->


<!----------------------------------------- Start of footer ------------------------------------------>
<footer style="position: fixed; bottom: 0%;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
<!---------------------------------------- Close of footer ------------------------------------------->

</body>
</html>
