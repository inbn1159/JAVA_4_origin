var menuBtn = document.querySelector('.menu-btn');
var nav = document.querySelector('nav');
var b-cat = document.querySelector('.b-cat');
var link = document.querySelector('nav .nav-links');

menuBtn.addEventListener('click', () => {
    nav.classList.toggle('nav-open');
    b-cat.classList.toggle('open');
    link.classList.toggle('fade-in');
})