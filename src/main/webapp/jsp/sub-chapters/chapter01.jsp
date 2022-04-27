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
<html lang="en" xmlns="http://www.w3.org/1999/html">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ΠΡΟΣΘΕΣΗ & ΑΦΑΙΡΕΣΗ | SINP </title>
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
                        <a href="chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
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
            ΕΛΑ ΝΑ ΜΑΘΟΥΜΕ ΤΗΝ ΠΡΟΣΘΕΣΗ ΠΑΡΕΑ !
        </div>
        <!--<div class="my_header2">
          <pre> </pre>
        </div>
        -->
        <div class="wrapper1">
            <aside>
                <div class="sidebar1">
                    <h2>ΠΡΟΣΘΕΣΗ ΚΑΙ ΑΦΑΙΡΕΣΗ
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
                        <center>ΠΡΟΣΘΕΣΗ</center>
                    </h4>

                    <b> Ορισμοί: </b>
                    <br>
                    <ul style="padding: 20px;">
                        <li> Πρόσθεση είναι η πράξη με την οποία από δύο φυσικούς αριθμούς βρίσκουμε έναν τρίτο φυσικό
                            αριθμό, ο οποίος λέγεται <b>άθροισμα</b>.
                        </li>
                        <li>Οι αριθμοί οι οποίοι προστίθενται λέγονται <b>προσθετέοι</b>.</li>
                    </ul>
                    <b> Παράδειγμα: </b><br>
                    <div class="paradeigma-prosthesh-01" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/OK.png" style=" box-shadow: 2px 2px 4px #000000;  width: 35%;
  height: auto;"></center>
                    </div>

                    <b>Ιδιότητες:</b><br>
                    <ul style="padding: 20px;">
                        <li>Το 0 όταν προστεθεί σε ένα φυσικό αριθμό, δεν το μεταβάλλει. πχ 5 + 0 = 0 + 5 = 5</li>
                        <li>Αντιμεταθετική ιδιότητα: Αν αλλάξουμε τη σειρά των αριθμών (προσθετέων), τότε το άθροισμα
                            τους δε μεταβάλλεται.
                        </li>
                        <li>Προσεταιριστική ιδιότητα: Για να προσθέσουμε πολλούς αριθμούς, προσθέτουμε τους δύο πρώτους,
                            στο άθροισμά τους προσθέτουμε τον τρίτο, στο νέο άθροισμα προσθέτουμε τον τέταρτο κ.ο.κ. Αν
                            αλλάξουμε τα ζευγάρια των προσθετέων, το άθροισμα δε μεταβάλλεται
                        </li>
                        <li>Μπορούμε να αντικαθιστούμε προσθετέους με το άθροισμά τους ή να αναλύουμε ένα προσθετέο σε
                            άθροισμα.
                        </li>
                    </ul>
                    <center>
                        <table class="content-table-antim-proset">
                            <thead>
                            <tr>
                                <th>Αντιμεταθετική</th>
                                <th>Προσεταιριστική</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><img src="../../assets/chapter01/antimetathetiki.png"
                                         style="box-shadow: 2px 2px 4px #000000;"></td>
                                <td><img src="../../assets/chapter01/prosetairistiki.png"
                                         style="box-shadow: 2px 2px 4px #000000;"></td>
                            </tr>
                            </tbody>
                        </table>
                    </center>


                    <h4>
                        <center>ΑΦΑΙΡΕΣΗ</center>
                    </h4>
                    <b> Ορισμοί: </b>
                    <br>
                    <ul style="padding: 20px;">
                        <li> Αφαίρεση είναι η πράξη με την οποία από δύο φυσικούς αριθμούς, τον μειωτέο και τον
                            αφαιρετέο, βρίσκουμε έναν τρίτο φυσικό αριθμό, που λέγεται <b>διαφορά </b>.
                        </li>
                    </ul>
                    <b> Παράδειγμα: </b><br>
                    <div class="paradeigma-sub-01" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/sub-example-01.png" style=" box-shadow: 2px 2px 4px #000000;  width: 35%;
  height: auto;"></center>
                    </div>
                    <br>
                    <h4>
                        <center>Σχέση Πρόσθεσης & Αφαίρεσης.</center>
                    </h4>
                    <b>Η επαλήθευση (έλεγχος) της πρόσθεσης και της αφαίρεσης:</b>

                    <br>
                    <ol style="padding: 20px;">
                        <li>Επαλήθευση πρόσθεσης με δύο προσθετέους:
                        </li>
                        <ul style="padding-left: 40px;">
                            <li><b>Α' τρόπος: </b>με αφαίρεση του α΄ προσθετέου από το
                                άθροισμα στην οποία πρέπει να βρούμε τον β΄ προσθετέο.
                            </li>
                            <li><b>Β' τρόπος: </b>με αφαίρεση
                                του β΄ προσθετέου από το άθροισμα στην οποία πρέπει να βρούμε τον α΄ προσθετέο σαν
                                αποτέλεσμα.
                            </li>
                        </ul>
                        <b> Παράδειγμα: </b><br>
                        <div class="epalitheysi-prostheshs-me-dyo-prostheteous" style="padding-top: 25px;">
                            <center><img src="../../assets/chapter01/epalitheysi-prostheshs-me-dyo-prostheteous.jpg"
                                         style=" box-shadow: 2px 2px 4px #000000;  width: 75%;
  height: auto;"></center>
                        </div>
                        <br>
                        <li>Επαλήθευση αφαίρεσης με μειωτέο και ένα αφαιρετέο:
                        </li>
                        <ul style="padding-left: 40px;">
                            <li><b>Α' τρόπος: </b>με πρόσθεση του αφαιρετέου με τη διαφορά στην οποία πρέπει να βρούμε
                                τον μειωτέο σαν αποτέλεσμα.
                            </li>
                            <li><b>Β' τρόπος: </b>με αφαίρεση της διαφοράς από τον μειωτέο στην οποία πρέπει να βρούμε
                                τον αφαιρετέο σαν αποτέλεσμα.
                            </li>
                        </ul>
                        <b> Παράδειγμα: </b><br>
                        <div class="epalithefsi-afaireshs-me-meiwteo-kai-ena-afaireteo" style="padding-top: 25px;">
                            <center><img
                                    src="../../assets/chapter01/epalithefsi-afaireshs-me-meiwteo-kai-ena-afaireteo.jpg"
                                    style=" box-shadow: 2px 2px 4px #000000;  width: 75%;
  height: auto;"></center>
                        </div>
                        <br>
                    </ol>

                    <b>Μια πρόσθεση μπορεί να είναι η δοκιμή της αφαίρεσης.</b>
                    <div class="1-7-orig-orig_orig" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/1-7-orig-orig_orig.png"
                                     style=" box-shadow: 2px 2px 4px #000000;  width: 85%;
  height: auto;"></center>
                    </div>
                    <br>
                    <b>Μια αφαίρεση να είναι η δοκιμή της πρόσθεσης.</b>
                    <div class="2-6-orig-orig_orig" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/2-6-orig-orig_orig.png"
                                     style=" box-shadow: 2px 2px 4px #000000;  width: 80%;
  height: auto;"></center>
                    </div>
                    <h4>Εμβάθυνε τις γνώσεις σου περισσότερο για την πρόσθεση και την αφαίρεση</h4>
                    <center><iframe style=" box-shadow: 2px 2px 4px #000000;"  width="560" height="315" src="https://www.youtube.com/embed/72ebUe-ONgw"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe></center>
                </section>
                <br>
                <!------- END A PART------>

                <section id="exercises">
                    <h1 style="color: rgb(10, 132, 100)">Ασκήσεις / Παραδείγματα</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <h4 style="text-decoration: underline;">Πώς κάνω μια πρόσθεση;</h4>
                    Για να προσθέσω φυσικούς αριθμούς πρέπει να προσθέσω τις μονάδες των αριθμών αυτών, μετά τις δεκάδες
                    των αριθμώ, μετά τις εκατοντάδες κλπ. Η πρόσθεση φυσικών αριθμών μπορεί να γίνει ορίζονται και
                    κάθετα.
                    <div class="paradeigma-prosthesh-02" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/paradeigma.png" style=" box-shadow: 2px 2px 4px #000000;  width: 75%;
  height: auto;"></center>
                    </div>
                    <h4 style="text-decoration: underline;">Πώς κάνω μια αφαίρεση;</h4>
                    Για να αφαιρέσω φυσικούς αριθμούς πρέπει ο μειωτέος να είναι μεγαλύτερος από τον αφαιρετέο. Το
                    αποτέλεσμα της πράξης λέγεται διαφορά. Αφαιρώ μονάδες από μονάδες, δεκάδες από δεκάδες κλπ. Η
                    αφαίρεση μπορεί να γίνει οριζόντια ή κάθετα.
                    <div class="sub-example-02" style="padding-top: 25px;">
                        <center><img src="../../assets/chapter01/sub-example-02.png" style=" box-shadow: 2px 2px 4px #000000;  width: 75%;
  height: auto;"></center>
                    </div>
                    <h4>
                        Υποδειγματική εφαρμογή #1.
                    </h4>

                    <div class="app01" style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <b><i>Εκφώνηση:</i></b><br>Μια πόλη έχει 245.890 κατοίκους. Από αυτούς οι 38.608 είναι παιδιά.
                        Αν γνωρίζουμε πως οι γυναίκες είναι 342 περισσότερες από τους άντρες, πόσες είναι οι γυναίκες
                        και πόσοι οι άντρες αυτής της πόλης.<br>
                        <b>
                            <i>Λύση:</i></b><br>
                        <ul style="list-style: none;">
                            <li>245.890 - 38.608 = 207.282 (άντρες-γυναίκες)</li>
                            <li>(207.282 - 342) : 2 = <b>103.470 άντρες </b></li>
                            <li>103.470 + 342 = <b>103.812 γυναίκες </b></li>
                        </ul>
                    </div>
                </section>
                <br>

                <section id="tests">
                    <h1 style="color: rgb(10, 132, 100)">Έλεγξε τις γνώσεις σου</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <br>
                    <div class="test-prosthesh" style="padding-top: 25px;padding-bottom: 25px;   border: 2px solid skyblue;
  border-radius: 5px;">
                        <center><a href="../quiz.jsp"><img src="../../assets/chapter01/ok1.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></a></center>
                    </div>

                </section>
                <div class="center">

                    <button type="button" class="slide" onclick="location.href='chapter02.jsp'" >
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


<!----------------------------------------- Start of footer ------------------------------------------>
<footer>
    <hr>
    <h3>Επικοινωνία</h3>
    <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
<!---------------------------------------- Close of footer ------------------------------------------->

</body>
</html>
