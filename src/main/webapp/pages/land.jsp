<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="../includes/header.jsp" %>

<style>
    :root {
        --primary-glow: #0ea5e9;
        --secondary-glow: #6366f1;
        --accent-color: #10b981;
        --dark-bg: rgba(15, 23, 42, 0.8);
        --border-glow: rgba(14, 165, 233, 0.3);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Rajdhani', sans-serif;
        background-color: #0f172a;
        color: rgba(255, 255, 255, 0.9);
        min-height: 100vh;
        line-height: 1.6;
    }

    /* Hero Section */
    .hero-section {
        position: relative;
        height: 400px;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .hero-bg {
        position: absolute;
        inset: 0;
        background-size: cover;
        background-position: center;
        z-index: 1;
        filter: brightness(0.6);
    }

    .hero-content {
        position: relative;
        z-index: 10;
        text-align: center;
    }

    .hero-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 4rem;
        font-weight: 700;
        margin-bottom: 1rem;
        background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 15px rgba(14, 165, 233, 0.3);
        letter-spacing: 2px;
    }

    /* Breadcrumb */
    .breadcrumb {
        background: rgba(30, 41, 59, 0.5);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        padding: 1rem 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .breadcrumb-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        align-items: center;
    }

    .breadcrumb-link {
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
        display: flex;
        align-items: center;
        transition: color 0.3s ease;
    }

    .breadcrumb-link:hover {
        color: white;
    }

    .breadcrumb-separator {
        margin: 0 0.75rem;
        color: rgba(255, 255, 255, 0.5);
    }

    .breadcrumb-current {
        color: white;
        font-weight: 500;
    }

    /* Featured Lands Section */
    .featured-section {
        padding: 5rem 0;
        position: relative;
        background: linear-gradient(to bottom, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        position: relative;
        z-index: 2;
    }

    .section-header {
        display: flex;
        align-items: center;
        margin-bottom: 1.5rem;
    }

    .section-line {
        width: 4px;
        height: 40px;
        background: linear-gradient(to bottom, var(--primary-glow), var(--secondary-glow));
        margin-right: 1rem;
        border-radius: 2px;
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
        font-size: 1.1rem;
        max-width: 800px;
    }

    /* Featured Lands Grid */
    .featured-grid {
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        gap: 2rem;
    }

    @media (min-width: 640px) {
        .featured-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (min-width: 1024px) {
        .featured-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }

    .featured-card {
        background: rgba(30, 41, 59, 0.5);
        border-radius: 16px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        transition: all 0.3s ease;
        position: relative;
    }

    .featured-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 30px rgba(14, 165, 233, 0.2);
        border-color: var(--primary-glow);
    }

    .featured-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 2px;
        background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        z-index: 1;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .featured-card:hover::before {
        opacity: 1;
    }

    .featured-image-container {
        position: relative;
        height: 200px;
        overflow: hidden;
    }

    .featured-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .featured-image-overlay {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(255, 255, 255, 0.9);
        padding: 1rem;
    }

    .featured-title {
        font-weight: 600;
        font-size: 1.1rem;
        color: #1e293b;
    }

    .featured-content {
        padding: 1.5rem;
    }

    .featured-location {
        display: flex;
        align-items: center;
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 1rem;
    }

    .featured-button {
        display: block;
        width: 100%;
        padding: 0.75rem;
        background: linear-gradient(135deg, var(--accent-color), #059669);
        color: white;
        border: none;
        border-radius: 8px;
        font-family: 'Rajdhani', sans-serif;
        font-weight: 500;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        text-align: center;
        text-decoration: none;
    }

    .featured-button:hover {
        box-shadow: 0 0 15px rgba(16, 185, 129, 0.4);
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

    /* Land Cards */
    .land-card {
        background: rgba(30, 41, 59, 0.5);
        border-radius: 16px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        transition: all 0.3s ease;
        position: relative;
        margin-bottom: 2rem;
    }

    .land-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 30px rgba(14, 165, 233, 0.2);
        border-color: var(--primary-glow);
    }

    .land-card-content {
        display: flex;
        flex-direction: column;
    }

    @media (min-width: 768px) {
        .land-card-content {
            flex-direction: row;
        }

        .land-image-container {
            width: 40%;
        }

        .land-details {
            width: 60%;
        }
    }

    .land-image-container {
        position: relative;
        height: 250px;
    }

    .land-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .land-location-badge {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 0.5rem;
        text-align: center;
    }

    .land-details {
        padding: 1.5rem;
    }

    .land-title {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        color: white;
    }

    .land-address {
        display: flex;
        align-items: center;
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 1rem;
    }

    .land-price {
        margin-bottom: 1.5rem;
    }

    .land-price-amount {
        font-size: 1.75rem;
        font-weight: 700;
        background: linear-gradient(to right, #ef4444, #dc2626);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
    }

    .land-price-unit {
        font-size: 0.875rem;
        color: rgba(255, 255, 255, 0.5);
        margin-top: 0.25rem;
    }

    .land-actions {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .land-link {
        display: inline-flex;
        align-items: center;
        color: var(--accent-color);
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .land-link:hover {
        color: #059669;
    }

    .land-link-icon {
        margin-left: 0.25rem;
    }

    .land-buttons {
        display: flex;
        gap: 0.5rem;
        margin-top: 1rem;
    }

    .land-button {
        padding: 0.5rem 1rem;
        border-radius: 6px;
        font-family: 'Rajdhani', sans-serif;
        font-weight: 500;
        font-size: 0.875rem;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        color: white;
        border: none;
    }

    .land-button-edit {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
    }

    .land-button-delete {
        background: linear-gradient(135deg, #ef4444, #dc2626);
    }

    .land-button:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    /* Sidebar / Filters */
    .sidebar {
        position: sticky;
        top: 2rem;
    }

    .filter-select option {
        background-color: #1e293b; /* dark blue-gray background */
        color: white;
        padding: 10px;
    }

    .filter-select {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        overflow-y: auto;
        max-height: 200px;
    }

    .filter-container {
        background: rgba(16, 185, 129, 0.2);
        border-radius: 16px;
        overflow: hidden;
        border: 1px solid rgba(16, 185, 129, 0.3);
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
        height: 2px;
        background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
        z-index: 1;
    }

    .filter-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: white;
    }

    .filter-group {
        margin-bottom: 1.5rem;
    }

    .filter-label {
        display: block;
        color: rgba(255, 255, 255, 0.9);
        margin-bottom: 0.5rem;
        font-weight: 500;
        font-size: 0.95rem;
    }

    .filter-select-container {
        position: relative;
    }

    .filter-select {
        width: 100%;
        padding: 0.75rem 1rem;
        background: rgba(255, 255, 255, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.2);
        border-radius: 8px;
        color: white;
        font-family: 'Rajdhani', sans-serif;
        font-size: 1rem;
        transition: all 0.3s ease;
        appearance: none;
    }

    .filter-select:focus {
        outline: none;
        border-color: var(--accent-color);
        box-shadow: 0 0 15px rgba(16, 185, 129, 0.2);
    }

    .filter-select-arrow {
        position: absolute;
        right: 1rem;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
    }

    .filter-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 2rem;
    }

    .filter-reset {
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .filter-reset:hover {
        color: white;
        text-decoration: underline;
    }

    .filter-submit {
        padding: 0.75rem 1.5rem;
        background: white;
        color: var(--accent-color);
        border: none;
        border-radius: 8px;
        font-family: 'Rajdhani', sans-serif;
        font-weight: 600;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .filter-submit:hover {
        background: rgba(255, 255, 255, 0.9);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    /* Back to Top Button */
    .back-to-top {
        position: fixed;
        bottom: 2rem;
        left: 2rem;
        width: 3rem;
        height: 3rem;
        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
        z-index: 100;
    }

    .back-to-top:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(14, 165, 233, 0.3);
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
    <div class="hero-bg" style="background-image: url('${pageContext.request.contextPath}/images/your-hero-image.jpg');"></div>

    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="hero-content">
        <h1 class="hero-title">Lands</h1>
    </div>
</section>

<!-- Breadcrumb Navigation -->
<div class="breadcrumb">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}/" class="breadcrumb-link">
            <i class="fas fa-home mr-1"></i> Home
        </a>
        <span class="breadcrumb-separator">›</span>
        <span class="breadcrumb-current">Lands</span>
    </div>
</div>

<!-- Featured Lands Section -->
<section class="featured-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="container">
        <div class="section-header">
            <div class="section-line"></div>
            <h2 class="section-title">Featured Lands</h2>
        </div>
        <p class="section-description">
            Choose from a wide range of lands across 18 districts, tailored to suit your needs
            and preferred location. Find the perfect plot for your lifestyle or investment today!
        </p>

        <c:choose>
            <%--@elvariable id="lands" type="data"--%>
            <c:when test="${empty lands}">
                <p class="empty-state">No featured lands available.</p>
            </c:when>
            <c:otherwise>
                <div class="featured-grid">
                    <c:forEach var="land" items="${lands}" begin="0" end="3" varStatus="loop">
                        <div class="featured-card">
                            <div class="featured-image-container" style="background-color: ${loop.index % 4 == 0 ? '#8e44ad' : loop.index % 4 == 1 ? '#f1c40f' : loop.index % 4 == 2 ? '#7cb342' : '#e74c3c'}">
                                <c:choose>
                                    <c:when test="${not empty land.imagePath}">
                                        <img src="${pageContext.request.contextPath}${land.imagePath}" alt="Land Logo" class="featured-image">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/images/land.jpg" alt="Land Logo" class="featured-image">
                                    </c:otherwise>
                                </c:choose>
                                <div class="featured-image-overlay">
                                    <h3 class="featured-title">${land.address != null ? land.address : 'Property'} - ${land.city}</h3>
                                </div>
                            </div>
                            <div class="featured-content">
                                <div class="featured-location">
                                    <i class="fas fa-map-marker-alt mr-2"></i>
                                    <span>${land.city}</span>
                                </div>
                                <a href="${pageContext.request.contextPath}/property?action=view&id=${land.id}" class="featured-button">View Details</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Main Content: Lands and Filters -->
<section class="main-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="container">
        <div class="section-header">
            <div class="section-line"></div>
            <h2 class="section-title">Find Your Dream Property</h2>
        </div>

        <div class="main-container">
            <!-- Left: Lands -->
            <div class="main-content">
                <c:choose>
                    <%--@elvariable id="lands" type="data"--%>
                    <c:when test="${empty lands}">
                        <p class="empty-state">No lands available. Add a land to get started!</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="land" items="${lands}">
                            <div class="land-card">
                                <div class="land-card-content">
                                    <div class="land-image-container">
                                        <c:choose>
                                            <c:when test="${not empty land.imagePath}">
                                                <img src="${pageContext.request.contextPath}${land.imagePath}" alt="Land Logo" class="land-image">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/images/land.jpg" alt="Land Logo" class="land-image">
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="land-location-badge">${land.city}</div>
                                    </div>
                                    <div class="land-details">
                                        <h3 class="land-title">${land.address != null ? land.address : 'Property'} - ${land.city}</h3>
                                        <div class="land-address">
                                            <i class="fas fa-map-marker-alt mr-2"></i>
                                            <span>${land.address}</span>
                                        </div>
                                        <div class="land-price">
                                            <div class="land-price-amount">${land.price} LKR</div>
                                            <div class="land-price-unit">PER PERCH UPWARDS</div>
                                        </div>
                                        <div class="land-actions">
                                            <a href="${pageContext.request.contextPath}/property?action=view&id=${land.id}" class="land-link">
                                                Explore Land
                                                <svg xmlns="http://www.w3.org/2000/svg" class="land-link-icon" viewBox="0 0 20 20" fill="currentColor" width="16" height="16">
                                                    <path fill-rule="evenodd" d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                </svg>
                                            </a>
                                            <div class="land-buttons">
                                                <a href="${pageContext.request.contextPath}/property?action=edit&id=${land.id}" class="land-button land-button-edit">Edit</a>
                                                <a href="${pageContext.request.contextPath}/property?action=delete&id=${land.id}" class="land-button land-button-delete" onclick="return confirm('Are you sure you want to delete this property?')">Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Right: Filters -->
            <div class="sidebar">
                <div class="filter-container">
                    <h3 class="filter-title">Filters</h3>
                    <form action="<c:url value="/land"/>" method="post" class="search-form">
                        <!-- Districts -->
                        <div class="filter-group">
                            <label class="filter-label">Districts</label>
                            <div class="filter-select-container">
                                <label>
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
                                </label>
                                <div class="filter-select-arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="16" height="16">
                                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Categories -->
                        <div class="filter-group">
                            <label class="filter-label">Categories</label>
                            <div class="filter-select-container">
                                <label>
                                    <select name="category" class="filter-select">
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
                                <div class="filter-select-arrow">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="16" height="16">
                                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Reset and Search Buttons -->
                        <div class="filter-actions">
                            <a href="<c:url value="/land"/>" class="filter-reset">Reset</a>
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
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="20" height="20">
        <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd"></path>
    </svg>
</a>

<!-- Include Footer -->
<%@ include file="../includes/footer.jsp" %>