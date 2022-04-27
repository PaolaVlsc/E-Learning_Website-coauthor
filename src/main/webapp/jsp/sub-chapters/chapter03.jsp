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
    <title>ΠΟΛΛΑΠΛΑΣΙΑ & ΔΙΑΙΡΕΤΕΣ | SINP </title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/chapter.css">
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
            <li><a href="../../index.jsp">Αρχική</a></li>
            <li>
                <div class="dropdown">
                    <a class="current" href="../../jsp/chapters.jsp">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="../../jsp/sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                        <a href="../../jsp/sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="chapter03.jsp">Κριτήρια διαιρετότητας</a>
                        <a href="chapter04.jsp">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="../../jsp/tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="../quiz.jsp">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="../quiz.jsp">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="../quiz.jsp">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="../quiz.jsp">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="../quiz.jsp">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="../../jsp/statistics.jsp">Στατιστικά</a></li>
        </ul>

        <div class="logout">
            <a href="<%=Login.isLoggedIn(session)?"logout-servlet":"../login.jsp"%>">
                <i class="fa fa-user-circle"></i><%=Login.isLoggedIn(session) ? "Αποσύνδεση" : "Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<!--------- Start: Js navbar ---------->
<script src="../../js/app.js"></script>
<script>
    navbar.classList.add("sticky");
