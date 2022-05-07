<%@ page import="projectel.projectel.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Τεστ | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/popup.css">
    <link rel="stylesheet" href="../css/quiz_style.css">
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
                        <a  class="../jsp/chapters.jsp" href="../jsp/chapters.jsp">Κεφάλαια Μαθηματικών</a>
                        <div class="dropdown-content">
                            <a href="../jsp/sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                            <a href="../jsp/sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                            <a href="../jsp/sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                            <a href="../jsp/sub-chapters/chapter04.jsp">Διαίρεση στους φυσικούς</a>
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
                <a id="log" <%if(!Login.isLoggedIn(session)){%>href="login.jsp"<%}%>>
                    <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
                </a>
            </div>
        </div>
    </nav>
    <!--------- Start: Js navbar ---------->
    <script src="../js/app.js"></script>
    <script>
        navbar.classList.add("sticky");
    </script>
    <!---------- End: Js navbar ----------->
    <!---------------------------------------- Close of navbar ------------------------------------------->
    <canvas id='myCanvas' style="position: absolute; left: 0%" width='1500' height='800'></canvas>
    <h1>Τέσταρε τις γνώσεις σου !</h1>
    <div class="quiz-container">
        <div id="quiz"></div>
    </div>
    <div class="popup" onclick="hidePopUp()">
        <span class="popuptext" id="myPopup"><a style="cursor: pointer;position: absolute;right: 12px;top: 0">&times;</a><br>ΜΠΡΑΒΟΟΟΟ<br><br> ΤΑ ΠΑΣ ΤΕΛΕΙΑ ΠΑΜΕΕ</span>
    </div>
    <br>
    <iframe name="content" style="display:none;">
    </iframe>
    <form action="" method="post" target="content">
        <button id="previous">Προηγούμενη ερώτηση</button>
        <button id="next">Επόμενη ερώτηση</button>
        <button type="submit" id="submit">Καταχώρηση απαντήσεων</button>
    </form>
    <div id="results"></div>
    <button id="backToTests">Επιστροφή στα Τεστ</button>
    <button id="tryAgain">Προσπάθησε ξανά</button>
    <button id="nextQuiz">Επόμενο Τεστ</button>
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
    <!--    Hide pop up -->
    <script>
        function hidePopUp(){
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("hide");
        }
    </script>
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
        // When the user clicks anywhere outside the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        <%}%>
    </script>
    <script src="../js/quiz.js"></script>
</body>
</html>
