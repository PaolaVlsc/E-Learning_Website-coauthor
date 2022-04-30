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
                        currentQuestion.question=x[0]+" + "+x[1]+" = ";
                        currentQuestion.correctAnswer=x[0]+x[1];
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
                        currentQuestion.question=x[0]+" - "+x[1]+" = ";
                        currentQuestion.correctAnswer=x[0]-x[1];
                    }
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
                                    <select id=${abc} style="width: 100px;" name="dropDown${questionNumber}">
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
                if(!currentQuestion.type.localeCompare("Fill the Gaps")) {

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
        backToTestsButton.style.display = 'inline-block';
        nextQuizButton.style.display = 'inline-block';
        tryAgainButton.style.display = 'inline-block';
        // gather answer containers from our quiz
        const answerContainers = quizContainer.querySelectorAll('.answers');
        // keep track of user's answers
        numCorrect = 0;
        let x, y;
        let i;
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
                    if(x[i].value===currentQuestion.correctAnswer){
                        answerContainer.children[i].style.color = "green";
                    }
                }

            }else if(!currentQuestion.type.localeCompare("Matching Question")) {
                let tagTd=document.getElementsByTagName("td");
                let flag=0;
                let tempText= "Η σωστή απάντηση είναι : ";
                for (let i = 0; i < tagTd.length-1; i+=tagTd.length/3) {
                    for(let j in currentQuestion.answers) {
                        document.getElementById(abc).style.backgroundColor="Tomato";
                        if(currentQuestion.answers[j]===tagTd[i].innerHTML){
                            if(j===document.getElementById(abc).options[document.getElementById(abc).selectedIndex].value){
                                document.getElementById(abc).style.backgroundColor="LightGreen";
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
        disableAnswer();
        if(numCorrect>-1){
            fireworks()
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
    }

    function showSlide(n) {
        slides[currentSlide].classList.remove('active-slide');
        slides[n].classList.add('active-slide');
        currentSlide = n;
        if(numCorrect===-1){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${chosenQuestions.length}`;
        }
        else if (numCorrect>=0){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${chosenQuestions.length}<br> Βρήκες Σωστά ${numCorrect} Απο ${chosenQuestions.length}`
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
    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
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
            if(currentQuestion.chapter===1 && i<10){
                chosenQuestions[i] = currentQuestion;
            }

            i++;
        });
    }
    // Variables
    const quizContainer = document.getElementById('quiz');
    const resultsContainer = document.getElementById('results');
    const submitButton = document.getElementById('submit');
    const myQuestions = [
        //Chapter 1 Questions
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Who invented JavaScript?",
            answers: {
                a: "Douglas Crockford",
                b: "Sheryl Sandberg",
                c: "Brendan Eich"
            },
            correctAnswer: "c"
        },
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Which one of these is a JavaScript package manager?",
            answers: {
                a: "Node.js",
                b: "TypeScript",
                c: "npm"
            },
            correctAnswer: "c"
        },
        {
            type:"multipleChoice",
            chapter:1,
            shuffle : true,
            question: "Which tool can you use to ensure code quality?",
            answers: {
                a: "Angular",
                b: "jQuery",
                c: "RequireJS",
                d: "ESLint"
            },
            correctAnswer: "d"
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
            type:"Matching Question",
            chapter:1,
            shuffle : true,
            question: "Αντιστοίχησε τις σωστές απαντήσεις",
            answers: {
                a: "Node.js",
                b: "TypeScript",
                c: "npm"
            },
            correctAnswer: {
                a: "Node.js",
                b: "TypeScript",
                c: "npm"
            }
        }
    ];
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
    const backToTestsButton = document.getElementById("backToTests");
    const tryAgainButton = document.getElementById("tryAgain");
    const nextQuizButton = document.getElementById("nextQuiz");
    //Remove display of buttons
    document.getElementById("myCanvas").style.display = "none";
    backToTestsButton.className += "button1";
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

    backToTestsButton.onclick = function () {
        location.href = "../html/tests.html";
    };
    nextQuizButton.onclick = function () {
        location.href = "../html/quiz.html";
    };
    tryAgainButton.onclick = function () {
        location.href = "quiz.html";
    };


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
                    if (firework.age > 110 && Math.random() < .05) {
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