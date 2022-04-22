(function(){
    // Functions
    function buildQuiz(){
        // variable to store the HTML output
        const output = [];
        //Shuffle quiz questions
        Shuffle(myQuestions);

        // for each question...
        myQuestions.forEach(
            (currentQuestion, questionNumber) => {
                // variable to store the list of possible answers
                let answers = [];

                var keys = Object.keys(currentQuestion.answers);
                keys.sort(function() {return Math.random() - 0.5;});

                // and for each available answer...
                keys.forEach(function(letter) {
                    // ...add an HTML radio button
                        answers.push(
                            `<label>
                  <input type="radio" name="question${questionNumber}" id=${questionNumber} value="${letter}" >
                  ${currentQuestion.answers[letter]}
                </label>`
                        );
                });
                // add this question and its answers to the output
                output.push(
                    `<div class="slide">
            <div class="question"> ${currentQuestion.question} </div>
            <div class="answers"> ${answers.join("")} </div>
          </div>`
                );
            }
        );
        // finally combine our output list into one string of HTML and put it on the page
        quizContainer.innerHTML = output.join('');
    }
    function disableAnswer(){
        var x = document.getElementsByTagName("input");
        var i;
        for (i = 0; i < x.length; i++) {
            x[i].disabled = true;
        }
    }

    function showResults(){

        // gather answer containers from our quiz
        const answerContainers = quizContainer.querySelectorAll('.answers');
        // keep track of user's answers
        numCorrect = 0;
        let x;
        let i;
        // for each question...
        myQuestions.forEach( (currentQuestion, questionNumber) => {
            // find selected answer
            const answerContainer = answerContainers[questionNumber];
            const selector = `input[name=question${questionNumber}]:checked`;
            const userAnswer = (answerContainer.querySelector(selector) || {}).value;

            // if answer is correct
            if(userAnswer === currentQuestion.correctAnswer){
                // add to the number of correct answers
                numCorrect++;

                x = document.getElementsByName("question"+questionNumber);

                for (i = 0; i < x.length; i++) {
                    if(x[i].value===currentQuestion.correctAnswer){
                        answerContainer.children[i].style.color = "green";
                    }
                }

            }
            // if answer is wrong or blank
            else{
                // color the answers red
                answerContainers[questionNumber].style.color = 'red';

                x = document.getElementsByName("question"+questionNumber);

                for (i = 0; i < x.length; i++) {
                    if(x[i].value===currentQuestion.correctAnswer){
                        answerContainer.children[i].style.color = "green";
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
            question: "Who invented JavaScript?",
            answers: {
                a: "Douglas Crockford",
                b: "Sheryl Sandberg",
                c: "Brendan Eich"
            },
            correctAnswer: "c"
        },
        {
            question: "Which one of these is a JavaScript package manager?",
            answers: {
                a: "Node.js",
                b: "TypeScript",
                c: "npm"
            },
            correctAnswer: "c"
        },
        {
            question: "Which tool can you use to ensure code quality?",
            answers: {
                a: "Angular",
                b: "jQuery",
                c: "RequireJS",
                d: "ESLint"
            },
            correctAnswer: "d"
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