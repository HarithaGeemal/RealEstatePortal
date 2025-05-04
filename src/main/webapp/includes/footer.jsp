<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /* Futuristic Footer styles */
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Rajdhani:wght@300;400;500;600&display=swap');

    :root {
        --primary-glow: #0ea5e9;
        --secondary-glow: #6366f1;
        --accent-color: #10b981;
    }

    .futuristic-footer {
        background: rgba(15, 23, 42, 0.8);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        position: relative;
        overflow: hidden;
        font-family: 'Rajdhani', sans-serif;
        padding: 2.5rem 0;
    }

    .futuristic-footer::before {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        z-index: 1;
    }

    .footer-container {
        position: relative;
        z-index: 2;
    }

    .copyright {
        font-weight: 500;
        letter-spacing: 1px;
        color: rgba(255, 255, 255, 0.8);
        margin-bottom: 1.5rem;
    }

    .footer-links {
        display: flex;
        justify-content: center;
        gap: 2rem;
        margin-top: 1.5rem;
    }

    .footer-link {
        position: relative;
        color: rgba(255, 255, 255, 0.7);
        font-weight: 500;
        transition: all 0.3s;
        letter-spacing: 0.5px;
        padding: 0.5rem 1rem;
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.05);
    }

    .footer-link:hover {
        color: #ffffff;
        text-shadow: 0 0 10px var(--primary-glow);
        border-color: rgba(var(--primary-glow), 0.3);
        box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);
        background: rgba(14, 165, 233, 0.1);
    }

    /* Geometric background elements */
    .footer-geometric-bg {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: 0;
        opacity: 0.1;
    }

    .footer-geometric-shape {
        position: absolute;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .footer-shape-1 {
        width: 150px;
        height: 150px;
        bottom: -75px;
        left: 10%;
        border-color: var(--primary-glow);
        border-radius: 50%;
    }

    .footer-shape-2 {
        width: 100px;
        height: 100px;
        top: -30px;
        right: 15%;
        border-color: var(--secondary-glow);
        transform: rotate(45deg);
    }

    .footer-shape-3 {
        width: 70px;
        height: 70px;
        bottom: 20px;
        left: 40%;
        border-color: var(--accent-color);
        border-radius: 10px;
        transform: rotate(30deg);
    }

    .footer-logo {
        margin-bottom: 1.5rem;
    }

    .footer-logo-text {
        font-family: 'Orbitron', sans-serif;
        background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        font-weight: 700;
        letter-spacing: 1px;
        font-size: 1.5rem;
    }

    /* Responsive adjustments */
    @media (max-width: 640px) {
        .footer-links {
            flex-direction: column;
            gap: 1rem;
            align-items: center;
        }

        .footer-link {
            width: 80%;
            text-align: center;
        }
    }
</style>

<footer class="futuristic-footer">
    <div class="footer-geometric-bg">
        <div class="footer-geometric-shape footer-shape-1"></div>
        <div class="footer-geometric-shape footer-shape-2"></div>
        <div class="footer-geometric-shape footer-shape-3"></div>
    </div>

    <div class="container mx-auto text-center footer-container">
        <div class="footer-logo">
            <span class="footer-logo-text">Homescape Heaven</span>
        </div>

        <p class="copyright">&copy; 2025 Homescape Heaven. All rights reserved.</p>

        <div class="footer-links">
            <a href="#" class="footer-link">Privacy Policy</a>
            <a href="#" class="footer-link">Terms of Service</a>
            <a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact Us</a>
        </div>
    </div>
</footer>
