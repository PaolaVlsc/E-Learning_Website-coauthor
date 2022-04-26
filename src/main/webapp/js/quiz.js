(function (){
    // Functions
    function buildQuiz(){
        // variable to store the HTML output
        const output = [];
        let x,y,z;
        //Shuffle quiz questions
        Shuffle(myQuestions);

        // for each question...
        myQuestions.forEach(
            (currentQuestion, questionNumber) => {
                // variable to store the list of possible answers
                let answers = [];
                let abc="a";
                //Shuffle answers for multiple choice questions
                var keys = Object.keys(currentQuestion.answers);
                if(currentQuestion.type.search("BigNumber")!=-1){
                    console.log(currentQuestion.type)
                    x=getRandomInt(1000,1000000);
                    y=getRandomInt(1000,1000000);
                    currentQuestion.type=currentQuestion.type.replace(" BigNumber","")
                }
                else{
                    x=getRandomInt(0,100);
                    y=getRandomInt(0,100);
                }
                if(currentQuestion.shuffle){
                    keys.sort(function() {return Math.random() - 0.5;});
                }
                else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Right")){
                    currentQuestion.question=x+" + "+y+" = "+(x+y);
                }
                else if(!currentQuestion.type.localeCompare("Right/Wrong Generated Wrong")){
                    while(!(z=getRandomInt(-10,10))){}
                    currentQuestion.question=x+" + "+y+" = "+(x+y+z);
                }else if(!currentQuestion.type.localeCompare("Fill the Gaps")){
                    currentQuestion.question=x+" + "+y+" = ";
                    currentQuestion.correctAnswer=x+y;
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
                                <input type="text" id="FtG${questionNumber}" style="height:2em; font-size: 30px; -webkit-appearance: none; width: 5em" onkeydown ="return /^[0-9\\b]+$/.test(String.fromCharCode(event.keyCode || event.which))" name="question${questionNumber}" >                        
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
    function fillDropDown(){
        myQuestions.forEach(
            (currentQuestion, questionNumber) => {
                if(!currentQuestion.type.localeCompare("Matching Question")){
                    var keys = Object.keys(currentQuestion.answers)
                    var dropDown = (document.getElementsByName("dropDown"+questionNumber) || {});
                    let i,j=0;
                    keys.forEach(function (letter) {
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
        // gather answer containers from our quiz
        const answerContainers = quizContainer.querySelectorAll('.answers');
        // keep track of user's answers
        numCorrect = 0;
        let x, y;
        let i;
        // for each question...
        myQuestions.forEach( (currentQuestion, questionNumber) => {
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
                for (let i = 0; i < tagTd.length-1; i+=tagTd.length/3) {
                    for(let j in currentQuestion.answers) {
                        document.getElementById(abc).style.backgroundColor="Tomato";
                        //alert(currentQuestion.answers[j]+tagTd[i].innerHTML);
                        if(currentQuestion.answers[j]===tagTd[i].innerHTML){
                            if(j===document.getElementById(abc).options[document.getElementById(abc).selectedIndex].value){
                                document.getElementById(abc).style.backgroundColor="LightGreen";
                            }
                            abc = String.fromCharCode(abc.charCodeAt(0) + 1);
                            break;
                        }
                    }
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
        resultsContainer.innerHTML = `${currentSlide+1} Απο ${myQuestions.length}<br> Βρήκες Σωστά ${numCorrect} Απο ${myQuestions.length}`
        disableAnswer();
    }

    function showSlide(n) {
        slides[currentSlide].classList.remove('active-slide');
        slides[n].classList.add('active-slide');
        currentSlide = n;
        if(numCorrect===-1){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${myQuestions.length}`;
        }
        else if (numCorrect>=0){
            resultsContainer.innerHTML = `${currentSlide+1} Απο ${myQuestions.length}<br> Βρήκες Σωστά ${numCorrect} Απο ${myQuestions.length}`
        }
        if(currentSlide === 0){
            previousButton.style.display = 'none';
        }
        else{
            previousButton.style.display = 'inline-block';
        }
        if(currentSlide === slides.length-1){
            nextButton.style.display = 'none';
            submitButton.style.display = 'inline-block';
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

    // Variables
    const quizContainer = document.getElementById('quiz');
    const resultsContainer = document.getElementById('results');
    const submitButton = document.getElementById('submit');
    const myQuestions = [
        {
            type:"multipleChoice",
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
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Fill the Gaps BigNumber",
            shuffle : false,
            question: "",
            answers: {
            },
            correctAnswer: ""
        },
        {
            type:"Matching Question",
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

    //Start quiz
    buildQuiz();

    // Navigation
    const previousButton = document.getElementById("previous");
    const nextButton = document.getElementById("next");
    const slides = document.querySelectorAll(".slide");
    let currentSlide = 0;

    // Show the first slide
    showSlide(currentSlide);

    // Event listeners
    submitButton.addEventListener('click', showResults);
    previousButton.addEventListener("click", showPreviousSlide);
    nextButton.addEventListener("click", showNextSlide);
})();