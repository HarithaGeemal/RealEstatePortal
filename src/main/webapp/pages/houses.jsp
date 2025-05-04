<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<style>
    /* Futuristic Houses Page Styles */
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Rajdhani:wght@300;400;500;600&display=swap');

    :root {
        --primary-glow: #0ea5e9;
        --secondary-glow: #6366f1;
        --accent-color: #10b981;
        --dark-bg: rgba(15, 23, 42, 0.8);
        --border-glow: rgba(14, 165, 233, 0.3);
    }

    body {
        font-family: 'Rajdhani', sans-serif;
        background-color: #0f172a;
        color: rgba(255, 255, 255, 0.9);
        margin: 0;
        padding: 0;
    }

    /* Hero Section */
    .hero-section {
        position: relative;
        height: 50vh;
        min-height: 400px;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        overflow: hidden;
    }

    .hero-bg {
        position: absolute;
        inset: 0;
        background-size: cover;
        background-position: center;
        filter: brightness(0.4) saturate(1.2);
        z-index: 1;
    }

    .hero-overlay {
        position: absolute;
        inset: 0;
        background: linear-gradient(to bottom, rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.9));
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
        letter-spacing: 1px;
    }

    /* Breadcrumb */
    .breadcrumb {
        background: rgba(15, 23, 42, 0.6);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        padding: 0.75rem 0;
        position: relative;
    }

    .breadcrumb::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        z-index: 1;
    }

    .breadcrumb-container {
        display: flex;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .breadcrumb-link {
        color: rgba(255, 255, 255, 0.7);
        transition: all 0.3s;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .breadcrumb-link:hover {
        color: #ffffff;
        text-shadow: 0 0 10px var(--primary-glow);
    }

    .breadcrumb-separator {
        margin: 0 0.5rem;
        color: rgba(255, 255, 255, 0.5);
    }

    .breadcrumb-current {
        color: #ffffff;
        font-weight: 500;
    }

    /* Featured Houses Section */
    .featured-section {
        padding: 5rem 0;
        position: relative;
        background: linear-gradient(to bottom, rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.8));
    }

    .section-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        position: relative;
        z-index: 2;
    }

    .section-header {
        display: flex;
        align-items: center;
        margin-bottom: 2rem;
    }

    .section-line {
        width: 4px;
        height: 2.5rem;
        background: linear-gradient(to bottom, var(--primary-glow), var(--secondary-glow));
        margin-right: 1rem;
        border-radius: 2px;
        box-shadow: 0 0 10px rgba(14, 165, 233, 0.5);
    }

    .section-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 2.5rem;
        font-weight: 700;
        background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        letter-spacing: 1px;
    }

    .section-description {
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 3rem;
        max-width: 800px;
        line-height: 1.6;
    }

    /* Property Cards */
    .property-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        gap: 2rem;
    }

    @media (min-width: 640px) {
        .property-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (min-width: 1024px) {
        .property-grid.featured-grid {
            grid-template-columns: repeat(4, 1fr);
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

    .property-image-container {
        position: relative;
        height: 200px;
        overflow: hidden;
    }

    .property-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }

    .property-card:hover .property-image {
        transform: scale(1.05);
    }

    .property-image-overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(15, 23, 42, 0.8);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        padding: 0.75rem;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .property-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: white;
        margin: 0;
    }

    .property-content {
        padding: 1.5rem;
    }

    .property-location {
        display: flex;
        align-items: center;
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 0.75rem;
        font-size: 0.95rem;
    }

    .property-location-icon {
        margin-right: 0.5rem;
        color: var(--primary-glow);
    }

    .property-price {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
        background: linear-gradient(to right, var(--primary-glow), var(--accent-color));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 5px rgba(14, 165, 233, 0.3);
    }

    .property-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .view-details {
        display: flex;
        align-items: center;
        color: var(--primary-glow);
        font-weight: 500;
        transition: all 0.3s;
        text-decoration: none;
    }

    .view-details:hover {
        color: var(--secondary-glow);
        text-shadow: 0 0 5px rgba(14, 165, 233, 0.3);
    }

    .view-details-icon {
        margin-left: 0.5rem;
    }

    .action-buttons {
        display: flex;
        gap: 0.5rem;
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
        border: none;
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

    /* Main Content Section */
    .main-section {
        padding: 5rem 0;
        position: relative;
        background: rgba(15, 23, 42, 0.9);
    }

    .main-container {
        display: flex;
        flex-direction: column;
        gap: 2rem;
    }

    @media (min-width: 1024px) {
        .main-container {
            flex-direction: row;
        }

        .main-content {
            width: 66.666667%;
        }

        .sidebar {
            width: 33.333333%;
        }
    }

    /* Filter Sidebar */
    .filter-container {
        background: rgba(30, 41, 59, 0.5);
        border-radius: 16px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        padding: 2rem;
        position: relative;
    }

    .filter-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
        z-index: 1;
    }

    .filter-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 1.75rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
        background: linear-gradient(to right, var(--accent-color), var(--primary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(16, 185, 129, 0.3);
    }

    .filter-group {
        margin-bottom: 1.5rem;
    }

    .filter-label {
        display: block;
        font-weight: 500;
        margin-bottom: 0.5rem;
        color: rgba(255, 255, 255, 0.9);
    }

    .filter-select-container {
        position: relative;
    }

    .filter-select {
        width: 100%;
        padding: 0.75rem 1rem;
        border-radius: 8px;
        border: 1px solid rgba(255, 255, 255, 0.2);
        color: white;
        font-family: 'Rajdhani', sans-serif;
        font-size: 1rem;
        transition: all 0.3s ease;
        appearance: none;
        background: rgba(255, 255, 255, 0.1) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E") no-repeat right 10px center;
        background-size: 16px;
    }

    .filter-select:focus {
        outline: none;
        border-color: var(--primary-glow);
        box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);
    }

    /*.filter-input-container {*/
    /*    position: relative;*/
    /*}*/

    /*.filter-input {*/
    /*    width: 100%;*/
    /*    padding: 0.75rem 3.5rem 0.75rem 1rem;*/
    /*    border-radius: 8px;*/
    /*    background: rgba(255, 255, 255, 0.1);*/
    /*    border: 1px solid rgba(255, 255, 255, 0.2);*/
    /*    color: white;*/
    /*    font-family: 'Rajdhani', sans-serif;*/
    /*    font-size: 1rem;*/
    /*    transition: all 0.3s ease;*/
    /*}*/

    /*.filter-input:focus {*/
    /*    outline: none;*/
    /*    border-color: var(--primary-glow);*/
    /*    box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);*/
    /*}*/

    /*.filter-input-suffix {*/
    /*    position: absolute;*/
    /*    right: 0;*/
    /*    top: 0;*/
    /*    bottom: 0;*/
    /*    display: flex;*/
    /*    align-items: center;*/
    /*    padding: 0 1rem;*/
    /*    background: rgba(255, 255, 255, 0.1);*/
    /*    border-top-right-radius: 8px;*/
    /*    border-bottom-right-radius: 8px;*/
    /*    color: rgba(255, 255, 255, 0.7);*/
    /*    font-weight: 500;*/
    /*}*/

    .filter-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 2rem;
    }

    .filter-reset {
        color: rgba(255, 255, 255, 0.7);
        transition: all 0.3s;
        text-decoration: none;
    }

    .filter-reset:hover {
        color: #ffffff;
        text-shadow: 0 0 10px var(--primary-glow);
    }

    .filter-submit {
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
        position: relative;
        overflow: hidden;
    }

    .filter-submit:hover {
        box-shadow: 0 0 20px rgba(14, 165, 233, 0.4);
        transform: translateY(-2px);
    }

    .filter-submit::after {
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

    .filter-submit:hover::after {
        transform: rotate(30deg) translate(10%, 10%);
        opacity: 1;
    }

    /* Back to Top Button */
    .back-to-top {
        position: fixed;
        bottom: 2rem;
        left: 2rem;
        width: 3rem;
        height: 3rem;
        background: rgba(30, 41, 59, 0.8);
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        box-shadow: 0 0 15px rgba(14, 165, 233, 0.3);
        transition: all 0.3s ease;
        z-index: 100;
        text-decoration: none;
    }

    .back-to-top:hover {
        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
        transform: translateY(-5px);
        box-shadow: 0 0 20px rgba(14, 165, 233, 0.5);
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
</style>

<!-- Hero Section -->
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
        <h1 class="hero-title">Houses</h1>
        <p class="hero-description">Everyone aspires to own a great piece of property. We, at Homescape Haven, make it a reality.</p>
    </div>
</section>

<!-- Breadcrumb Navigation -->
<div class="breadcrumb">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}/" class="breadcrumb-link">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
            Home
        </a>
        <span class="breadcrumb-separator">›</span>
        <span class="breadcrumb-current">Houses</span>
    </div>
</div>

<!-- Featured Houses Section -->
<section class="featured-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="section-container">
        <div class="section-header">
            <div class="section-line"></div>
            <h2 class="section-title">Featured Houses</h2>
        </div>

        <p class="section-description">
            Explore a diverse selection of housing projects designed to match your unique needs. Discover the perfect property for your lifestyle or next investment opportunity today.
        </p>

        <c:choose>
            <%--@elvariable id="houses" type="data"--%>
            <c:when test="${empty houses}">
                <p class="empty-state">No featured houses available.</p>
            </c:when>
            <c:otherwise>
                <div class="property-grid featured-grid">
                    <c:forEach var="house" items="${houses}" begin="0" end="3">
                        <div class="property-card">
                            <div class="property-image-container">
                                <c:choose>
                                    <c:when test="${not empty house.imagePath}">
                                        <img src="${pageContext.request.contextPath}${house.imagePath}" alt="House Image" class="property-image">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/images/placeholder.jpg" alt="House Image" class="property-image">
                                    </c:otherwise>
                                </c:choose>
                                <div class="property-image-overlay">
                                    <h3 class="property-title">${house.address != null ? house.address : 'Property'} - ${house.city}</h3>
                                </div>
                            </div>
                            <div class="property-content">
                                <div class="property-location">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="property-location-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                        <circle cx="12" cy="10" r="3"></circle>
                                    </svg>
                                    <span>${house.city}</span>
                                </div>
                                <div class="property-price">${house.price} LKR</div>
                                <a href="${pageContext.request.contextPath}/property?action=view&id=${house.id}" class="filter-submit w-full text-center">View Details</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Main Content: Houses and Filters -->
<section class="main-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="section-container">
        <div class="section-header">
            <div class="section-line"></div>
            <h2 class="section-title">Find your dream</h2>
        </div>

        <div class="main-container">
            <!-- Left: Houses -->
            <div class="main-content">
                <c:choose>
                    <%--@elvariable id="houses" type="data"--%>
                    <c:when test="${empty houses}">
                        <p class="empty-state">No houses available. Add a house to get started!</p>
                    </c:when>
                    <c:otherwise>
                        <div class="property-grid">
                            <c:forEach var="house" items="${houses}">
                                <div class="property-card">
                                    <div class="property-image-container">
                                        <c:choose>
                                            <c:when test="${not empty house.imagePath}">
                                                <img src="${pageContext.request.contextPath}${house.imagePath}" alt="House Image" class="property-image">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/images/placeholder.jpg" alt="House Image" class="property-image">
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="property-image-overlay">
                                            <h3 class="property-title">${house.address != null ? house.address : 'Property'} - ${house.city}</h3>
                                        </div>
                                    </div>
                                    <div class="property-content">
                                        <div class="property-location">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="property-location-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                                <circle cx="12" cy="10" r="3"></circle>
                                            </svg>
                                            <span>${house.city}</span>
                                        </div>
                                        <div class="property-price">${house.price} LKR</div>
                                        <div class="property-actions">
                                            <a href="${pageContext.request.contextPath}/property?action=view&id=${house.id}" class="view-details">
                                                Explore House
                                                <svg xmlns="http://www.w3.org/2000/svg" class="view-details-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                    <path d="M5 12h14"></path>
                                                    <path d="M12 5l7 7-7 7"></path>
                                                </svg>
                                            </a>
                                            <div class="action-buttons">
                                                <a href="${pageContext.request.contextPath}/property?action=edit&id=${house.id}" class="action-button edit-button">Edit</a>
                                                <a href="${pageContext.request.contextPath}/property?action=delete&id=${house.id}" class="action-button delete-button" onclick="return confirm('Are you sure you want to delete this property?')">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Right: Filters -->
            <div class="sidebar">
                <div class="filter-container">
                    <h3 class="filter-title">Filters</h3>
                    <form action="${pageContext.request.contextPath}/houses" method="post">
                        <div class="filter-group">
                            <label class="filter-label">House Category</label>
                            <div class="filter-select-container">
                                <label>
                                    <select name="category" class="filter-select">
                                        <option value="">Select House Category</option>
                                        <option value="Residential">Residential</option>
                                        <option value="Commercial">Commercial</option>
                                    </select>
                                </label>
                            </div>
                        </div>

                        <div class="filter-group">
                            <label class="filter-label">Districts</label>
                            <div class="filter-select-container">
                                <select name="city" class="filter-select">
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
                            </div>
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


                    <%--                        <div class="filter-group">--%>
<%--                            <label class="filter-label">Unit Price (Min)</label>--%>
<%--                            <div class="filter-input-container">--%>
<%--                                <input type="number" name="minPrice" placeholder="" class="filter-input">--%>
<%--                                <div class="filter-input-suffix">LKR</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="filter-group">--%>
<%--                            <label class="filter-label">Unit Price (Max)</label>--%>
<%--                            <div class="filter-input-container">--%>
<%--                                <input type="number" name="maxPrice" placeholder="" class="filter-input">--%>
<%--                                <div class="filter-input-suffix">LKR</div>--%>
<%--                            </div>--%>
<%--                        </div>--%>


                        <div class="filter-actions">
                            <a href="${pageContext.request.contextPath}/houses" class="filter-reset">Reset</a>
                            <button type="submit" class="filter-submit">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Back to Top Button -->
<a href="#" class="back-to-top">
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 19V5"></path>
        <path d="M5 12l7-7 7 7"></path>
    </svg>
</a>

<script>
    // Animation for scroll effects
    document.addEventListener('DOMContentLoaded', function() {
        // Add glow effect to property cards on scroll
        const propertyCards = document.querySelectorAll('.property-card');

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, {
            threshold: 0.1
        });

        propertyCards.forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
            observer.observe(card);
        });
    });
</script>

<%@ include file="../includes/footer.jsp" %>
