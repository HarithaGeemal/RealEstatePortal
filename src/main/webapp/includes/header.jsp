<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.ico">
    <title>Real Estate Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Poppins:wght@300;400;500;600;700&display=swap');

        :root {
            --primary-glow: #0ea5e9;
            --secondary-glow: #6366f1;
            --accent-color: #10b981;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #111827;
            color: white;
        }

        /* Header styles */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 50;
            transition: all 0.3s ease;
            background-color: rgba(15, 23, 42, 0.85);
            backdrop-filter: blur(10px);
            padding: 1rem;
        }

        .header.scrolled {
            padding: 0.5rem 1rem;
            background-color: rgba(15, 23, 42, 0.95);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .header-container {
            position: relative;
            max-width: 1280px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 1rem;
        }

        /* Decorative elements */
        .decorative-elements {
            position: absolute;
            inset: 0;
            overflow: hidden;
            opacity: 0.15;
            pointer-events: none;
        }

        .decorative-circle {
            position: absolute;
            border-radius: 50%;
            border: 1px solid;
            animation: float 8s infinite ease-in-out;
        }

        .circle-1 {
            height: 6rem;
            width: 6rem;
            border-color: var(--primary-glow);
            top: -2rem;
            left: 25%;
        }

        .circle-2 {
            height: 8rem;
            width: 8rem;
            border-color: var(--secondary-glow);
            top: -2.5rem;
            right: 25%;
            animation-delay: 2s;
        }

        .circle-3 {
            height: 4rem;
            width: 4rem;
            border-color: var(--accent-color);
            bottom: -1rem;
            left: 33%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(5deg); }
        }

        /* Logo */
        .logo {
            display: flex;
            align-items: center;
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: translateY(-2px);
        }

        .logo img {
            height: 2.5rem;
            filter: drop-shadow(0 0 8px var(--primary-glow));
            transition: all 0.3s ease;
        }

        .logo:hover img {
            filter: drop-shadow(0 0 12px var(--primary-glow));
        }

        .logo-text {
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
            font-weight: 700;
            letter-spacing: 0.5px;
            font-size: 1.25rem;
            margin-left: 0.5rem;
        }

        /* Navigation */
        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .nav-link {
            position: relative;
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s;
            padding: 0.5rem 0;
            text-decoration: none;
        }

        .nav-link:hover {
            color: #ffffff;
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, var(--primary-glow), var(--secondary-glow));
            transition: all 0.3s ease;
            transform: translateX(-50%);
            opacity: 0;
        }

        .nav-link:hover::after {
            width: 100%;
            opacity: 1;
        }

        /* Mobile menu */
        .mobile-menu-button {
            display: none;
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            z-index: 50;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .mobile-menu-button {
                display: block;
            }

            .nav-links {
                position: fixed;
                top: 0;
                right: -100%;
                height: 100vh;
                width: 16rem;
                background: rgba(15, 23, 42, 0.95);
                backdrop-filter: blur(10px);
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 1.5rem;
                transition: right 0.3s ease;
                z-index: 40;
                padding: 2rem;
                box-shadow: -5px 0 20px rgba(0, 0, 0, 0.2);
            }

            .nav-links.active {
                right: 0;
            }
        }

        /* Content area */
        .content {
            padding-top: 8rem;
            padding-left: 1rem;
            padding-right: 1rem;
        }
    </style>
</head>
<body>
<header class="header" id="header">
    <div class="header-container">
        <!-- Decorative elements -->
        <div class="decorative-elements">
            <div class="decorative-circle circle-1"></div>
            <div class="decorative-circle circle-2"></div>
            <div class="decorative-circle circle-3"></div>
        </div>

        <!-- Logo -->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/home" class="flex items-center">
                <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="Real Estate Logo">
                <span class="logo-text">Homescape Haven</span>
            </a>
        </div>

        <!-- Mobile Menu Button -->
        <button class="mobile-menu-button" id="mobileMenuButton">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="3" y1="12" x2="21" y2="12"></line>
                <line x1="3" y1="6" x2="21" y2="6"></line>
                <line x1="3" y1="18" x2="21" y2="18"></line>
            </svg>
        </button>

        <!-- Navigation Links -->
        <nav class="nav-links" id="navLinks">
            <a hre="${pageContext.request.contextPath}/home" class="nav-link">Home</a>
            <a href="${pageContext.request.contextPath}/land" class="nav-link">Lands</a>
            <a href="${pageContext.request.contextPath}/houses" class="nav-link">Houses</a>
            <a href="${pageContext.request.contextPath}/property" class="nav-link">Sell Your Land</a>
            <a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact Us</a>
        </nav>
    </div>
</header>

<div class="content">
    <h1 style="font-size: 2.25rem; font-weight: 700; text-align: center;">Welcome to Homescape Haven</h1>
    <p style="text-align: center; margin-top: 1rem; color: #d1d5db;">Your dream property is just a click away</p>
</div>

<script>
    // Mobile menu toggle
    document.addEventListener('DOMContentLoaded', function() {
        const mobileMenuButton = document.getElementById('mobileMenuButton');
        const navLinks = document.getElementById('navLinks');

        if (mobileMenuButton && navLinks) {
            mobileMenuButton.addEventListener('click', function() {
                navLinks.classList.toggle('active');
            });
        }

        // Header scroll effect
        const header = document.getElementById('header');
        if (header) {
            window.addEventListener('scroll', function() {
                if (window.scrollY > 50) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });
        }
    });
</script>
</body>
</html>
