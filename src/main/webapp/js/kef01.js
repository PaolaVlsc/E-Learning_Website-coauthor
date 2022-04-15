const sections = document.querySelectorAll('section');
const navLi = document.querySelectorAll('.container1 aside .sidebar1 ul li');

//add a listener

window.addEventListener('scroll', () => {
    let current = ''; // for the initial state we won't have any current section

    //console.log(pageYOffset) ; // how much we have scrolled
    //loop
    sections.forEach(section => {
        const sectionTop = section.offsetTop; // calculate teh distance from the top to the section
        //console.log(sectionTop); // print
        const sectionHeight = section.clientHeight;  // the height of each section

        if (pageYOffset >= (sectionTop - sectionHeight /1)) {
            current = section.getAttribute('id'); // parakolouththsh
        }
    })

    navLi.forEach(li => {
        li.classList.remove('active'); // removes the active class an uparxei

        // an sth lista uparxei h klassh "current" me thn anstioixh timh
        if (li.classList.contains(current)) {
            li.classList.add('active'); // prosthese thn klash active px <li class="active">
        }
    })
})