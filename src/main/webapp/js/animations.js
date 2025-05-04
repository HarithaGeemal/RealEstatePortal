document.addEventListener("DOMContentLoaded", () => {
    // Register ScrollTrigger plugin
    gsap.registerPlugin(ScrollTrigger);

    // Animate elements with class "animate-on-scroll"
    gsap.utils.toArray(".animate-on-scroll").forEach((element) => {
        gsap.from(element, {
            opacity: 0,
            y: 50,
            duration: 1,
            scrollTrigger: {
                trigger: element,
                start: "top 80%",
                end: "bottom 20%",
                toggleActions: "play none none none",
            },
        });
    });

    // Slider animation (right to left)
    const slider = document.querySelector(".slider");
    if (slider) {
        const slides = gsap.utils.toArray(".slider > div");
        const totalWidth = slides.reduce((acc, slide) => acc + slide.offsetWidth + 16, 0); // 16px for space-x-4

        gsap.to(slider, {
            x: () => -(totalWidth - window.innerWidth), // Move left by total width minus viewport width
            duration: 20,
            repeat: -1, // Infinite loop
            ease: "linear",
            modifiers: {
                x: gsap.utils.unitize((x) => {
                    // Seamless loop: reset position when it goes too far
                    return parseFloat(x) % (totalWidth - window.innerWidth);
                }),
            },
        });
    }
});