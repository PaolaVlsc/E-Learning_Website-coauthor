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
    <title>ΚΡΙΤΗΡΙΑ ΔΙΑΙΡΕΤΟΤΗΤΑΣ | SINP </title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/popup.css">
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
                        <a href="../../jsp/sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                        <a href="chapter04.jsp">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="../../jsp/tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="../testsChapter.jsp?chapter=1">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="../testsChapter.jsp?chapter=2">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="../testsChapter.jsp?chapter=3">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="../testsChapter.jsp?chapter=4">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="../testsChapter.jsp?chapter=5">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a href="../../jsp/statistics.jsp">Στατιστικά</a></li>
            <li><a href="../games.jsp">Παιχνίδια</a></li>
        </ul>
        <div class="logout">
            <a id="log" <%if(!Login.isLoggedIn(session)){%>href="../login.jsp"<%}%>>
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
            ΕΛΑ ΝΑ ΜΑΘΟΥΜΕ ΤΗ ΔΙΑΙΡΕΣΗ ΠΑΡΕΑ !
        </div>
        <div class="wrapper1">
            <aside>
                <div class="sidebar1">
                    <h2>ΔΙΑΙΡΕΣΗ
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
                        <center>ΔΙΑΙΡΕΣΗ</center>
                    </h4>

                    <b> Ορισμοί: </b>
                    <br>
                    <ul style="padding: 20px;">
                        <li> Όταν έχουμε δύο φυσικούς αριθμούς, τον <b>Δ (Διαιρετέο)</b> και τον <b>δ (διαιρέτη)</b>,
                            τότε μπορούμε να βρούμε
                            δύο άλλους μοναδικούς φυσικούς αριθμούς <b> π (πηλίκο)</b> και <b>υ (υπόλοιπο)</b>, έτσι
                            ώστε να ισχύει η ισότητα:
                            <ul style="list-style: none; text-align: center;">
                                <li><b>Δ = δ x π + υ </b></li>
                            </ul>
                            Όλη αυτή η διαδικασία είναι η πράξη της <b>διαίρεσης</b>.
                        </li>

                        <li> Η διαίρεση αυτής της μορφής
                            ονομάζεται και <b>Ευκλείδεια διαίρεση.</b></li>

                        <li> Το υπόλοιπο είναι πάντα αριθμός μικρότερος από τον διαιρέτη και μεγαλύτερος ή ίσος του
                            μηδενός.
                        </li>
                    </ul>

                    <h4>
                        <center>Τέλεια Διαίρεση</center>
                    </h4>

                    Αν το υπόλοιπο υ είναι 0, τότε έχουμε μία Τέλεια Διαίρεση: Δ = δ x π
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_01.png" style=" box-shadow: 2px 2px 4px #000000;  width: 50%;  height: auto;"></center>
                    </div>

                    <h4>
                        <center>Ατελής Διαίρεση</center>
                    </h4>
                    Αν το υπόλοιπο υ είναι 0, τότε έχουμε μία Τέλεια Διαίρεση: Δ = δ x π

                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_02.png" style=" box-shadow: 2px 2px 4px #000000;  width: 50%;  height: auto;"></center>
                    </div>
                    <h4>
                        <center>Ευκλείδεια Διαίρεση</center>
                    </h4>
                    Η διαίρεση της μορφής Δ = δ x π + υ λέγεται <b>Ευκλείδεια Διαίρεση.</b>
                    <ul style="list-style: none; padding-left: 30px;">
                        <li> 135 = 7 x 19 + 2 </li>
                        <li> 192 = 12 x 16 + 0 </li>
                    </ul>

                    <h4>
                        <center>Βασικές μαθηματικές έννοιες και διεργασίες</center>
                    </h4>
                    <b> Διαίρεση </b>λέγεται η πράξη με την οποία μοιράζουμε έν

                    <br>

                    Έχουμε δυο ειδών διαιρέσεις:
                    <ul style="padding: 20px;">
                        <li><b>Τη διαίρεση μερισμού. </b> Όταν ξέρουμε την τιμή των πολλών μονάδων και ζητάμε την τιμή
                            της μιας μονάδας. <i>Π.χ.Οι πέντε σοκολάτες κοστίζουν 10 €. Πόσο κοστίζει η μία;
                            </i></li>
                        <li><b>Τη διαίρεση μέτρησης. </b>. Όταν ξέρουμε και την τιμή των πολλών μονάδων και την τιμή της
                            μιας μονάδας και δεν ξέρουμε πόσες είναι αυτές οι πολλές μονάδες.
                        </li>
                    </ul>

                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_03.png" style=" box-shadow: 2px 2px 4px #000000;  width: 80%;  height: auto;"></center>
                    </div>



                    <h5>Ιδιότητες:</h5>

                    <ul style="padding: 20px;  border: 2px solid skyblue; border-radius: 5px; padding: 15px; padding-left: 50px;margin-bottom: 30px;margin-top: 30px; ">
                        <li> Κάθε αριθμός αν διαιρεθεί με το 1, δίνει πηλίκο τον εαυτό του.
                            <ul style="list-style: none; color: mediumpurple">
                                <li><b>π.χ. 5 : 1 = 5 </b></li>
                            </ul>
                        </li>


                        <li>Κάθε αριθμός αν διαιρεθεί με τον εαυτό του δίνει πηλίκο το 1.
                            <ul style="list-style: none; color: mediumpurple">
                                <li><b>π.χ. 9 : 9 = 1 </b></li>
                            </ul>
                        </li>

                        <li>Το μηδέν (0) με όποιον αριθμό κι αν διαιρεθεί, δίνει πηλίκο τον εαυτό του.
                            <ul style="list-style: none; color: mediumpurple">
                                <li><b>π.χ. 0 : 5 = 0</b></li>
                            </ul>
                        </li>

                        <li> Δεν επιτρέπεται να διαιρέσουμε έναν αριθμό δια μηδέν (0).

                            <ul style="list-style: none; color: mediumpurple">
                                <li><b>π.χ. 4 : 0 είναι αδύνατο</b></li>
                            </ul>
                        </li>
                        <li> Σε κάθε διαίρεση αν πολλαπλασιάσουμε ή διαιρέσουμε τους δύο όρους με τον ίδιο αριθμό, το
                            πηλίκο δεν αλλάζει.

                            <ul style="list-style: none; color: mediumpurple">
                                <li><b> π.χ. 20 : 4 = 5 (20 • 2) : (4 • 2) = 40 : 8 = 5 </b></li>
                            </ul>
                        </li>
                    </ul>


                    <h4>
                        <center>Δοκιμή της διαίρεσης:</center>
                    </h4>


                    Η δοκιμή ή αλλιώς επαλήθευση της διαίρεσης γίνεται με την εφαρμογή της ισότητας <b>Δ = δ x π + υ</b>.<br>


                    Πιο συγκεκριμένα:
                    Σε μια τέλεια διαίρεση η δοκιμή γίνεται ως εξής:
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_04.png" style=" box-shadow: 2px 2px 4px #000000;  width: 50%;  height: auto;"></center>
                    </div>


                    <b>Δοκιμή:</b><br>
                    Δ = δ x π = 12 x 16 = 192

                    <h5>Σε μια ατελή διαίρεση η δοκιμή γίνεται ως εξής:</h5>


                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_05.png" style=" box-shadow: 2px 2px 4px #000000;  width: 50%;  height: auto;"></center>
                    </div>

                    <b>Δοκιμή:</b><br>
                    Δ = δ x π + υ = 7 x 19 + 2 = 133+2= 135

                    <h4>Εμβάθυνε τις γνώσεις σου περισσότερο για τη διαίρεση!</h4>
                    <center>
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/7K_UAOMgC-4"
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
                    <h4 style="text-decoration: underline;">Πώς κάνω μια διαίρεση;</h4>
                    Για να προσθέσω φυσικούς αριθμούς πρέπει να προσθέσω τις μονάδες των αριθμών αυτών, μετά τις δεκάδες
                    των αριθμώ, μετά τις εκατοντάδες κλπ. Η πρόσθεση φυσικών αριθμών μπορεί να γίνει ορίζονται και
                    κάθετα.
                    <div style="padding-top: 25px;">
                        <center><img src="../../assets/chapter04/div_ex_06.png" style=" box-shadow: 2px 2px 4px #000000;  width: 95%;  height: auto;"></center>
                    </div>
                    <h4>
                        Υποδειγματική εφαρμογή #1.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_07.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #2.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_08.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #3.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_09.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #4.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_10.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #5.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_11.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 55%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                    <h4>
                        Υποδειγματική εφαρμογή #6.
                    </h4>

                    <div style="border: 2px solid skyblue; border-radius: 5px; padding: 5px">
                        <!-- START image  -->
                        <div class="2-6-orig-orig_orig" style="padding-top: 5px;">
                            <center><img src="../../assets/chapter04/div_ex_12.png"
                                         style=" box-shadow: 0.5px 0.5px 4px #000000;  width: 80%; height: auto;"></center>
                        </div>
                        <!-- END image  -->
                    </div>

                </section>
                <br>

                <section id="tests">
                    <h1 style="color: rgb(10, 132, 100)">Έλεγξε τις γνώσεις σου</h1>
                    <hr style="color: rgb(10, 132, 100)">
                    <br>
                    <div style="padding-top: 25px;padding-bottom: 25px;   border: 2px solid skyblue;  border-radius: 5px;">
                        <center><a href="../testsChapter.jsp?chapter=4"><img src="../../assets/chapter04/nia.png" style=" box-shadow: 2px 2px 4px #000000;  width: 70%;
  height: auto;"></a></center>
                    </div>

                </section>


                <div class="center">

                    <button type="button" class="slide" onclick="location.href='chapter03.jsp'">
                        <div class="previous">Προηγούμενο Μάθημα!</div>
                    </button>
                    </divv>
                </div>
            </div>

            <!----------------------------------------- Close of main body ------------------------------------------>
        </div>


    </div>
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
<!-- Link the js -->
<script src="../../js/subchapters.js"></script>
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
            location.href ="../../logout-servlet";
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
<footer>
    <hr>
    <h3>Επικοινωνία</h3>
    <p><i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>

</body>
</html>
