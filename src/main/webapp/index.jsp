<%@ page import="projectel.projectel.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Αρχική Σελίδα | SINP </title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/popup.css">
    <style>
        button {
            background-color: #5cafc6;
            border: none;
            color: white;
            padding: 16px 32px;
            text-align: center;
            font-size: 20px;
            margin: 8px 2px;
            transition-duration: 0.5s;
            cursor: pointer;
        }


        button:hover {
            background-color: #a4c4d1;
            color: #064e61;
        }
    </style>
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
                    <a href="jsp/chapters.jsp">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="jsp/sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                        <a href="jsp/sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="jsp/sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                        <a href="jsp/sub-chapters/chapter04.jsp">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="jsp/tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="jsp/testsChapter.jsp?chapter=1">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="jsp/testsChapter.jsp?chapter=2">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="jsp/testsChapter.jsp?chapter=3">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="jsp/testsChapter.jsp?chapter=4">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="jsp/testsChapter.jsp?chapter=5">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="jsp/statistics.jsp">Στατιστικά</a></li>
            <li><a href="jsp/games.jsp">Παιχνίδια</a></li>
        </ul>
        <div class="logout">
            <a id="log" <%if(!Login.isLoggedIn(session)){%>href="jsp/login.jsp"<%}%>>
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<!-- Close Top Nav -->

<!-- Start Header -->
<div class="banner-area">
    <h2>Μαθηματικά</h2>
</div>
<!-- Close Header -->

<!-- Start Main Container -->
<div class="content-area">
    <div class="wrapper" style="font-size: 20px;">
        <div class="title">Μαθηματικά Ε΄ Δημοτικού</div>
        <p>Ο σκοπός της διδασκαλίας των Μαθηματικών εντάσσεται στους γενικότερους σκοπούς της Εκπαίδευσης και αφορά τη
            συμβολή στην ολοκλήρωση της προσωπικότητας του μαθητή και την επιτυχή κοινωνική ένταξή του.
        </p>
        <div style="margin:50px;"><img src="assets/vem.png" alt="quote" style="width:50%;"></div>


        <p>Προσφέρουμε θεωρία και ασκήσεις μαθηματικών για την Ε' δημοτικού, καθώς και τη δυνατότητα να ελέγξετε τις
            γνώσεις σας πάνω σε ό,τι σας μάθαμε ή πιθανώς ήδη γνωρίζατε!</p>

        <h5 style="    background-color: pink;
    border-radius: 10px;
    margin-bottom: 15px;
    margin-top: 15px;
    padding: 2px;
    font-size: 18px;
    letter-spacing: 1px;
    padding-left: 20px;">Εάν συνδεθείτε, τότε θα έχετε τη δυνατότητα να βλέπετε τους βαθμούς σας στα κουίζ, καθώς και
            την πρόοδό σας.</h5>

        <div style="padding-top: 25px;">
            <center><img src="assets/quote.png" style=" box-shadow: 2px 2px 4px #000000;  width: 80%;  height: auto;">
            </center>
        </div>

        <p style="text-align:center;">Η ενότητα που θα διδαχτείτε είναι η Ενότητα 2, με τα ακόλουθα τέσσερα κεφάλαια:<br>
            1. Η πρόσθεση και η αφαίρεση στους φυσικούς αριθμούς<br>
            2. Ο πολλαπλασιασμός στους φυσικούς αριθμούς<br>
            3. Κριτήρια διαιρετότητας<br>
            4. Η διαίρεση στους φυσικούς αριθμούς<br>
        </p>
        <div style="padding-top: 25px;">
            <center><img src="assets/b2.png" style="width: 60%;  height: auto;"></center>
        </div>
        <p>Μέσα από αυτήν την ιστοσελίδα θα μάθουμε να τα αγαπάμε και
            θα μπορούμε να λύσουμε όλες τις ασκήσεις που θα συναντήσουμε!</p>
        <a href="jsp/chapters.jsp"><img src="assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                        style="margin-top:50px; width:250px;height:350px;"></a>
        <div>
            <a href="jsp/chapters.jsp">Έλα να μάθουμε Μαθηματικά</a>
        </div>
        <br>
        <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px"><h3 style="font-size: 18px;">Τα μέλη
            της ομάδας που δημιούργησαν αυτήν την ιστοσελίδα είναι(με αλφαβητική
            σειρά):</h3>
            <ul style="list-style: none">
                <li>
                    Βελάσκο Πάολα
                </li>
                <li>
                    Λήμνος Ιάσων
                </li>
                <li>
                    Μπίλη Σοφία
                </li>
                <li>
                    Χανιωτάκης Νικόλαος
                </li>
            </ul>
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
<script>
    <%if(Login.isLoggedIn(session)){%>
    // Get the modal
    let modal = document.getElementById("myModal");
    let choice = document.getElementById("choice");
    let log = document.getElementById("log");

    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    log.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href ="logout-servlet";
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

<!-- Close Script -->
</body>
</html>

