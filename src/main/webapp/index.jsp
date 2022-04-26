<%@ page import="projectel.projectel.Login" %><%--
Created by IntelliJ IDEA.
User: user
Date: 20/4/2022
Time: 3:52 μ.μ.
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Αρχική Σελίδα | SINP </title>
    <link rel="stylesheet" href="css/style.css">
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
            <li><a id="startPage" class="current-for-start" href="index.jsp">Αρχική</a></li>

            <li>
                <div class="dropdown">
                    <a href="html/chapters.html">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="#">Πρόσθεση και Αφαίρεση</a>
                        <a href="#">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="#">Κριτήρια διαιρετότητας</a>
                        <a href="#">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="html/tests.html">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="#">Κεφάλαιο 1</a>
                        <a href="#">Κεφάλαιο 2</a>
                        <a href="#">Κεφάλαιο 3</a>
                        <a href="#">Κεφάλαιο 4</a>
                        <a href="#">Τελικό Τεστ</a>
                    </div>
                </div>
            </li>
            <li><a href="jsp/statistics.jsp">Στατιστικά</a></li>
        </ul>
        <div class="logout"><a href="<%=Login.isLoggedIn(session)?"logout-servlet":"jsp/login.jsp"%>">
            <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%></a></div>

    </div>
</nav>
<!-- Close Top Nav -->

<!-- Start Header -->
<div class="banner-area">
    <h2>ΨΗΦΙΑΚΗ ΤΑΞΗ</h2>
</div>
<!-- Close Header -->

<!-- Start Main Container -->
<div class="content-area">
    <div class="wrapper">
        <div class="quote">QUOTE FWTO ISWS? NAI</div>
        <div class="title">Μαθηματικά Ε΄ Δημοτικού</div>
        <p>Περιγραφή του site??? </p>
        <a href="html/chapters.html"><img src="assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                             style="width:250px;height:350px;"></a>
        <div>
            <a href="html/chapters.html">Έλα να μάθουμε Μαθηματικά</a>
        </div>
    </div>
</div>
<!-- Close Main Container -->

<!-- Start Footer -->
<footer>
    <hr>
    <h3>Επικοινωνία</h3>
    <p>
        <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000
    </p>
</footer>
<!-- Close Footer -->

<!-- Start Script -->
<script src="js/app.js"></script>
<script>
    let element = document.getElementById("startPage");

    function salmonColour() {
        element.classList.add("current");
        element.classList.remove("current-for-start");
    }

    function blueColour() {
        element.classList.add("current-for-start");
        element.classList.remove("current");
    }

    function changeColourWidth() {
        if (window.innerWidth < 868) {
            salmonColour();
        } else if (this.scrollY < 20) {
            blueColour();
        } else {
            salmonColour();
        }
    }

    function changeColourScroll() {
        if (this.scrollY < 20 && window.innerWidth > 868) {
            navbar.classList.remove("sticky");
            blueColour();
        } else if (this.scrollY < 20 && window.innerWidth < 868) {
            navbar.classList.remove("sticky");
            salmonColour();
        } else {
            navbar.classList.add("sticky");
            salmonColour();
        }

    }

    window.onresize = () => {
        changeColourWidth();
    }

    window.onscroll = () => {
        changeColourScroll()
    }
    window.onload = () => {
        changeColourWidth();
    }
</script>
<!-- Close Script -->

</body>
</html>

