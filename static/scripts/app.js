document.addEventListener('DOMContentLoaded', function() {
    const slider = document.querySelector('.slide-container');
    const slides = document.querySelectorAll('.slide');
    const slideWidth = slides[0].getBoundingClientRect().width;
    const slideMargin = parseInt(window.getComputedStyle(slides[0]).marginRight);
    const totalSlideWidth = slideWidth + slideMargin;
    const slidesInView = 1; // Number of slides to display at once
    const totalSlides = slides.length;
    let currentIndex = Math.floor(totalSlides / 2); // Start with the middle slide as focused

    function updateSliderPosition() {
        const offset = -1 * (currentIndex - Math.floor(slidesInView / 2)) * totalSlideWidth;
        slider.style.transform = `translateX(${offset}px)`;
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % totalSlides;
        updateSliderPosition();
    }

    function previousSlide() {
        currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
        updateSliderPosition();
    }

    // Automatically switch to the next slide every 3 seconds
    setInterval(nextSlide, 3000);
});
