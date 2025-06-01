<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Header -->
    <%@include file="/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homescape Haven - Find Your Dream Property</title>

    <!-- Import fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Rajdhani:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-glow: #468fe8;
            --secondary-glow: #6366f1;
            --accent-color: #10b981;
            --dark-bg: rgba(15, 23, 42, 0.8);
            --border-glow: rgba(14, 165, 233, 0.3);
        }

        body {
            font-family: 'Rajdhani', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0f172a;
            color: rgba(255, 255, 255, 0.9);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }



        .logo img {
            height: 45px;
            filter: drop-shadow(0 0 8px var(--primary-glow));
            transition: all 0.3s ease;
        }

        .logo:hover img {
            filter: drop-shadow(0 0 12px var(--primary-glow));
        }



        /* Mobile menu button */
        .mobile-menu-button {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            z-index: 100;
        }

        /* Responsive adjustments for header */
        @media (max-width: 1024px) {
            .nav-links {
                gap: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .mobile-menu-button {
                display: block;
            }

            .nav-links {
                position: fixed;
                top: 0;
                right: -100%;
                height: 100vh;
                width: 250px;
                background: rgba(15, 23, 42, 0.95);
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(15px);
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 2rem;
                transition: right 0.3s ease;
                z-index: 99;
                padding: 2rem;
                box-shadow: -5px 0 20px rgba(0, 0, 0, 0.2);
            }

            .nav-links.active {
                right: 0;
            }

            .nav-link {
                font-size: 1.2rem;
            }
        }

        @media (max-width: 640px) {
            .header {
                padding: 1rem;
            }

            .header.scrolled {
                padding: 0.7rem 1rem;
            }

            .logo img {
                height: 35px;
            }

            .logo-text {
                font-size: 1.1rem;
            }
        }

        /* Hero Section Styles */
        .hero-section {
            position: relative;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            overflow: hidden;
            margin-top: 0; /* Remove any top margin */
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            background-size: cover;
            background-position: center;
            z-index: 1;
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.8));
            z-index: 2;
        }

        .hero-content {
            position: relative;
            z-index: 10;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 15px rgba(14, 165, 233, 0.3);
            letter-spacing: 2px;
        }

        .hero-description {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            color: rgba(255, 255, 255, 0.8);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            letter-spacing: 0.5px;
        }

        .search-form {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
            position: relative;
        }

        .search-form::before {
            content: '';
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        }

        .search-form::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        }

        .form-select {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            width: 200px;
            font-family: 'Rajdhani', sans-serif;
            font-size: 1rem;
            transition: all 0.3s ease;
            appearance: none;
            background: rgba(255, 255, 255, 0.1) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E") no-repeat right 10px center;
            background-size: 16px;
        }

        .form-select:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);
        }

        .form-select option {
            background-color: #1e293b;
            color: white;
        }

        .search-button {
            padding: 0.75rem 1rem;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .search-button:hover {
            box-shadow: 0 0 20px rgba(14, 165, 233, 0.4);
            transform: translateY(-2px);
        }

        .search-button::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0));
            transform: rotate(30deg);
            transition: transform 0.5s ease;
            opacity: 0;
        }

        .search-button:hover::after {
            transform: rotate(30deg) translate(10%, 10%);
            opacity: 1;
        }

        /* About Section Styles */
        .about-section {
            padding: 5rem 0;
            position: relative;
            background: rgba(15, 23, 42, 0.9);
            margin-top: 0; /* Remove any top margin */
        }

        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 2;
        }

        .about-grid {
            display: flex;
            flex-direction: column;
            gap: 3rem;
        }

        @media (min-width: 768px) {
            .about-grid {
                flex-direction: row;
                align-items: center;
            }
        }

        .about-content {
            flex: 1;
        }

        .about-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
            letter-spacing: 1px;
        }

        .about-description {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 2rem;
            line-height: 1.8;
            font-size: 1.1rem;
        }

        .about-button {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: white;
            border: none;
            border-radius: 8px;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            position: relative;
            overflow: hidden;
            letter-spacing: 1px;
        }

        .about-button:hover {
            box-shadow: 0 0 20px rgba(14, 165, 233, 0.4);
            transform: translateY(-2px);
        }

        .about-stats {
            flex: 1;
            display: flex;
            justify-content: center;
            gap: 3rem;
        }

        .stat-item {
            text-align: center;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.03);
            border-radius: 16px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .stat-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(14, 165, 233, 0.2);
            border-color: var(--primary-glow);
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, var(--primary-glow), var(--accent-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .stat-label {
            color: rgba(255, 255, 255, 0.7);
            font-size: 1.1rem;
        }

        /* Properties Section Styles */
        .properties-section {
            padding: 5rem 0;
            position: relative;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.8));
            margin-top: 0; /* Remove any top margin */
        }

        .properties-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 2;
        }

        .properties-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 3rem;
            text-align: center;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
            letter-spacing: 1px;
        }

        .properties-grid {
            display: grid;
            grid-template-columns: repeat(1, 1fr);
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .properties-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        .property-card {
            background: rgba(30, 41, 59, 0.5);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            position: relative;
        }

        .property-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(14, 165, 233, 0.2);
            border-color: var(--primary-glow);
        }

        .property-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--primary-glow), transparent);
            z-index: 1;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .property-card:hover::before {
            opacity: 1;
        }

        .property-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .property-content {
            padding: 1.5rem;
        }

        .property-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: white;
        }

        .property-detail {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 0.25rem;
            font-size: 0.95rem;
        }

        .property-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1.5rem;
        }

        .action-button {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: white;
            flex: 1;
            text-align: center;
            border: none;
        }

        .view-button {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .edit-button {
            background: linear-gradient(135deg, #3b82f6, #2563eb);
        }

        .delete-button {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .action-button:hover {
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }

        /* Geometric background elements */
        .geometric-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
            opacity: 0.1;
            pointer-events: none;
        }

        .geometric-shape {
            position: absolute;
            border: 1px solid rgba(255, 255, 255, 0.2);
            pointer-events: none;
        }

        .shape-1 {
            width: 300px;
            height: 300px;
            top: 10%;
            left: 5%;
            border-color: var(--primary-glow);
            border-radius: 50%;
        }

        .shape-2 {
            width: 200px;
            height: 200px;
            bottom: 20%;
            right: 10%;
            border-color: var(--secondary-glow);
            transform: rotate(45deg);
        }

        .shape-3 {
            width: 150px;
            height: 150px;
            top: 40%;
            right: 20%;
            border-color: var(--accent-color);
            border-radius: 10px;
            transform: rotate(30deg);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            padding: 3rem 0;
            font-size: 1.1rem;
        }

        /* Animation for scroll reveal */
        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .animate-on-scroll.visible {
            opacity: 1;
            transform: translateY(0);
        }

    </style>
</head>
<body>

<!-- Hero Section - Starts immediately after header -->
<section class="hero-section">
    <div class="hero-bg" style="background-image: url('${pageContext.request.contextPath}/images/hero-bg.jpg');"></div>
    <div class="hero-overlay"></div>

    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="hero-content">
        <h1 class="hero-title">Find Your Dream Property</h1>
        <p class="hero-description">Everyone aspires to own a great piece of property. We, at Homescape Haven, make it a reality.</p>

        <form action="${pageContext.request.contextPath}/home" method="post" class="search-form">
            <!-- Select City -->
            <div class="relative">
                <label>
                    <select name="city" class="form-select">
                        <option value="">All Districts</option>
                        <option value="Anuradhapura">Anuradhapura</option>
                        <option value="Colombo">Colombo</option>
                        <option value="Galle">Galle</option>
                        <option value="Gampaha">Gampaha</option>
                        <option value="Hambantota">Hambantota</option>
                        <option value="Kalutara">Kalutara</option>
                        <option value="Kandy">Kandy</option>
                        <option value="Kegalle">Kegalle</option>
                        <option value="Kurunegala">Kurunegala</option>
                        <option value="Matale">Matale</option>
                        <option value="Matara">Matara</option>
                        <option value="Nuwara Eliya">Nuwara Eliya</option>
                        <option value="Ratnapura">Ratnapura</option>
                    </select>
                </label>
            </div>

            <!-- Select Type -->
            <div class="relative">
                <label>
                    <select name="type" class="form-select">
                        <option value="">Type</option>
                        <option value="Land">Land</option>
                        <option value="House">House</option>
                    </select>
                </label>
            </div>

            <div class="relative">
                <label>
                    <select name="category" class="form-select">
                        <option value="">Select Category</option>
                        <option value="Residential">Residential</option>
                        <option value="Commercial">Commercial</option>
                        <option value="Coconut Land">Coconut Land</option>
                        <option value="Water Front Land">Water Front Land</option>
                        <option value="Agricultural Land">Agricultural Land</option>
                        <option value="Paddy field facing lands">Paddy field facing lands</option>
                        <option value="Mountain view land">Mountain view land</option>
                        <option value="Up country lands">Up country lands</option>
                        <option value="Down south lands">Down south lands</option>
                        <option value="Close to sacred/ancient city lands">Close to sacred/ancient city lands</option>
                        <option value="Close to highways">Close to highways</option>
                        <option value="Close to Airport">Close to Airport</option>
                        <option value="Close to railway stations">Close to railway stations</option>
                    </select>
                </label>
            </div>

            <!-- Search Button -->
            <button type="submit" class="search-button">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
            </button>
        </form>
    </div>
</section>

<!-- About Company Section -->
<section class="about-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="about-container">
        <div class="about-grid">
            <div class="about-content animate-on-scroll">
                <h2 class="about-title">Why Homescape Haven is Number One?</h2>
                <p class="about-description">
                    Everyone aspires to own a great piece of property. We, at Homescape Haven, make it a reality.
                    Homescape Haven provide you with a selection of the most excellent land alternatives in the country,
                    as well as a variety of support services, such as legal and financial assistance, to help you
                    realize your property dreams. In Sri Lanka's highly competitive real estate market, Homescape Haven
                    acquired over 300,000 customers, sufficient proof of Homescape Haven capacity and leadership in
                    the real estate industry.
                </p>
                <a href="#" class="about-button">Explore More</a>
            </div>

            <div class="about-stats">
                <div class="stat-item animate-on-scroll">
                    <h3 class="stat-number">29+</h3>
                    <p class="stat-label">Years of Trust</p>
                </div>
                <div class="stat-item animate-on-scroll">
                    <h3 class="stat-number">18</h3>
                    <p class="stat-label">Districts Covered</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Properties Section -->
<section class="properties-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="properties-container">
        <h2 class="properties-title animate-on-scroll">Our Properties</h2>

        <c:choose>
            <%--@elvariable id="properties" type="data"--%>
            <c:when test="${empty properties}">
                <p class="empty-state">No properties available. Add a property to get started!</p>
            </c:when>
            <c:otherwise>
                <div class="properties-grid">
                    <c:forEach var="property" items="${properties}">
                        <div class="property-card animate-on-scroll">
                            <c:choose>
                                <c:when test="${not empty property.imagePath}">
                                    <img src="${pageContext.request.contextPath}${property.imagePath}" alt="Property Image" class="property-image" />
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/images/placeholder.jpg" alt="Property Image" class="property-image" />
                                </c:otherwise>
                            </c:choose>
                            <div class="property-content">
                                <h3 class="property-title">${property.address}</h3>
                                <p class="property-detail">Type: ${property.type}</p>
                                <p class="property-detail">City: ${property.city}</p>
                                <p class="property-detail">Price: LKR ${property.price}</p>
                                <div class="property-actions">
                                    <a href="${pageContext.request.contextPath}/property?action=view&id=${property.id}" class="action-button view-button">View</a>
                                    <a href="${pageContext.request.contextPath}/property?action=edit&id=${property.id}" class="action-button edit-button">Edit</a>
                                    <a href="${pageContext.request.contextPath}/property?action=delete&id=${property.id}" class="action-button delete-button" onclick="return confirm('Are you sure you want to delete this property?')">Delete</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Footer -->
<%@include file="/includes/footer.jsp"%>

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
        const header = document.querySelector('.header');
        if (header) {
            window.addEventListener('scroll', function() {
                if (window.scrollY > 50) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            });
        }

        // Animation for elements when they come into view
        const animatedElements = document.querySelectorAll('.animate-on-scroll');

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, {
            threshold: 0.1
        });

        animatedElements.forEach(element => {
            observer.observe(element);
        });

        // This script ensures the hero section starts right after the header
        const headerHeight = header ? header.offsetHeight : 0;
        const heroSection = document.querySelector('.hero-section');
        if (heroSection) {
            heroSection.style.paddingTop = headerHeight + 'px';
        }
    });
</script>
</body>
</html>