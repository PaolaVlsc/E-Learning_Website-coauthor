const sections = document.querySelectorAll('section');
const navLi = document.querySelectorAll('.container1 aside .sidebar1 ul li');

//add a listener

function activeMenu() {

    let len = sections.length;
    while (--len && window.scrollY + 350< sections[len].offsetTop) {
    }
    navLi.forEach(li => li.classList.remove('active'));
    navLi[len].classList.add("active");
}

activeMenu();
window.addEventListener("scroll", activeMenu);



