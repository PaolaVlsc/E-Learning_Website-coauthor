<%@ page import="projectel.projectel.Statistics" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 2:14 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
                    <a href="chapters.html">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="sub-chapters/chapter01.html">Πρόσθεση και Αφαίρεση</a>
                        <a href="sub-chapters/chapter02.html">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="sub-chapters/chapter03.html">Κριτήρια διαιρετότητας</a>
                        <a href="sub-chapters/chapter04.html">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="../html/tests.html">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="#">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="#">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="#">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="#">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="#">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a class="current" href="../jsp/statistics.jsp">Στατιστικά</a></li>
        </ul>
        <div class="logout"><a href="#">
            <i class="fa fa-user-circle"></i>Αποσύνδεση</a></div>

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
<%
    int chapter = Integer.parseInt(request.getParameter("chapter"));
%>
<div class="main-wrap">
    <div class="left-side">
        <br><br><h3>Τα κεφάλαια σου:</h3>
        <%
            if(chapter == 1){
        %>
                <a href="#" onclick="toggleText('hiddenText1')" style="padding-left:3em; color: #064e61"><u>Κεφάλαιο 1</u></a>
                <a href="statisticsChapters.jsp?chapter=1" style="padding-left:6em; color: #5cafc6" class="hiddenText1" >Βαθμοί</a>
        <%
            }else{
        %>
                <a href="#" onclick="toggleText('hiddenText1')" style="padding-left:3em;"><u>Κεφάλαιο 1</u></a>
                <a href="statisticsChapters.jsp?chapter=1" style="display: none; padding-left:6em;" class="hiddenText1">Βαθμοί</a>
        <%
            }
        %>
        <!--<a href="#" style="display: none; padding-left:6em;" class="hiddenText1">Βραβεία</a>-->

        <%
            if(chapter == 2){
        %>
                <a href="#" onclick="toggleText('hiddenText2')" style="padding-left:3em; color: #064e61"><u>Κεφάλαιο 2</u></a>
                <a href="statisticsChapters.jsp?chapter=2" style="padding-left:6em; color: #5cafc6" class="hiddenText2">Βαθμοί</a>
        <%
            }else{
        %>
                <a href="#" onclick="toggleText('hiddenText2')" style="padding-left:3em;"><u>Κεφάλαιο 2</u></a>
                <a href="statisticsChapters.jsp?chapter=2" style="display: none; padding-left:6em;" class="hiddenText2">Βαθμοί</a>
        <%
            }
        %>
        <%
            if(chapter == 3){
        %>
                <a href="#" onclick="toggleText('hiddenText3')" style="padding-left:3em;  color: #064e61"><u>Κεφάλαιο 3</u></a>
                <a href="statisticsChapters.jsp?chapter=3" style="padding-left:6em; color: #5cafc6" class="hiddenText3">Βαθμοί</a>
        <%
            }else{
        %>
                <a href="#" onclick="toggleText('hiddenText3')" style="padding-left:3em;"><u>Κεφάλαιο 3</u></a>
                <a href="statisticsChapters.jsp?chapter=3" style="display: none; padding-left:6em;" class="hiddenText3">Βαθμοί</a>
        <%
            }
        %>
        <%
            if(chapter == 4){
        %>
                <a href="#" onclick="toggleText('hiddenText4')" style="padding-left:3em; color: #064e61"><u>Κεφάλαιο 4</u></a>
                <a href="statisticsChapters.jsp?chapter=4" style="padding-left:6em; color: #5cafc6" class="hiddenText4">Βαθμοί</a>
        <%
            }else{
        %>
                <a href="#" onclick="toggleText('hiddenText4')" style="padding-left:3em;"><u>Κεφάλαιο 4</u></a>
                <a href="statisticsChapters.jsp?chapter=4" style="display: none; padding-left:6em;" class="hiddenText4">Βαθμοί</a>
        <%
            }
        %>
        <%
            if(chapter == 5){
        %>
                <a href="#" onclick="toggleText('hiddenText5')" style="padding-left:3em;  color: #064e61"><u>Επανάληψη</u></a>
                <a href="statisticsChapters.jsp?chapter=5" style="padding-left:6em; color: #5cafc6" class="hiddenText5">Βαθμοί</a>
        <%
            }else{
        %>
                <a href="#" onclick="toggleText('hiddenText5')" style="padding-left:3em;"><u>Επανάληψη</u></a>
                <a href="statisticsChapters.jsp?chapter=5" style="display: none; padding-left:6em;" class="hiddenText5">Βαθμοί</a>
        <%
            }
        %>
    </div>

    <div class="right-side">
        <%
            request.setCharacterEncoding("UTF-8");
            int i=1;
            List<Integer> list = Statistics.getAllChapterGrades(1,chapter);
            if(list.isEmpty()){
        %>
                <div><h1 style="color:#ef7f80;width:80%;">Δεν έχεις γράψει κάποιο διαγώνισμα σε αυτό το κεφάλαιο!</h1></div>
        <%
            }else{
        %>
            <h2 style="color:#ef7f80;width:80%; text-align: center;">Οι βαθμοί σου στο κεφάλαιο <%=chapter%>!</h2>
        <%
            }
        %>
        <canvas id="myChart" style="width:70%;max-width:80%"></canvas>

        <script>
            let xValues=[];
            let yValues=[];
            <%
                if(!list.isEmpty()){
                    for (Integer j : list){
            %>
            yValues.push(<%=j%>);
            xValues.push("Προσπάθεια <%=i%>");
            <%
                        i++;
                    }
            %>
            new Chart("myChart", {
                type: "line",
                padding: {
                    left: 50,
                },
                data: {
                    labels: xValues,
                    datasets: [{
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: yValues,
                        pointRadius: 8,
                        pointHoverRadius: 8
                    }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        //text: "Οι βαθμοί σου στο κεφάλαιο <%=chapter%>!",
                    },
                    scales: {
                        yAxes: [{
                            ticks: {min: 0, max:10},
                            scaleLabel: {
                                display: true,
                                labelString: 'Βαθμοί'
                            }
                        }],
                        /*xAxes: [{
                            scaleLabel: {
                                display: true,
                                labelString: 'Προσπάθειες'
                            }
                        }],*/
                    }
                }
            });
            <%
                }
            %>
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

