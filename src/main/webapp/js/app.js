const body = document.querySelector("body");
const navbar = document.querySelector(".navbar");
const menuBtn = document.querySelector(".menu-btn");
const cancelBtn = document.querySelector(".cancel-btn");

menuBtn.onclick = ()=>{
    navbar.classList.toggle("show");
    /*if (navbar.classList.contains("show")) {
        navbar.classList.remove("show");
    }*/
    //menuBtn.classList.add("hide");
    //body.classList.add("disabled");
}
cancelBtn.onclick = ()=>{
    //body.classList.remove("disabled");
    navbar.classList.remove("show");
    //menuBtn.classList.remove("hide");
}

window.onscroll = ()=>{
    if (this.scrollY < 20) {
        navbar.classList.remove("sticky");
        let element = document.getElementById("startPage");
        element.classList.add("current-for-start");
        element.classList.remove("current");
    } else {
        navbar.classList.add("sticky");
        let element = document.getElementById("startPage");
        element.classList.add("current");
        element.classList.remove("current-for-start");
    }
}