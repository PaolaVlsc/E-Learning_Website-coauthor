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
  <link rel="stylesheet" href="../css/tests_style.css">
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
      <a id="log" <%if(!Login.isLoggedIn(session)){%>href="login.jsp"<%}%>>
        <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
      </a>
    </div>
  </div>
</nav>
<script src="../js/app.js"></script>


<div class="main-wrap" style="padding-bottom: 100px;">
  <h1>Διάλεξε σε ποιο κεφάλαιο επιθυμείς να ελέγξεις τις γνώσεις σου!</h1>
    <button onclick="location.href='testsChapter.jsp?chapter=1'" >Πρόσθεση και Αφαίρεση</button><br>
    <button onclick="location.href='testsChapter.jsp?chapter=2'">Πολλαπλασιασμός στους<br>φυσικούς αριθμούς</button><br>
    <button onclick="location.href='testsChapter.jsp?chapter=3'">Τα κριτήρια διαιρετότητας</button><br>
    <button onclick="location.href='testsChapter.jsp?chapter=4'">Διαίρεση στους φυσικούς</button><br>
    <button onclick="location.href='testsChapter.jsp?chapter=5'">Δοκίμασε τις γνώσεις σου πάνω σε<br>όλα τα κεφάλαια!</button>
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

<footer style="position: fixed; bottom: 0;">
  <hr>
  <h3>Επικοινωνία</h3>
  <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
    <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
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
</body>
</html>