</script>
<!---------- End: Js navbar ----------->
<!---------------------------------------- Close of navbar ------------------------------------------->
<div class="mothership">
    <div class="container1">
        <div class="my_header">
            ΕΛΑ ΝΑ ΜΑΘΟΥΜΕ ΤΑ ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ ΠΑΡΕΑ !
        </div>
        <div class="wrapper1">
            <aside>
                <div class="sidebar1">
                    <h2>ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ
                    </h2>
                    <br>
                    <hr>
                    <br>
                    <ul>
                        <!--<li class="active"><a href="#">Home</a></li>-->
                        <a href="#theory">
                            <li class="theory active"><h4>Θεωρία</h4></li>
                        </a>
                        <a href="#exercises">
                            <li class="exercises"><h4>Ασκήσεις</h4></li>
                        </a>
                        <a href="#tests">
                            <li class="tests"><h4>Τεστ</h4></li>
                        </a>
                    </ul>
                </div>
            </aside>
            <!----------------------------------------- Start of main body ------------------------------------------>

            <div class="main-body-chapter">

                <!-------A PART------>
                <section id="theory">
                    <h1 style="color: rgb(10, 132, 100)">Θεωρία</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <h4>
                        <center>ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ</center>
                    </h4>

                    <b> Ορισμοί: </b>
                    <br>
                    <ul style="padding: 20px;">
                        <li> . <b>Κριτήρια διαιρετότητας </b> λέγονται οι κανόνες με τους οποίους μπορώ να συμπεράνω
                            χωρίς να κάνω τη διαίρεση, . <b>αν ένας φυσικός αριθμός διαιρείται με κάποιον άλλον </b>.
                        </li>
                    </ul>
                    <br>

                    <h5>
                        Κριτήριο διαιρετότητας του 2
                    </h5>

                    Ένας φυσικός αριθμός διαιρείται με το 2, <b>όταν το τελευταίο του ψηφίο είναι:
                    0, 2, 4, 6 ή 8. (δηλαδή οι ζυγοί ή άρτιοι).</b>

                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-03.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 35%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->

                    <h5> Κριτήριο διαιρετότητας του 5</h5>

                    Ένας φυσικός αριθμός διαιρείται με το 5, <b>όταν το τελευταίο του ψηφίο είναι:
                    0 ή 5.</b>
                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-04.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->

                    <h5> Κριτήριο διαιρετότητας του 10, 100, 1.000</h5>

                    Ένας φυσικός αριθμός διαιρείται με το 10, <b>όταν το τελευταίο του ψηφίο είναι: 0.</b>
                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-05.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->

                    <h5>Κριτήριο διαιρετότητας του 3 και 9</h5>
                    Με το 3 διαιρούνται οι αριθμοί που <b>το άθροισμα των ψηφίων τους είναι 3,6 ή 9.</b> Με το 9
                    διαιρούνται οι
                    αριθμοί που <b>το άθροισμα των ψηφίων τους είναι 9.</b>
                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-06.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->

                    <h5>Κριτήριο διαιρετότητας του 4</h5>
                    Με το 4 διαιρούνται οι αριθμοί που <b>τα δύο τελευταία τους ψηφία διαιρούνται με το 4 ή είναι
                    00.</b>
                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-07.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->

                    <h5>Κριτήριο διαιρετότητας του 25</h5>
                    Με το 25 διαιρούνται οι αριθμοί που <b>τα δύο τελευταία τους ψηφία διαιρούνται με το 25 ή είναι
                    00.</b>
                    <!-- START image  -->
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/kritiria-diairetothtas-08.png" style=" border-radius: 25px;
  border: 6px solid #73AD21; box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                    </div>
                    <!-- END image  -->


                    <h4>Δες το βίντεο για να εμβαθύνεις τις γνώσεις σου περισσότερο</h4>
                    <center>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/FL2ZkqdiaZY"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </center>
                </section>
                <br>
                <!------- END A PART------>

                <section id="exercises">
                    <h1 style="color: rgb(10, 132, 100)">Ασκήσεις / Παραδείγματα</h1>
                    <hr style="color: rgb(10, 132, 100)">

                    <h4>
                        Υποδειγματική εφαρμογή #1.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <b><i>Τσεκάρω αυτά που είναι σωστά</i></b>
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 25px;">
                            <center><img src="../../assets/chapter02/kritiria-diairetothtas-02.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%;
  height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <!--NIOA-->
                    <h4>
                        Υποδειγματική εφαρμογή #2.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <h6>Παραδείγματα κριτήρια διαιρετότητας του 2</h6>

                        <ul class="paradeigmata">
                            <li> Ο αριθμός 254 διαιρείται με το 2, γιατί το τελευταίο ψηφίο του είναι 4.</li>
                            <li> Ο αριθμός 3.256 διαιρείται με το 2, γιατί το τελευταίο ψηφίο του είναι 6.</li>
                            <li> Ο αριθμός 1.258 διαιρείται με το 2, γιατί το τελευταίο ψηφίο του είναι 8.</li>
                        </ul>

                    </div>
                    <!-- END NIAOU -->

                    <h4>
                        Υποδειγματική εφαρμογή #3.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">

                        <h6> Παραδείγματα κριτήρια διαιρετότητας του 5</h6>
                        <ul class="paradeigmata">
                            <li>Ο αριθμός 3.250 διαιρείται με το 5, γιατί το τελευταίο ψηφίο του είναι 0.</li>
                            <li>Ο αριθμός 255 διαιρείται με το 5, γιατί το τελευταίο ψηφίο του είναι 5.</li>
                        </ul>
                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #4.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">


                        <h6>Παραδείγματα κριτήρια διαιρετότητας του 10, 100, 1.000</h6>
                        <ul class="paradeigmata">
                            <li>Ο αριθμός 250 διαιρείται με το 10, γιατί το τελευταίο ψηφίο του είναι 0.</li>
                            <li> Ένας φυσικός αριθμός διαιρείται με το 100, όταν τα 2 τελευταία του ψηφία του είναι:
                                00.
                            </li>
                            <li> Ένας φυσικός αριθμός διαιρείται με το 1.000, όταν τα 3 τελευταία του ψηφία του είναι:
                                000.
                            <li> Ένας φυσικός αριθμός διαιρείται με το 100, όταν τα 2 τελευταία του ψηφία του είναι:
                                00.
                            </li>
                        </ul>
                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #5.
                    </h4>
                    <h6 style="margin-bottom: 5px;"> Παραδείγματα κριτήρια διαιρετότητας του 3</h6>

                    <div class="app01"
                         style="border: 2px solid skyblue; border-radius: 5px; padding: 5px; margin-bottom: 10px">

                        Ο αριθμός 3.252 διαιρείται με το 3, γιατί το άθροισμα των ψηφίων του που είναι το 12 διαιρείται
                        ακριβώς με το 3:
                        <ul class="paradeigmata" style="list-style: none; padding-left: 30px">
                            <li>3 + 2 + 5 + 2 = 12</li>
                            <li>12 : 3 = 4</li>
                        </ul>
                    </div>
                    <div class="app01"
                         style="border: 2px solid skyblue; border-radius: 5px; padding: 5px; margin-bottom: 10px ">

                        Ο αριθμός 450 διαιρείται με το 3, γιατί το άθροισμα των ψηφίων του που είναι το 9 διαιρείται
                        ακριβώς με το 3:
                        <ul class="paradeigmata" style="list-style: none; padding-left: 30px">
                            <li>4 + 5 + 0 = 9</li>
                            <li>9 : 3 = 3</li>
                        </ul>
                    </div>
                    <div class="app01"
                         style="border: 2px solid skyblue; border-radius: 5px; padding: 5px; margin-bottom: 10px;">

                        Ο αριθμός 111 διαιρείται με το 3, γιατί το άθροισμα των ψηφίων του που είναι το 3 διαιρείται
                        ακριβώς με το 3:
                        <ul class="paradeigmata" style="list-style: none; padding-left: 30px">
                            <li>1 + 1 + 1 = 3</li>
                            <li>3 : 3 = 1</li>
                        </ul>

                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #6.
                    </h4>
                    <h6 style="margin-bottom: 5px;"> Παραδείγματα κριτήρια διαιρετότητας του 9</h6>

                    <div class="app01"
                         style="border: 2px solid skyblue; border-radius: 5px; padding: 5px; margin-bottom: 10px">

                        Ο αριθμός 9.252 διαιρείται με το 9, γιατί το άθροισμα των ψηφίων του που είναι το 18 διαιρείται
                        ακριβώς με το 3:
                        <ul class="paradeigmata" style="list-style: none; padding-left: 30px">
                            <li>9 + 2 + 5 + 2 = 18

                            </li>
                            <li>18 : 9 = 2</li>
                        </ul>
                    </div>
                    <div class="app01"
                         style="border: 2px solid skyblue; border-radius: 5px; padding: 5px; margin-bottom: 10px ">

                        Ο αριθμός 818.181 διαιρείται με το 9, γιατί το άθροισμα των ψηφίων του που είναι το 27
                        διαιρείται ακριβώς με το 9:
                        <ul class="paradeigmata" style="list-style: none; padding-left: 30px">
                            <li>8 + 1 + 8 + 1 + 8 + 1 = 27</li>
                            <li> 27 : 9 = 3</li>
                        </ul>
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #7.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/kritiria-diairetothtas-01.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%;
  height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                </section>
                <br>

                <section id="tests">
                    <h1 style="color: rgb(10, 132, 100)">Έλεγξε τις γνώσεις σου</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <br>
                    <div class="test-prosthesh" style="padding-top: 25px;padding-bottom: 25px;   border: 2px solid skyblue;
  border-radius: 5px;">
                        <center><a href="../quiz.jsp"><img src="../../assets/chapter03/niaou01.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></a></center>
                    </div>

                </section>
                <div class="center">

                    <button type="button" class="slide" onclick="location.href='chapter04.jsp'">
                        <div>Επόμενο Μάθημα !</div>
                    </button>
                    </divv>
                </div>
            </div>

            <!----------------------------------------- Close of main body ------------------------------------------>
        </div>


    </div>
</div>
<!-- Link the js -->
<script src="../../js/subchapters.js"></script>

<footer>
    <hr>
    <h3>Επικοινωνία</h3>
    <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>

</body>
</html>
