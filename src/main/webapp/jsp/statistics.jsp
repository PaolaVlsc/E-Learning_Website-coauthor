<%@ page import="projectel.projectel.Statistics" %>
<%@ page import="projectel.projectel.Login" %><%--
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
    <title>Στατιστικά | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/statistics_style.css">
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
            <li><a class="current" href="../jsp/statistics.jsp">Στατιστικά</a></li>
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
    function toggleText(x) {
        let texts = document.getElementsByClassName(x);
        let i;
        for (i = 0; i < texts.length; i++) {
            let text = texts[i];
            if (text.style.display === "none") {
                text.style.display = "block";
            } else {
                text.style.display = "none";
            }
        }
    }
</script>

<div class="main-wrap">
    <div class="left-side">
        <br><br><h3>Τα κεφάλαια σου:</h3>
        <a href="statistics.jsp" style="padding-left:3em; color: #064e61"><u>Όλα τα κεφάλαια</u></a>

        <a href="#" onclick="toggleText('hiddenText1')" style="padding-left:3em;"><u>Κεφάλαιο 1</u></a>
        <a href="statisticsChapters.jsp?chapter=1" style="display: none; padding-left:6em;" class="hiddenText1">Βαθμοί</a>
        <!--<a href="#" style="display: none; padding-left:6em;" class="hiddenText1">Βραβεία</a>-->

        <a href="#" onclick="toggleText('hiddenText2')" style="padding-left:3em;"><u>Κεφάλαιο 2</u></a>
        <a href="statisticsChapters.jsp?chapter=2" style="display: none; padding-left:6em;" class="hiddenText2">Βαθμοί</a>

        <a href="#" onclick="toggleText('hiddenText3')" style="padding-left:3em;"><u>Κεφάλαιο 3</u></a>
        <a href="statisticsChapters.jsp?chapter=3" style="display: none; padding-left:6em;" class="hiddenText3">Βαθμοί</a>

        <a href="#" onclick="toggleText('hiddenText4')" style="padding-left:3em;"><u>Κεφάλαιο 4</u></a>
        <a href="statisticsChapters.jsp?chapter=4" style="display: none; padding-left:6em;" class="hiddenText4">Βαθμοί</a>

        <a href="#" onclick="toggleText('hiddenText5')" style="padding-left:3em;"><u>Επαναληπτικό</u></a>
        <a href="statisticsChapters.jsp?chapter=5" style="display: none; padding-left:6em;" class="hiddenText5">Βαθμοί</a>
    </div>
    <div class="right-side">
        <h2 style="color:#ef7f80;width:80%; text-align: center;">Οι καλύτεροι βαθμοί σου σε όλα τα κεφάλαια!</h2>
        <canvas id="myChart" style="width:70%;max-width:80%"></canvas>

        <script>
            let array =[];
            <%
                int i;
                request.setCharacterEncoding("UTF-8");
                int[] gradesChapters=new int[5];
                try{
                    for (i=1;i<=5;i++){
                        //String gradesChapters = Statistics.getMaxGrades(Integer.parseInt(request.getParameter("StudentId")),i);
                        String grades = Statistics.getMaxGrades(5,i);
                        if(grades==null){
                            gradesChapters[i-1] = 0;
                        }else{
                            gradesChapters[i-1] = Integer.parseInt(grades);
                        }
            %>
            array[<%= i-1 %>] = "<%= gradesChapters[i-1]%>";
            <%
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("../html/error.html");
                }
            %>
            let xValues = ["Κεφάλαιο 1", "Κεφάλαιο 2", "Κεφάλαιο 3", "Κεφάλαιο 4","Επανάληψη"];
            let yValues = [array[0], array[1], array[2], array[3], array[4]];
            let barColors = ["red", "green", "blue", "orange", "pink"];

            new Chart("myChart", {
                type: "horizontalBar",
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        //text: "Οι καλύτεροι βαθμοί σου σε όλα τα κεφάλαια!"
                    },
                    scales: {
                        xAxes: [{
                            ticks: {min: 0, max:10},
                            scaleLabel: {
                                display: true,
                                labelString: 'Βαθμός'
                            }
                        }]
                    }
                }
            });
        </script>
    </div>
</div>
<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p> <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>

</body>
</html>

