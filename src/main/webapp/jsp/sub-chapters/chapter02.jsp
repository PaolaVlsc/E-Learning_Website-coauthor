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
    <title>ΠΟΛΛΑΠΛΑΣΙΑΣΜΟΣ | SINP </title>
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
                <a  class="current" href="../../jsp/chapters.jsp">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="../../jsp/sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                        <a href="chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
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
            <li><a href="../games.jsp">Παιχνίδια</a></li>
        </ul>

        <div class="logout">
            <a href="<%=Login.isLoggedIn(session)?"../../logout-servlet":"../login.jsp"%>">
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
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
            ΜΑΘΑΙΝΟΥΜΕ ΤΟΝ ΠΟΛΛΑΠΛΑΣΙΑΣΜΟ ΣΤΟΥΣ ΦΥΣΙΚΟΥΣ ΑΡΙΘΜΟΥΣ!
        </div>
        <div class="wrapper1">
            <aside>
                <div class="sidebar1">
                    <h2>ΠΟΛΛΑΠΛΑΣΙΑΣΜΟΣ
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
                        <center>ΠΟΛΛΑΠΛΑΣΙΑΣΜΟΣ</center>
                    </h4>

                    <b> Ορισμοί: </b>
                    <br>
                    <ul style="padding: 20px;">
                        <li><b>Πολλαπλασιασμός</b> είναι η πράξη με την οποία από δύο φυσικούς αριθμούς βρίσκουμε έναν
                            τρίτο φυσικό αριθμό, ο οποίος λέγεται γινόμενο των αριθμών αυτών.
                        </li>
                        <li>Οι αριθμοί οι οποίοι πολλαπλασιάζονται λέγονται <b>παράγοντες του γινομένου.</b></li>
                    </ul>
                    <b> Παράδειγμα: </b><br>
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/mul_ex_01.png" style=" box-shadow: 2px 2px 4px #000000;  width: 35%;
  height: auto;"></center>
                    </div>

                    <b>Ιδιότητες:</b><br>

                    <ul style="padding: 20px;  border: 2px solid skyblue; border-radius: 5px; padding: 15px; padding-left: 50px;margin-bottom: 30px;margin-top: 30px; ">
                        <li> Το 1 όταν πολλαπλασιαστεί με έναν φυσικό αριθμό δεν τον μεταβάλλει.
                            π.χ. 4 * 1 = 1 * 4 = 4
                        </li>


                        <li><b>Αντιμεταθετική ιδιότητα:</b> Αν αλλάξουμε τη σειρά των αριθμών (παραγόντων), τότε το
                            γινόμενο
                            τους παραμένει ίδιο.
                        </li>

                        <li><b>Προσεταιριστική ιδιότητα: </b>Μπορούμε να αντικαταστήσουμε παράγοντες με το γινόμενό τους
                            ή να
                            αναλύσουμε έναν παράγοντα σε γινόμενο.

                            π.χ. 5 * ( 4 * 7 ) = ( 5 * 4 ) * 7
                        </li>

                        <li><b>Επιμεριστική ιδιότητα:</b> Ισχύει η επιμεριστική ιδιότητα του πολλαπλασιασμού ως προς την
                            πρόσθεση και την αφαίρεση.

                            π.χ. 5 * ( 4 + 7 ) = 5 * 4 + 5 * 7 και 5 * ( 4 - 7 ) = 5 * 4 - 5 * 7
                        </li>
                    </ul>


                    <center>
                        <table class="content-table-antim-proset">
                            <thead>
                            <tr>
                                <th>Πίνακας Πολλαπλασιασμού</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><img src="../../assets/chapter02/mul_ex_02.png"
                                         style="box-shadow: 2px 2px 4px #000000; max-width: 755px; heigh: auto;"></td>
                            </tr>
                            </tbody>
                        </table>
                    </center>


                    Ο πολλαπλασιασμός είναι ένας γρήγορος τρόπος να κάνεις μια πρόσθεση που επαναλαμβάνεται ξανά και
                    ξανά.
                    <ul style="padding-left: 20px">
                        <li><b>Πρόσθεση:</b> 3 + 3 + 3 + 3 + 3 = 15
                        </li>
                        <li><b>Πολλαπλασιασμός:</b> 3 x 5 = 15
                        </li>
                    </ul>

                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/mul_ex_03.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></center>
                    </div>

                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter02/mul_ex_04.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></center>
                    </div>


                    <h4>Εμβάθυνε τις γνώσεις σου περισσότερο για τον πολλαπλασιασμό!</h4>
                    <center>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/FMdYauf-wLs"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </center>
                </section>
                <br>
                <!------- END THEORY PART------>

                <section id="exercises">
                    <h1 style="color: rgb(10, 132, 100)">Ασκήσεις / Παραδείγματα</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <h4 style="text-decoration: underline;">Πώς κάνω έναν πολλαπλασιασμό;</h4>

                    <ul style="padding-left: 30px">
                        <li style="text-decoration: underline; font-weight: bold; padding-bottom: 10px ">
                            Με τον αλγόριθμο του πολλαπλασιασμού
                            <div style="padding-top: 25px;">
                                <center><img src="../../assets/chapter02/mul_ex_05.png" style=" box-shadow: 2px 2px 4px #000000;  width: 60%;
  height: auto;"></center>
                            </div>
                        </li>
                        <li style="text-decoration: underline; font-weight: bold; ">
                            Με τη μέθοδο σταυρού
                            <div style="padding-top: 25px;">
                                <center><img src="../../assets/chapter02/mul_ex_06.png" style=" box-shadow: 2px 2px 4px #000000;  width: 40%;
  height: auto;"></center>
                            </div>
                        </li>
                    </ul>

                    <!-- Ασκήσεις -->
                    <h4>
                        Υποδειγματική εφαρμογή #1.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <b><i>Εκφώνηση:</i></b><br>Ένας υπάλληλος παίρνει για κάθε εβδομάδα που εργάζεται 250 €. Πόσα €
                        παίρνει τον μήνα; <br>
                        <b>
                            <i>Λύση:</i></b><br>
                        <ul style="list-style: none;">
                            <li>4 x 250 € = 1.000 €</li>
                        </ul>
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #2.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <b><i>Εκφώνηση:</i></b><br>Η Μαρία έχει 6 βόλους. Ο Γιάννης έχει διπλάσιους βόλους από τη Μαρία.
                        Πόσους βόλους έχει ο Γιάννης; <br>
                        <b>
                            <i>Λύση:</i></b><br>
                        <ul style="list-style: none;">
                            <li>2 x 6 βόλοι = 12 βόλοι.</li>
                        </ul>
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #3.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/mul_ex_07.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%;
  height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #4.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/mul_ex_08.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #5.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/mul_ex_09.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #6.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/mul_ex_10.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>


                    <h4>
                        Υποδειγματική εφαρμογή #7.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter02/mul_ex_11.png"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 80%; height: auto;"></center>
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
                        <center><a href="../quiz.jsp"><img src="../../assets/chapter02/mul1.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></a></center>
                    </div>

                </section>
                <div class="center">

                    <button type="button" class="slide" onclick="location.href='chapter03.jsp'">
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
