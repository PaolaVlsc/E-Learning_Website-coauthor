const body = document.querySelector("body");
const navbar = document.querySelector(".navbar");
const menuBtn = document.querySelector(".menu-btn");
const cancelBtn = document.querySelector(".cancel-btn");

/*show dropdown*/
menuBtn.onclick = ()=>{
    navbar.classList.toggle("show");
}
/*close dropdown*/
cancelBtn.onclick = ()=>{
    navbar.classList.remove("show");
}

