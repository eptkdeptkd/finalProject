"use strict";

// Navbar toggle button for small screen
const navbarMenu = document.querySelector(".navbar_menu");
const navbarToggleBtn = document.querySelector(".navbar_toggle-btn");
navbarToggleBtn.addEventListener("click", () => {
    navbarMenu.classList.toggle("open");
});

// Menu
const coffeeBtnContainer = document.querySelector(".coffee_categories");
const coffeeContainer = document.querySelector(".coffee_contents");
const contents = document.querySelectorAll(".content_box");
coffeeBtnContainer.addEventListener("click", (e) => {
    const filter = e.target.dataset.filter || e.target.parentNode.dataset.filter;
    if (filter == null) {
        return;
    }

    // Remove selection from the previous item and select the new one
    const active = document.querySelector(".category_btn.selected");
    active.classList.remove("selected");
    const target =
        e.target.nodeName === "BUTTON" ? e.target : e.target.parentNode;
    target.classList.add("selected");

    // console.log(filter);
    coffeeContainer.classList.add("anim-out");
    setTimeout(() => {
        contents.forEach((content_box) => {
            console.log(content_box.dataset.type);
            if (filter === "*" || filter === content_box.dataset.type) {
                content_box.classList.remove("invisible");
            } else {
                content_box.classList.add("invisible");
            }
        });
        // for(let project of projects) {}
        /* let project
        for(let i = 0; i < projects.length ; i++ ) {
            project = projects[i];
        } */
        coffeeContainer.classList.remove("anim-out");
    }, 300);
});