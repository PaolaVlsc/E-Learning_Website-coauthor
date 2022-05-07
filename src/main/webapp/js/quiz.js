(function (){
    // Functions
    function buildQuiz(){
        // variable to store the HTML output
        const output = [];
        let x,z;

        // for each question...
        chosenQuestions.slice().forEach(
            (currentQuestion, questionNumber) => {
                // variable to store the list of possible answers
                let answers = [];
                let abc="a";
                //Shuffle answers for multiple choice questions
                var keys = Object.keys(currentQuestion.answers);
                let x = getRandomNumber(currentQuestion)
                if(currentQuestion.shuffle){
                    keys.sort(function() {return Math.random() - 0.5;});
                }
                if(chapter==1){
                    chapter1(currentQuestion,x)
                }
                else if(chapter==2){
                    chapter2(currentQuestion,x)
                }
                else if(chapter==3){
                    chapter3(currentQuestion,x)
                }
                else if(chapter==4){
                    chapter4(currentQuestion,x)
                }
                // and for each available answer...
                if(currentQuestion.type.localeCompare("Matching Question")){
                    keys.forEach(function(letter) {
                        // ...add an HTML radio button
                        if(currentQuestion.type.localeCompare("Fill the Gaps")) {
                            answers.push(
                                `<label>
                                  <input type="radio" name="question${questionNumber}" id="multipleChoice"${questionNumber} value="${letter}" >
                                  ${currentQuestion.answers[letter]}
                                </label>`
                            );
                        }
                    });
                }
                else{
                    keys.forEach(function(letter) {
                        // ...add an HTML radio button
                            answers.push(
                                `<label>  
                                  <tr>
                                  <td id="mat${questionNumber}${abc}" style="text-align:left; padding-right:10px;">${currentQuestion.answers[letter]}</td>
                                  <td style="text-align:left; padding-right:50px;">
                                    <select id="m${questionNumber}${abc}" style="width: 100px;" name="dropDown${questionNumber}">
                                    <option  selected disabled hidden value="javascript">---</option>                                        
                                    </select>
                                  </td>
                                  <td>${abc}:${currentQuestion.correctAnswer[abc]}</td>
                                  </tr>
                                </label>`
                            );
                            abc=String.fromCharCode(abc.charCodeAt(0) + 1);

                    });
                }
                // add this question and its answers to the output
                if(!currentQuestion.type.localeCompare("Fill the Gaps")){
                    output.push(
                        `                              
                                <div class="slide">
                                <div class="question"> ${currentQuestion.question}
                                <input type="text" id="FtG${questionNumber}" style="height:2em; font-size: 30px; -webkit-appearance: none; width: 5em" onkeydown =" if(event.keyCode !== 37 && event.keyCode !== 39) return /^[0-9\\b]+$/.test(String.fromCharCode(event.keyCode || event.which))" name="question${questionNumber}" >                        
                                </div>
                                <div><br><label id="RightAnswer${questionNumber}"></label></div>                         
                                <div class="answers"> ${answers.join("")} </div>
                            </div>`
                    );
                }
                else if(!currentQuestion.type.localeCompare("Matching Question")) {
                    output.push(
                        `<div class="slide">
                            <div class="question"> ${currentQuestion.question}</div>
                            <div class="answers"> 
                                <table>
                                ${answers.join("")}
                                </table>
                            </div>
                            <div><br><label id="RightAnswer${questionNumber}"></label></div>
                        </div>`
                    );
                }else{
                    output.push(
                        `<div class="slide">
                            <div class="question"> ${currentQuestion.question}</div>
                            <div class="answers"> ${answers.join("")} </div>
                        </div>`
                    );
                }
            }
        );
        // finally combine our output list into one string of HTML and put it on the page
        quizContainer.innerHTML = output.join('');
        fillDropDown()


    }

    function chapter1(currentQuestion,x){
        let z;
        //If chooseOperand is 1 we use + operand
        let chooseOperand = getRandomInt(0, 1);
        if(chooseOperand){
            if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
                currentQuestion.question=x[0]+" + "+x[1]+" = "+(x[0]+x[1]);
            }
            else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
                while(!(z=getRandomInt(-10,10))){}
                currentQuestion.question=x[0]+" + "+x[1]+" = "+(x[0]+x[1]+z);
            }else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
                if(currentQuestion.question===""){
                    currentQuestion.question=x[0]+" + "+x[1]+" = ";
                    currentQuestion.correctAnswer=x[0]+x[1];
                }
            }
        }
        else{
            while(x[0]-x[1]<0){
                x=getRandomNumber(currentQuestion);
            }
            if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
                currentQuestion.question=x[0]+" - "+x[1]+" = "+(x[0]-x[1]);
            }
            else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
                while(!(z=getRandomInt(-10,10))){}
                currentQuestion.question=x[0]+" - "+x[1]+" = "+(x[0]-x[1]-z);
            }else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
                if(currentQuestion.question===""){
                    currentQuestion.question=x[0]+" - "+x[1]+" = ";
                    currentQuestion.correctAnswer=x[0]-x[1];
                }
            }
        }
    }function chapter2(currentQuestion,x){
        let z , flag=0 , number;
        x=getRandomNumber(currentQuestion)
        if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
            currentQuestion.question=x[0]+" * "+x[1]+" = "+(x[0]*x[1]);
        }
        else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
            while(!(z=getRandomInt(-10,10))){}
            currentQuestion.question=x[0]+" * "+x[1]+" = "+(x[0]*x[1]+z);
        }
        else if(!currentQuestion.type.localeCompare("multipleChoice Generated")){
            if(currentQuestion.question.includes("6000")){
                number=6000;
            }
            else{
                number=4000;
            }
            for(let j in currentQuestion.answers) {
                x=getRandomNumber(currentQuestion)
                if(flag===0){
                    while(x[0]*x[1]<number) {
                        x=getRandomNumber(currentQuestion)
                    }
                    currentQuestion.answers[j]=x[0]+" x "+x[1]
                    flag = 1;
                }
                else{
                    while(x[0]*x[1]>number) {
                        x=getRandomNumber(currentQuestion)
                    }
                    currentQuestion.answers[j]=x[0]+" x "+x[1]
                }
            }
        }
        else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
            currentQuestion.question=x[0]+" x "+x[1]+" = ";
            currentQuestion.correctAnswer=x[0]*x[1];
        }
        else if(!currentQuestion.type.localeCompare("Matching Question")){
            if(getRandomInt(0,1)){
                let numberDiv=getRandomInt(1,99);
                for(let j in currentQuestion.answers) {
                    currentQuestion.answers[j]=numberDiv+" x 10"
                    currentQuestion.correctAnswer[j]=numberDiv*10;
                    numberDiv*=10;
                }
            }
            else{
                for(let j in currentQuestion.answers) {
                    x=getRandomNumber(currentQuestion)
                    let correctAnswer= x[0]*x[1]
                    currentQuestion.answers[j]=x[0]+" x "+x[1]
                    currentQuestion.correctAnswer[j]=correctAnswer
                }
            }

        }
    }
    function chapter3(currentQuestion){
        if(currentQuestion.type .includes("Right/Wrong")){
            let division,numberDiv = getRandomInt(3, 1000);
            currentQuestion.question = currentQuestion.question.replace("number", numberDiv);
            if(!currentQuestion.type.localeCompare("Right/Wrong Generated 3")) {
                division=3;
                currentQuestion.type=currentQuestion.type.replace(" 3","")
            }else if (!currentQuestion.type.localeCompare("Right/Wrong Generated 2")) {
                division=2;
                currentQuestion.type=currentQuestion.type.replace(" 2","")

            }else if(!currentQuestion.type.localeCompare("Right/Wrong Generated 9")) {
                division=9;
            }
            if (numberDiv % division) {
                currentQuestion.correctAnswer = "b";
            } else {
                currentQuestion.correctAnswer = "a";
            }
        }

        // if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
        //     currentQuestion.question=x[0]+" / "+x[1]+" = "+(x[0]/x[1]);
        // }
        // else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
        //     while(!(z=getRandomInt(-10,10)) || x[0]/x[1]+z<0){}
        //     currentQuestion.question=x[0]+" / "+x[1]+" = "+(x[0]/x[1]+z);
        // }else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
        //     currentQuestion.question=x[0]+" / "+x[1]+" = ";
        //     currentQuestion.correctAnswer=x[0]/x[1];
        // }else if(!currentQuestion.type.localeCompare("Matching Question")){
        //     let numberDiv=getRandomInt(1,9);
        //     for(let j in currentQuestion.answers) {
        //         currentQuestion.answers[j]=numberDiv*10+" / 10"
        //         currentQuestion.correctAnswer[j]=numberDiv;
        //         numberDiv*=10;
        //     }
        // }
    }
    function chapter4(currentQuestion,x){
        let z;
        x=getRandomNumber(currentQuestion)
        while(x[0]%x[1] || x[1]===0){
            x=getRandomNumber(currentQuestion)
        }
        if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
            currentQuestion.question=x[0]+" / "+x[1]+" = "+(x[0]/x[1]);
        }
        else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
            while(!(z=getRandomInt(-10,10)) || x[0]/x[1]+z<0){}
            currentQuestion.question=x[0]+" / "+x[1]+" = "+(x[0]/x[1]+z);
        }else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
            currentQuestion.question=x[0]+" / "+x[1]+" = ";
            currentQuestion.correctAnswer=x[0]/x[1];
        }else if(!currentQuestion.type.localeCompare("Matching Question")){
            let numberDiv=getRandomInt(1,9);
            for(let j in currentQuestion.answers) {
                currentQuestion.answers[j]=numberDiv*10+" / 10"
                currentQuestion.correctAnswer[j]=numberDiv;
                numberDiv*=10;
            }
        }
    }
    function getRandomNumber(currentQuestion){
        let x,y;
        if(currentQuestion.type.search("BigNumber")!==-1){
            x=getRandomInt(1000,1000000);
            y=getRandomInt(1000,1000000);
            currentQuestion.type=currentQuestion.type.replace(" BigNumber","")
        }
        else{
            x=getRandomInt(0,100);
            y=getRandomInt(0,100);
        }
        return [x,y];
    }
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }
    function fillDropDown(){
        chosenQuestions.forEach(
            (currentQuestion, questionNumber) => {
                if(!currentQuestion.type.localeCompare("Matching Question")){
                    var keys = Object.keys(currentQuestion.answers)
                    var dropDown = (document.getElementsByName("dropDown"+questionNumber) || {});
                    let i,j=0;
                    keys.forEach(function () {
                        i=0;
                        keys.forEach(function (letter) {
                            var option = document.createElement("option");
                            option.text = letter;
                            //console.log(option.text)
                            dropDown[j].appendChild(option, dropDown[i]);
                            i++;
                        });
                        j++;
                    });
                }
            });
    }
    function disableAnswer(){
        var x = document.getElementsByTagName("input");
        var y = document.getElementsByTagName("select");
        var i;
        for (i = 0; i < x.length; i++) {
            x[i].disabled = true;
        }
        for (i = 0; i < y.length; i++) {
           y[i].disabled = true;
        }
    }



    function showResults(){
        //remove submit button
        submitButton.style.display = 'none';
        //add new buttons
        if(chapter>1){
            lastQuizButton.style.display = 'inline-block';
        }
        if(chapter<5){
            nextQuizButton.style.display = 'inline-block';
        }
        tryAgainButton.style.display = 'inline-block';
        // gather answer containers from our quiz
        const answerContainers = quizContainer.querySelectorAll('.answers');
        // keep track of user's answers
        numCorrect = 0;
        let x, y;
        let i;
        let num=-9;
        // for each question...
        chosenQuestions.forEach( (currentQuestion, questionNumber) => {
            // find selected answer
            const answerContainer = answerContainers[questionNumber];
            const selector = `input[name=question${questionNumber}]:checked`;
            const userAnswer = (answerContainer.querySelector(selector) || {}).value;
            // if answer is correct
            let check=false;
            let idFtG="FtG"+questionNumber;
            let abc="a";

            if(!currentQuestion.type.localeCompare("Fill the Gaps")) {
                if(document.getElementById(idFtG).value===(currentQuestion.correctAnswer).toString())
                    check = true;
            }
            if(userAnswer === currentQuestion.correctAnswer || check){
                // add to the number of correct answers
                numCorrect++;

                x = document.getElementsByName("question"+questionNumber);
                if(!currentQuestion.type.localeCompare("Fill the Gaps")) {
                    y = document.getElementById(idFtG).style.backgroundColor = "LightGreen ";
                }
                for (i = 0; i < x.length; i++) {
                    console.log(x)
                    if(x[i].value===currentQuestion.correctAnswer){
                        //document.getElementById(idFtG).style.backgroundColor="LightGreen";
                        answerContainer.children[i].style.color = "green";
                    }
                }

            }else if(!currentQuestion.type.localeCompare("Matching Question")) {
                let tagTd=document.getElementsByTagName("td");
                let flag=0;
                let abc="a";
                num+=9;
                let tempText= "Η σωστή απάντηση είναι : ";
                for (let i = num; i < (num+9); i+=Math.ceil(((tagTd.length-1)/(tagTd.length/3)))) {
                    for(let j in currentQuestion.answers) {
                        document.getElementById("m"+questionNumber+abc).style.backgroundColor="Tomato";
                        if(currentQuestion.answers[j]===tagTd[i].innerHTML){
                            if(j===document.getElementById("m"+questionNumber+abc).options[document.getElementById("m"+questionNumber+abc).selectedIndex].value){
                                document.getElementById("m"+questionNumber+abc).style.backgroundColor="LightGreen";
                            }
                            else{
                                flag=1;
                            }
                            abc = String.fromCharCode(abc.charCodeAt(0) + 1);
                            tempText = tempText +" "+ j;
                            break;
                        }
                    }
                }
                if(flag!==1){
                    numCorrect++;
                }
                else{
                    y = document.getElementById("RightAnswer"+questionNumber);
                    y.innerText=tempText;
                    console.log("segeh="+y.innerText);
                }
            }
            // if answer is wrong or blank
            else{
                // color the answers red
                answerContainers[questionNumber].style.color = 'red';

                x = document.getElementsByName("question"+questionNumber);
                if(!currentQuestion.type.localeCompare("Fill the Gaps")) {
                    y = document.getElementById("RightAnswer"+questionNumber);
                    y.innerText="Η σωστή απάντηση είναι : "+currentQuestion.correctAnswer;
                    document.getElementById(idFtG).style.backgroundColor = "Tomato";
                }
                for (i = 0; i < x.length; i++) {
                    if(x[i].value===currentQuestion.correctAnswer){
                        if(x[i].type==="radio"){
                            answerContainer.children[i].style.color = "green";
                        }
                    }
                }
            }
        });

        // show number of correct answers out of total
        resultsContainer.innerHTML = `${currentSlide+1} Απο ${chosenQuestions.length}<br> Βρήκες Σωστά ${numCorrect} Απο ${chosenQuestions.length}`
        var popup = document.getElementById("myPopup");
        popup.classList.toggle("show");
        popup.innerHTML+= "<br>Βρήκες Σωστά "+ numCorrect +" Από "+chosenQuestions.length+"<br>----------------------------<br>";
        disableAnswer();
        if(numCorrect>8){
            fireworks()
            popup.innerHTML+="Μπράβο!<br>Τα πήγες τέλεια!";
        }else if(numCorrect>=6 && numCorrect<=8){
            popup.innerHTML+="Τα πήγες πολύ καλά, μπράβο!<br>Συνέχισε έτσι!";
        }else if(numCorrect>=4 && numCorrect<=5){
            popup.innerHTML+="Καλή προσπάθεια, δεν πειράζει!<br>Δοκίμασε αν θες ξανά!";
        }else {
            popup.innerHTML+="Καλή προσπάθεια!<br>Εάν θέλεις μπορείς να ξαναδείς τη θεωρία στο κεφάλαιο αυτό.";
        }
        document.getElementById("myForm").action="../SaveGradeServlet?grade="+numCorrect;
        document.getElementById("myForm").submit();

    }

    function showSlide(n) {
        slides[currentSlide].classList.remove('active-slide');
        slides[n].classList.add('active-slide');
        currentSlide = n;
        if(numCorrect===-1){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${chosenQuestions.length}`;
        }
        else if (numCorrect>=0){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${chosenQuestions.length}<br> Βρήκες Σωστά ${numCorrect} Απο ${chosenQuestions.length}`;
        }
        if(currentSlide === 0){
            previousButton.style.display = 'none';
        }
        else{
            previousButton.style.display = 'inline-block';
        }
        if(currentSlide === slides.length-1){
            nextButton.style.display = 'none';
            if(numCorrect===-1){
                submitButton.style.display = 'inline-block';
            }
        }
        else{
            nextButton.style.display = 'inline-block';
            submitButton.style.display = 'none';
        }
    }

    function showNextSlide() {
        showSlide(currentSlide + 1);
    }

    function showPreviousSlide() {
        showSlide(currentSlide - 1);
    }
    function Shuffle(myQuestions) {
        var currentIndex = myQuestions.length, temporaryValue, randomIndex;
        while (0 !== currentIndex) {
            randomIndex = Math.floor(Math.random() * currentIndex);
            currentIndex -= 1;
            temporaryValue = myQuestions[currentIndex];
            myQuestions[currentIndex] = myQuestions[randomIndex];
            myQuestions[randomIndex] = temporaryValue;
        }
        return myQuestions;
    }
    function cloneMyQuestions(){
        let i=0;

        myQuestions.forEach( (currentQuestion) => {
            if(currentQuestion.chapter==chapter && i<10){
                chosenQuestions[i] = currentQuestion;
                i++;
            }
        });
    }
    // Variables
    const quizContainer = document.getElementById('quiz');
    const resultsContainer = document.getElementById('results');
    const submitButton = document.getElementById('submitBtn');
    const myQuestions = [
        //Chapter 1 Questions
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Ένα τρένο ξεκινάει από Αθήνα για Λάρισα με 480 επιβάτες \n" +
                "\n" +
                "α) Στη Λειβαδιά ανέβηκαν άλλοι 35 επιβάτες \n" +
                "\n" +
                "β) Στο Λιανοκλάδι Λαμίας κατέβηκαν 110 επιβάτες. Οι υπόλοιποι κατέβηκαν στη Λάρισσα. Πόσοι ήταν αυτοί που κατέβηκαν στη Λάρισσα; ",
            answers: {
                a: "405",
                b: "415",
                c: "305"
            },
            correctAnswer: "a"
        },
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Ο Πύργος του Άιφελ στη Γαλλία έχει ύψος 320 μέτρα. Ο Λευκός Πύργος της Θεσσαλονίκης έχει ύψος 37 μέτρα. Πόσο πιο ψηλός είναι ο Πύργος του Άιφελ; ",
            answers: {
                a: "283",
                b: "290",
                c: "273"
            },
            correctAnswer: "a"
        },
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Η κυρία Σοφία αγόρασε μια ηλεκτρική κουζίνα 450ευρώ, μία ηλεκτρική σκούπα με 257 ερυρώ και ένα τάμπλετ με 230 ευρώ. Πόσα πλήρωσε συνολικά; ",
            answers: {
                a: "928",
                b: "937",
                c: "938"
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong",
            chapter:1,
            shuffle : false,
            question: "Ο γατης αγαπαει τον ιασονα πιο πολυ απο την Σοφια",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong Generated Wrong",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong Generated Wrong BigNumber",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong Generated Right",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong Generated Right BigNumber",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Fill the Gaps",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps BigNumber",
            chapter:1,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps",
            chapter:1,
            shuffle : false,
            question: "Ένας Νίκος πούλησε στην αγορά 350 κιλά μήλα  165 κιλά αχλάδια και 285 κιλά  πορτοκάλια. Πόσα κιλά φρούτα πούλησε στην αγορά; ",
            answers: {
            },
            correctAnswer: "800"
        },
        {
            type:"Fill the Gaps",
            chapter:1,
            shuffle : false,
            question: "Η Πάολα είχε στον κουμπαρά της 250 €.Δάνεισε στον αδερφό της 185€ για ν’αγοράσει ένα καινούριο ποδήλατο. Πόσα χρήματα της έμειναν στον κουμπαρά;",
            answers: {
            },
            correctAnswer: "65"
        },
        {
            type:"Fill the Gaps",
            chapter:1,
            shuffle : false,
            question: "Ένα αεροπλάνο έχει 587 θέσεις. Στο πρωϊνό του δρομολόγιο ταξίδεψαν 230 άντρες, 158 γυναίκες και 15 παιδιά. Πόσες θέσεις έμειναν άδειες; ",
            answers: {
            },
            correctAnswer: "184"
        },


        //~~~~~~~~~~~~~~~~~~~~~~ Chapter 2 ~~~~~~~~~~~~~~~~~~~~~~

        {
            type:"multipleChoice",
            chapter:2,
            shuffle : true,
            question: "Το 1 όταν πολλαπλασιαστεί με έναν φυσικό αριθμο: ",
            answers: {
                a: "τον μεταβάλλει",
                b: "δεν τον μεταβάλλει ",
                c: "κανένα από τα παραπάνω",
            },
            correctAnswer: "b"
        },
        {
            type:"multipleChoice Generated",
            chapter:2,
            shuffle : true,
            question: "Ποιος από τους παρακάτω παράγοντες έχουν γινόμενο μεγαλύτερο του 6.000; ",
            answers: {
                a: "",
                b: "",
                c: "",
                d: "",
            },
            correctAnswer: "a"
        },
        {
            type:"multipleChoice Generated",
            chapter:2,
            shuffle : true,
            question: "Ποιος από τους παρακάτω παράγοντες έχουν γινόμενο μεγαλύτερο του 4.000; ",
            answers: {
                a: "",
                b: "",
                c: "",
                d: "",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:2,
            shuffle : false,
            question: "Στον πολλαπλασιασμό φυσικών αριθμών ισχύει η αντιμεταθετική ιδιότητα ",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:2,
            shuffle : false,
            question: "Στον πολλαπλασιασμό φυσικών αριθμών ισχύει η προσεταιρεστική ιδιότητα ",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:2,
            shuffle : false,
            question: "Στον πολλαπλασιασμό φυσικών αριθμών δεν ισχύει η προσεταιρεστική ιδιότητα ",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong",
            chapter:2,
            shuffle : false,
            question: "Στον πολλαπλασιασμό φυσικών αριθμών δεν ισχύει η αντιμεταθετική ιδιότητα ",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong Generated Right",
            chapter:2,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong Generated Wrong",
            chapter:2,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Fill the Gaps",
            chapter:2,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps",
            chapter:2,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps",
            chapter:2,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Matching Question",
            chapter:2,
            shuffle : true,
            question: "Αντιστοίχησε τις σωστές απαντήσεις",
            answers: {
                a: "",
                b: "",
                c: ""
            },
            correctAnswer: {
                a: "",
                b: "",
                c: ""
            }
        },
        {
            type:"Matching Question",
            chapter:2,
            shuffle : true,
            question: "Αντιστοίχησε τις σωστές απαντήσεις",
            answers: {
                a: "",
                b: "",
                c: ""
            },
            correctAnswer: {
                a: "",
                b: "",
                c: ""
            }
        },
        {
            type:"Matching Question",
            chapter:2,
            shuffle : true,
            question: "Αντιστοίχησε τις σωστές απαντήσεις",
            answers: {
                a: "",
                b: "",
                c: ""
            },
            correctAnswer: {
                a: "",
                b: "",
                c: ""
            }
        },
        //~~~~~~~~~~~~~~~~~~~~~~ Chapter 3 ~~~~~~~~~~~~~~~~~~~~~~

        {
            type:"Right/Wrong Generated 9",
            chapter:3,
            shuffle : false,
            question: "Μπορείς να μοιράσεις εξίσου number καραμέλες σε 3 ή 9 φίλους σου",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong Generated 2",
            chapter:3,
            shuffle : false,
            question: "Αν  έχουμε number κιλά λάδι, μπορούμε να γεμίσουμε τελείως δοχεία των 2 κιλών;",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },{
            type:"Right/Wrong Generated 3",
            chapter:3,
            shuffle : false,
            question: "Αν  έχουμε number κιλά λάδι, μπορούμε να γεμίσουμε τελείως δοχεία των 3 κιλών;",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Fill the Gaps",
            chapter:3,
            shuffle : false,
            question: "Να συμπληρώσεις το τελευταίο ψηφίο κάθε αριθμού, έτσι ώστε οι αριθμοί που προκύπτουν να διαιρούνται με το 2 και με το 9:  10",
            answers: {
            },
            correctAnswer: "8"
        },
        {
            type:"Fill the Gaps",
            chapter:3,
            shuffle : false,
            question: "Να συμπληρώσεις το τελευταίο ψηφίο κάθε αριθμού, έτσι ώστε οι αριθμοί που προκύπτουν να διαιρούνται με το 2 και με το 9:  43",
            answers: {
            },
            correctAnswer: "2"
        },
        {
            type:"Fill the Gaps",
            chapter:3,
            shuffle : false,
            question: "Να συμπληρώσεις το τελευταίο ψηφίο κάθε αριθμού, έτσι ώστε οι αριθμοί που προκύπτουν να διαιρούνται με το 2 και με το 9:  95",
            answers: {
            },
            correctAnswer: "4"
        },

        //~~~~~~~~~~~~~~~~~~~~~~ Chapter 4 ~~~~~~~~~~~~~~~~~~~~~~

        {
            type:"multipleChoice",
            chapter:4,
            shuffle : true,
            question: "Ποιος αριθμός μπορεί να είναι υπόλοιπο στην διαίρεση με 3;",
            answers: {
                a: "0",
                b: "3",
                c: "4",
                d: "84"
            },
            correctAnswer: "a"
        },
        {
            type:"multipleChoice",
            chapter:4,
            shuffle : true,
            question: "Ποιος αριθμός δεν μπορεί να είναι υπόλοιπο στην διαίρεση με 9;",
            answers: {
                a: "0",
                b: "7",
                c: "6",
                d: "87"
            },
            correctAnswer: "d"
        },
        {
            type:"multipleChoice",
            chapter:4,
            shuffle : true,
            question: "Ποιος αριθμός μπορεί να είναι υπόλοιπο στην διαίρεση με 4;",
            answers: {
                a: "7",
                b: "5",
                c: "2",
                d: "4"
            },
            correctAnswer: "c"
        },
        {
            type:"Right/Wrong",
            chapter:4,
            shuffle : false,
            question: "Αν το υπόλοιπο υ είναι 0, τότε έχουμε μία Τέλεια Διαίρεση",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:4,
            shuffle : false,
            question: "Αν το υπόλοιπο υ είναι 0, τότε έχουμε μία Ατελής Διαίρεση",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong",
            chapter:4,
            shuffle : false,
            question: "Η διαίρεση της μορφής Δ = δ x π + υ λέγεται Ευκλείδεια Διαίρεση",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:4,
            shuffle : false,
            question: "Δεν επιτρέπεται να διαιρέσουμε έναν αριθμό δια μηδέν (0)",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong",
            chapter:4,
            shuffle : false,
            question: "Επιτρέπεται να διαιρέσουμε έναν αριθμό δια μηδέν (0) ",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Right/Wrong Generated Right",
            chapter:4,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "a"
        },
        {
            type:"Right/Wrong Generated Wrong",
            chapter:4,
            shuffle : false,
            question: "",
            answers: {
                a: "Σωστό",
                b: "Λάθος",
            },
            correctAnswer: "b"
        },
        {
            type:"Fill the Gaps",
            chapter:4,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps",
            chapter:4,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps",
            chapter:4,
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Matching Question",
            chapter:4,
            shuffle : true,
            question: "Αντιστοίχησε τις σωστές απαντήσεις",
            answers: {
                a: "",
                b: "",
                c: ""
            },
            correctAnswer: {
                a: "",
                b: "",
                c: ""
            }
        },
    ];
    //get url
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const chapter = urlParams.get('chapter');
    //console.log(chapter);
    let numCorrect = -1;
    let chosenQuestions=[];
    //Shuffle quiz questions
    Shuffle(myQuestions);
    //Choose questions
    cloneMyQuestions()
    //Start quiz
    buildQuiz();

    // Navigation
    const previousButton = document.getElementById("previous");
    const nextButton = document.getElementById("next");
    //After submission buttons
    const lastQuizButton = document.getElementById("lastQuiz");
    const tryAgainButton = document.getElementById("tryAgain");
    const nextQuizButton = document.getElementById("nextQuiz");
    //Remove display of buttons
    document.getElementById("myCanvas").style.display = "none";
    lastQuizButton.className += "button1";
    nextQuizButton.className += "button1";
    tryAgainButton.className += "button1";
    const slides = document.querySelectorAll(".slide");
    let currentSlide = 0;

    // Show the first slide
    showSlide(currentSlide);

    // Event listeners
    submitButton.addEventListener('click', showResults);
    previousButton.addEventListener("click", showPreviousSlide);
    nextButton.addEventListener("click", showNextSlide);

    // Get the modal
    let modal = document.getElementById("myModal");
    let choice = document.getElementById("choice");

    // Get the button that opens the modal
    //let btn = document.getElementById("backToTests");

    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
    /*btn.onclick = function() {
        modal.style.display = "block";
    }*/
    lastQuizButton.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href = "../html/tests.html";
        }
    }
    nextQuizButton.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href = "../html/quiz.html?chapter="+(parseInt(chapter)+1).toString();
        }
    }
    tryAgainButton.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href = "quiz.html?chapter="+chapter;
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
    /*backToTestsButton.onclick = function () {
        location.href = "../html/tests.html";
    };*/
    /*nextQuizButton.onclick = function () {
        location.href = "../html/quiz.html?chapter="+(parseInt(chapter)+1).toString();
    };*/
    /*tryAgainButton.onclick = function () {
        location.href = "quiz.html?chapter="+chapter;
    };*/


    // ~~~~~~~~~~~~~~~ fireworks ~~~~~~~~~~~~~~~
    function fireworks(){
        const max_fireworks = 7,
            max_sparks = 50;
        let canvas = document.getElementById('myCanvas');
        let context = canvas.getContext('2d');
        canvas.style.display='inline-block';
        let fireworks = [];
        for (let i = 0; i < max_fireworks; i++) {
            let firework = {
                sparks: []
            };
            for (let n = 0; n < max_sparks; n++) {
                let spark = {
                    vx: Math.random() * 5 + .5,
                    vy: Math.random() * 5 + .5,
                    weight: Math.random() * .3 + .03,
                    red: Math.floor(Math.random() * 2),
                    green: Math.floor(Math.random() * 2),
                    blue: Math.floor(Math.random() * 2)
                };
                if (Math.random() > .5) spark.vx = -spark.vx;
                if (Math.random() > .5) spark.vy = -spark.vy;
                firework.sparks.push(spark);
            }
            fireworks.push(firework);
            resetFirework(firework);
        }
        window.requestAnimationFrame(explode);

        function resetFirework(firework) {
            firework.x = Math.floor(Math.random() * canvas.width);
            firework.y = canvas.height;
            firework.age = 0;
            firework.phase = 'fly';
        }
        function explode() {
            context.clearRect(0, 0, canvas.width, canvas.height);
            fireworks.forEach((firework,index) => {
                if (firework.phase == 'explode') {
                    firework.sparks.forEach((spark) => {
                        for (let i = 0; i < 10; i++) {
                            let trailAge = firework.age + i;
                            let x = firework.x + spark.vx * trailAge;
                            let y = firework.y + spark.vy * trailAge + spark.weight * trailAge * spark.weight * trailAge;
                            let fade = i * 20 - firework.age * 2;
                            let r = Math.floor(spark.red * fade);
                            let g = Math.floor(spark.green * fade);
                            let b = Math.floor(spark.blue * fade);
                            context.beginPath();
                            context.fillStyle = 'rgba(' + r + ',' + g + ',' + b + ',1)';
                            context.rect(x, y, 4, 4);
                            context.fill();
                        }
                    });
                    firework.age++;
                    if (firework.age > 50 && Math.random() < .05) {
                        canvas.style.display='none';
                        fireworks.length=0;
                        firework.age=0;
                    }
                } else {
                    firework.y = firework.y - 10;
                    for (let spark = 0; spark < 15; spark++) {
                        context.beginPath();
                        context.fillStyle = 'rgba(' + index * 50 + ',' + spark * 17 + ',0,1)';
                        context.rect(firework.x + Math.random() * spark - spark / 2, firework.y + spark * 4, 4, 4);
                        context.fill();
                    }
                    if ((Math.random() < .001 || firework.y < 200) ) {
                        firework.phase = 'explode';

                    }
                }
            });
            window.requestAnimationFrame(explode);
        }
    }
})();