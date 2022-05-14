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
        /*button with hover effect for modal for logout*/
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
        <!-- logo for navbar with our company name -->
        <div class="logo">
            ΒΕΜΠΛΗΧΑ
        </div>
        <!-- menu list will have a dropdown for when window size is too small -->
        <ul class="menu-list">
            <li>
                <!-- x icon to close menu list -->
                <div class="icon cancel-btn">
                    <i class="fa fa-close"></i>
                </div>
            </li>
            <!-- some buttons have dropdown for the different chapters -->
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
        <!-- if user is logged in then button shows different text -->
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
    <h2>ΜΑΘΗΜΑΤΙΚΑ</h2>
</div>
<!-- Close Header -->

<!-- Start Main Container -->
<!-- This will contain the text that will appear for explaining our site -->
<div class="content-area">
    <div class="wrapper" style="font-size: 20px;">
        <div class="title">Μαθηματικά Ε΄ Δημοτικού</div>
        <p>Ο σκοπός της διδασκαλίας των Μαθηματικών εντάσσεται στους γενικότερους σκοπούς της Εκπαίδευσης και αφορά τη
            συμβολή στην ολοκλήρωση της προσωπικότητας του μαθητή και την επιτυχή κοινωνική ένταξή του.
        </p>
        <!-- logo name -->
        <div style="margin:50px;"><img src="assets/vem.png" alt="logo" style="width:50%;"></div>

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
        
        <!-- quote -->
        <div style="padding-top: 25px;">
            <center><img src="assets/quote.png" alt="quote" style=" box-shadow: 2px 2px 4px #000000;  width: 80%;  height: auto;">
            </center>
        </div>

        <p style="text-align:center;">Η ενότητα που θα διδαχτείτε είναι η Ενότητα 2, με τα ακόλουθα τέσσερα κεφάλαια:<br>
            1. Η πρόσθεση και η αφαίρεση στους φυσικούς αριθμούς<br>
            2. Ο πολλαπλασιασμός στους φυσικούς αριθμούς<br>
            3. Κριτήρια διαιρετότητας<br>
            4. Η διαίρεση στους φυσικούς αριθμούς<br>
        </p>

        <!-- photoshopped image -->
        <div style="padding-top: 25px;">
            <center><img src="assets/b2.png" style="width: 60%;  height: auto;" alt="kids"></center>
        </div>
        <p>Μέσα από αυτήν την ιστοσελίδα θα μάθουμε να τα αγαπάμε και
            θα μπορούμε να λύσουμε όλες τις ασκήσεις που θα συναντήσουμε!</p>

        <!-- image for maths -->
        <a href="jsp/chapters.jsp"><img src="assets/bookcover_maths_main.jpg" alt="Μαθηματικά Ε' Δημοτικού"
                                        style="margin-top:50px; width:250px;height:350px;"></a>
        <div>
            <a href="jsp/chapters.jsp">Έλα να μάθουμε Μαθηματικά</a>
        </div>
        <br>
        <!-- our names -->
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
<!--
    The following script will control the color for the current page
    Because the navbar has sticky attribute added to it
    and the navbar colour changes when scrolling, current page's colour must change
    accordingly.
    Menu list current must always be salmon
    -->
<script>
    let element = document.getElementById("startPage");

    //salmon colour for when menu list is visible,
    //or for when user scrolls and navbar changes to salmon
    function salmonColour() {
        element.classList.add("current");
        element.classList.remove("current-for-start");
    }

    //blue colour for when start page is at the top
    function blueColour() {
        element.classList.add("current-for-start");
        element.classList.remove("current");
    }

    //colour changing according to width of window
    //when user minimizes the window, then the colour for current is salmon
    //but if user opens the width and scrolls up then colour must return to blue
    //otherwise colour should be salmon
    function changeColourWidth() {
        if (window.innerWidth < 1080) {
            salmonColour();
        } else if (this.scrollY < 20) {
            blueColour();
        } else {
            salmonColour();
        }
    }

    //if user scrolls then navbar should become sticky
    //if window is not minimised enough then current colour is blue
    //if it is minimised then current colour is salmon
    function changeColourScroll() {
        if (this.scrollY < 20 && window.innerWidth > 1080) {
            navbar.classList.remove("sticky");
            blueColour();
        } else if (this.scrollY < 20 && window.innerWidth < 1080) {
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
    //when loading we must check windows width
    window.onload = () => {
        changeColourWidth();
    }
</script>
<!-- web page element that displays on top when user wants to leave -->
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

