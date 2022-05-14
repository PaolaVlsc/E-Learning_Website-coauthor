<%@ page import="projectel.projectel.Login" %>
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
    <link rel="stylesheet" href="../css/popup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!----------------------------------------- Start of navbar ------------------------------------------>
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
            <li><a href="../index.jsp">Αρχική</a></li>
            <li>
                <div class="dropdown">
                    <a class="current" href="chapters.jsp">Κεφάλαια Μαθηματικών</a>
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
        <!-- if user is logged in then button shows different text -->
        <div class="logout">
            <a id="log" <%if(!Login.isLoggedIn(session)){%>href="login.jsp"<%}%>>
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<!--------- Start: Js navbar ---------->
<script src="../js/app.js"></script>
<!-- The Modal -->
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
            location.href ="../logout-servlet";
        }
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    <%}%>
</script>
<script>
    //navbar is visible all the time
    navbar.classList.add("sticky");
</script>
<!---------- End: Js navbar ----------->
<!---------------------------------------- Close of navbar ------------------------------------------->

<!------------------------------------ Start Main Container ------------------------------------------>
<div class="mothership">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <!-- card placement for the chapters, that will be responsive -->
    <div class="cards">
        <div class="card">
            <a href="../jsp/sub-chapters/chapter01.jsp"><h2 class="card-title">ΠΡΟΣΘΕΣΗ & ΑΦΑΙΡΕΣΗ</h2>
                <img src="../assets/addsub.png"></a>

        </div>
        <div class="card">
            <a href="../jsp/sub-chapters/chapter02.jsp"><h2 class="card-title">ΠΟΛΛΑΠΛΑΣΙΑΣΜΟΣ ΣΤΟΥΣ ΦΥΣΙΚΟΥΣ</h2>
                <img src="../assets/mul1.png"
                     alt=""></a>

        </div>
        <div class="card">
            <a href="../jsp/sub-chapters/chapter03.jsp"><h2 class="card-title">ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ</h2>
                <img src="../assets/kritiria.png"
                     alt=""></a>
        </div>
        <div class="card" style="    margin-bottom: 250px;">
            <a href="../jsp/sub-chapters/chapter04.jsp"><h2 class="card-title">ΔΙΑΙΡΕΣΗ ΣΤΟΥΣ ΦΥΣΙΚΟΥΣ</h2>
                <img src="../assets/div.png"></a>
        </div>
    </div>
</div>
<!------------------------------------ Close Main Container ------------------------------------------>


<!------------------------------------------ Link the js  -------------------------------------------->


<!----------------------------------------- Start of footer ------------------------------------------>
<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
<!---------------------------------------- Close of footer ------------------------------------------->

</body>
</html>
