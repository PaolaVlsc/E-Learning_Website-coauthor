<%@ page import="projectel.projectel.Statistics" %>
<%@ page import="projectel.projectel.Login" %>
<%@ page import="java.util.List" %>
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
            <li><a href="../jsp/games.jsp">Παιχνίδια</a></li>
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
</script>
<%
    int chapter = Integer.parseInt(request.getParameter("chapter"));//get chapter id
%>
<div class="main-wrap">
    <!--
         left side will have the different links for the different chapters
         the current chapter will be blue
     -->
    <div class="left-side">
        <br><br><h3>Οι βαθμοί στα κεφάλαια σου:</h3>
        <a href="statistics.jsp" style="padding-left:3em;"><u>Όλα τα κεφάλαια</u></a>
        <a href="statisticsChapters.jsp?chapter=1" style="padding-left:3em; <%if(chapter == 1) out.print("color: #5cafc6");%>"><u>Πρόσθεση και αφαίρεση</u></a>
        <!--<a href="#" style="display: none; padding-left:6em;" class="hiddenText1">Βραβεία</a>-->
        <a href="statisticsChapters.jsp?chapter=2" style="padding-left:3em; <%if(chapter == 2) out.print("color: #5cafc6");%>"><u>Πολλαπλασιασμός</u></a>

        <a href="statisticsChapters.jsp?chapter=3" style="padding-left:3em; <%if(chapter == 3) out.print("color: #5cafc6");%>"><u>Κριτήρια διαιρετότητας</u></a>

        <a href="statisticsChapters.jsp?chapter=4" style="padding-left:3em; <%if(chapter == 4) out.print("color: #5cafc6");%>"><u>Διαίρεση</u></a>


        <a href="statisticsChapters.jsp?chapter=5" style="padding-left:3em;  <%if(chapter == 5) out.print("color: #5cafc6"); %>"><u>Επαναληπτικό</u></a>

    </div>
    <!--
        the right side will have a line graph with all the grades the student has
        from the different chapters
    -->
    <div class="right-side">
        <%
            request.setCharacterEncoding("UTF-8");
            int i=1;
            List<Integer> list = Statistics.getAllChapterGrades(Integer.parseInt((String)session.getAttribute("userId")),chapter);
            //if there are no grades in current chapter
            if(list.isEmpty()){
        %>
                <div><h1 style="color:#ef7f80;width:80%;">Δεν έχεις γράψει κάποιο διαγώνισμα σε αυτό το κεφάλαιο!</h1></div>
        <%
            }else if(chapter!=5){ //if chapter is not the final test
        %>
            <h2 style="color:#ef7f80;width:80%; text-align: center;">Οι βαθμοί σου στο κεφάλαιο: <%
                //print the different names of chapters depending on the link
                if(chapter == 1) out.print("Πρόσθεση και αφαίρεση");
                else if(chapter == 2) out.print("Πολλαπλασιασμός");
                else if(chapter == 3) out.print("Κριτήρια διαιρετότητας");
                else if(chapter == 4) out.print("Διαίρεση");

            %>!</h2>
        <%
            }else{//if chapter is the final test
        %>
            <h2 style="color:#ef7f80;width:80%; text-align: center;">Οι βαθμοί σου στο επαναληπτικό κεφάλαιο!</h2>
        <%
            }
        %>
        <canvas id="myChart" style="width:70%;max-width:80%"></canvas>

        <script>
            let xValues=[];
            let yValues=[];
            <%
                //if there are grades in list then
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
                        display: true
                    },
                    scales: {
                        yAxes: [{
                            ticks: {min: 0, max:10},
                            scaleLabel: {
                                display: true,
                                labelString: 'Βαθμοί'
                            }
                        }]
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

