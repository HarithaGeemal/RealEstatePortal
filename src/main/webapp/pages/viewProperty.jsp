<%--@elvariable id="property" type="com.realestate.model.Property"--%>
<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Include Header -->
<%@ include file="../includes/header.jsp" %>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');

    :root {
        --primary-glow: #0ea5e9;
        --secondary-glow: #6366f1;
        --accent-color: #10b981;
        --accent-secondary: #f97316;
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
        overflow-x: hidden;
    }

    /* Animated background */
    .animated-bg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        background: radial-gradient(circle at 50% 50%, rgba(16, 185, 129, 0.05), transparent 70%),
        radial-gradient(circle at 80% 20%, rgba(14, 165, 233, 0.05), transparent 50%);
    }

    .animated-bg::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100' viewBox='0 0 100 100'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%230ea5e9' fill-opacity='0.03'%3E%3Cpath opacity='.5' d='M96 95h4v1h-4v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4h-9v4h-1v-4H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15v-9H0v-1h15V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h9V0h1v15h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9h4v1h-4v9zm-1 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm9-10v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-10 0v-9h-9v9h9zm-9-10h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9zm10 0h9v-9h-9v9z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        opacity: 0.5;
    }

    /* Hero Section */
    .hero-section {
        position: relative;
        height: 50vh;
        min-height: 400px;
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
        filter: brightness(0.5);
        transform: scale(1.05);
        transition: transform 10s ease;
        animation: slowZoom 20s infinite alternate;
    }

    @keyframes slowZoom {
        0% {
            transform: scale(1);
        }
        100% {
            transform: scale(1.1);
        }
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
        text-align: center;
        max-width: 800px;
        padding: 0 20px;
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
        animation: titleGlow 3s infinite alternate;
    }

    @keyframes titleGlow {
        0% {
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        }
        100% {
            text-shadow: 0 0 25px rgba(14, 165, 233, 0.6);
        }
    }

    .hero-subtitle {
        font-size: 1.5rem;
        color: rgba(255, 255, 255, 0.8);
        max-width: 600px;
        margin: 0 auto;
        animation: fadeIn 1s ease-out;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Breadcrumb */
    .breadcrumb {
        background: rgba(30, 41, 59, 0.5);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        padding: 1rem 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        position: relative;
        z-index: 20;
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
        transition: all 0.3s ease;
    }

    .breadcrumb-link:hover {
        color: white;
        transform: translateY(-2px);
    }

    .breadcrumb-separator {
        margin: 0 0.75rem;
        color: rgba(255, 255, 255, 0.5);
    }

    .breadcrumb-current {
        color: white;
        font-weight: 500;
    }

    /* Property Details Section */
    .details-section {
        padding: 5rem 0;
        position: relative;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        position: relative;
        z-index: 2;
    }

    .property-card {
        background: rgba(30, 41, 59, 0.5);
        border-radius: 24px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        transition: all 0.5s ease;
        position: relative;
        max-width: 1000px;
        margin: 0 auto;
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
        animation: cardFloat 6s ease-in-out infinite;
    }

    @keyframes cardFloat {
        0%, 100% {
            transform: translateY(0);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
        }
        50% {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
        }
    }

    .property-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--accent-color), var(--primary-glow), transparent);
        z-index: 1;
        animation: borderGlow 3s infinite linear;
    }

    @keyframes borderGlow {
        0% {
            background-position: 0% 0%;
        }
        100% {
            background-position: 200% 0%;
        }
    }

    .property-card::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: linear-gradient(90deg, transparent, var(--accent-color), var(--secondary-glow), var(--primary-glow), var(--accent-color), transparent);
        z-index: 1;
        animation: borderGlow 3s infinite linear reverse;
    }

    .property-layout {
        display: grid;
        grid-template-columns: 1fr;
    }

    @media (min-width: 992px) {
        .property-layout {
            grid-template-columns: 1fr 1fr;
        }
    }

    .property-image-container {
        position: relative;
        height: 400px;
        overflow: hidden;
    }

    .property-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.7s ease;
    }

    .property-image-container:hover .property-image {
        transform: scale(1.05);
    }

    .property-image-overlay {
        position: absolute;
        inset: 0;
        background: linear-gradient(to top, rgba(15, 23, 42, 0.8), transparent);
        z-index: 2;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .property-image-container:hover .property-image-overlay {
        opacity: 1;
    }

    .property-type-badge {
        position: absolute;
        top: 20px;
        right: 20px;
        background: linear-gradient(135deg, var(--accent-color), var(--accent-secondary));
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 30px;
        font-weight: 600;
        z-index: 3;
        box-shadow: 0 5px 15px rgba(16, 185, 129, 0.3);
        animation: badgePulse 2s infinite alternate;
    }

    @keyframes badgePulse {
        0% {
            transform: scale(1);
            box-shadow: 0 5px 15px rgba(16, 185, 129, 0.3);
        }
        100% {
            transform: scale(1.05);
            box-shadow: 0 5px 20px rgba(16, 185, 129, 0.5);
        }
    }

    .property-content {
        padding: 2.5rem;
    }

    .property-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
        background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        line-height: 1.2;
    }

    .property-details-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    @media (min-width: 768px) {
        .property-details-grid {
            grid-template-columns: 1fr 1fr;
        }
    }

    .property-detail {
        position: relative;
        padding-left: 2rem;
    }

    .detail-icon {
        position: absolute;
        left: 0;
        top: 0.2rem;
        color: var(--accent-color);
    }

    .detail-label {
        font-weight: 600;
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 0.25rem;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .detail-value {
        color: white;
        font-size: 1.1rem;
    }

    .price-container {
        margin: 2rem 0;
        padding: 1.5rem;
        background: rgba(15, 23, 42, 0.5);
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .price-label {
        font-weight: 600;
        color: rgba(255, 255, 255, 0.7);
        font-size: 1.1rem;
    }

    .price-value {
        font-size: 2.5rem;
        font-weight: 700;
        background: linear-gradient(to right, #ef4444, #f97316);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(239, 68, 68, 0.3);
        animation: pricePulse 3s infinite alternate;
    }

    @keyframes pricePulse {
        0% {
            text-shadow: 0 0 10px rgba(239, 68, 68, 0.3);
        }
        100% {
            text-shadow: 0 0 20px rgba(239, 68, 68, 0.6);
        }
    }

    .property-actions {
        display: flex;
        gap: 1rem;
        margin-top: 2rem;
        flex-wrap: wrap;
    }

    .property-button {
        padding: 0.75rem 1.5rem;
        border-radius: 12px;
        font-family: 'Rajdhani', sans-serif;
        font-weight: 600;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        color: white;
        border: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }

    .property-button::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(255, 255, 255, 0.1);
        transform: translateX(-100%);
        transition: transform 0.3s ease;
        z-index: -1;
    }

    .property-button:hover::before {
        transform: translateX(0);
    }

    .button-edit {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
    }

    .button-delete {
        background: linear-gradient(135deg, #ef4444, #dc2626);
    }

    .button-back {
        background: linear-gradient(135deg, #64748b, #475569);
    }

    .property-button:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    .button-edit:hover {
        box-shadow: 0 0 20px rgba(59, 130, 246, 0.5);
    }

    .button-delete:hover {
        box-shadow: 0 0 20px rgba(239, 68, 68, 0.5);
    }

    .button-back:hover {
        box-shadow: 0 0 20px rgba(100, 116, 139, 0.5);
    }

    .button-icon {
        margin-right: 0.75rem;
        font-size: 1.1rem;
    }

    /* Seller Info Section */
    .seller-section {
        margin-top: 2rem;
        padding: 1.5rem;
        background: rgba(15, 23, 42, 0.5);
        border-radius: 16px;
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    .seller-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        color: white;
        display: flex;
        align-items: center;
    }

    .seller-title-icon {
        margin-right: 0.75rem;
        color: var(--accent-color);
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
        opacity: 0.15;
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
        animation: rotate 30s linear infinite;
    }

    .shape-2 {
        width: 200px;
        height: 200px;
        bottom: 20%;
        right: 10%;
        border-color: var(--secondary-glow);
        transform: rotate(45deg);
        animation: float 15s ease-in-out infinite alternate;
    }

    .shape-3 {
        width: 150px;
        height: 150px;
        top: 40%;
        right: 20%;
        border-color: var(--accent-color);
        border-radius: 10px;
        transform: rotate(30deg);
        animation: pulse 10s ease-in-out infinite;
    }

    @keyframes rotate {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    @keyframes float {
        0% {
            transform: translateY(0) rotate(45deg);
        }
        100% {
            transform: translateY(-30px) rotate(45deg);
        }
    }

    @keyframes pulse {
        0%, 100% {
            transform: scale(1) rotate(30deg);
            opacity: 0.5;
        }
        50% {
            transform: scale(1.1) rotate(30deg);
            opacity: 0.8;
        }
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .property-actions {
            flex-direction: column;
        }

        .property-button {
            width: 100%;
        }

        .property-image-container {
            height: 300px;
        }

        .hero-title {
            font-size: 2.5rem;
        }

        .property-title {
            font-size: 2rem;
        }

        .price-value {
            font-size: 2rem;
        }
    }
</style>

<!-- Animated Background -->
<div class="animated-bg"></div>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-bg" style="background-image:url('${pageContext.request.contextPath}${not empty property.imagePath ? property.imagePath : '/images/placeholder.jpg'}');"></div>
    <div class="hero-overlay"></div>

    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="hero-content">
        <h1 class="hero-title">Property Details</h1>
        <p class="hero-subtitle">Explore this exceptional property and discover your next investment opportunity</p>
    </div>
</section>

<!-- Breadcrumb Navigation -->
<div class="breadcrumb">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}/" class="breadcrumb-link">
            <i class="fas fa-home mr-1"></i> Home
        </a>
        <span class="breadcrumb-separator">›</span>
        <a href="${pageContext.request.contextPath}/land" class="breadcrumb-link">
            <i class="fas fa-map mr-1"></i> Lands
        </a>
        <span class="breadcrumb-separator">›</span>
        <span class="breadcrumb-current">${property.address}</span>
    </div>
</div>

<!-- Property Details Section -->
<section class="details-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="container">
        <div class="property-card">
            <div class="property-layout">
                <div class="property-image-container">
                    <div class="property-type-badge">${property.type}</div>
                    <div class="property-image-overlay"></div>
                    <c:choose>
                        <c:when test="${not empty property.imagePath}">
                            <img src="${pageContext.request.contextPath}${property.imagePath}" alt="Property Image" class="property-image">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/placeholder.jpg" alt="Property Image" class="property-image">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="property-content">
                    <h2 class="property-title">${property.address}</h2>

                    <div class="property-details-grid">
                        <div class="property-detail">
                            <i class="fas fa-tag detail-icon"></i>
                            <div class="detail-label">Category</div>
                            <div class="detail-value">${property.category}</div>
                        </div>

                        <div class="property-detail">
                            <i class="fas fa-map-marker-alt detail-icon"></i>
                            <div class="detail-label">City</div>
                            <div class="detail-value">${property.city}</div>
                        </div>
                    </div>

                    <div class="price-container">
                        <div class="price-label">Price</div>
                        <div class="price-value">LKR ${property.price}</div>
                    </div>

                    <div class="seller-section">
                        <h3 class="seller-title">
                            <i class="fas fa-user-tie seller-title-icon"></i>
                            Seller Information
                        </h3>

                        <div class="property-details-grid">
                            <div class="property-detail">
                                <i class="fas fa-user detail-icon"></i>
                                <div class="detail-label">Name</div>
                                <div class="detail-value">${property.sellerName}</div>
                            </div>

                            <div class="property-detail">
                                <i class="fas fa-phone detail-icon"></i>
                                <div class="detail-label">Contact</div>
                                <div class="detail-value">${property.sellerContact}</div>
                            </div>

                            <div class="property-detail">
                                <i class="fas fa-envelope detail-icon"></i>
                                <div class="detail-label">Email</div>
                                <div class="detail-value">${property.sellerEmail}</div>
                            </div>
                        </div>
                    </div>

                    <div class="property-actions">
                        <a href="${pageContext.request.contextPath}/property?action=edit&id=${property.id}" class="property-button button-edit">
                            <i class="fas fa-edit button-icon"></i> Edit Property
                        </a>
                        <a href="${pageContext.request.contextPath}/property?action=delete&id=${property.id}" class="property-button button-delete" onclick="return confirm('Are you sure you want to delete this property?')">
                            <i class="fas fa-trash-alt button-icon"></i> Delete Property
                        </a>
                        <a href="${pageContext.request.contextPath}/home" class="property-button button-back">
                            <i class="fas fa-arrow-left button-icon"></i> Back to Home
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    // Add subtle parallax effect to hero image
    document.addEventListener('mousemove', (e) => {
        const heroSection = document.querySelector('.hero-section');
        if (!heroSection) return;

        const moveX = (e.clientX - window.innerWidth / 2) / 25;
        const moveY = (e.clientY - window.innerHeight / 2) / 25;

        const heroBg = heroSection.querySelector('.hero-bg');
        if (heroBg) {
            heroBg.style.transform = `translate(${moveX}px, ${moveY}px) scale(1.05)`;
        }
    });

    // Add animation to property card on scroll
    document.addEventListener('DOMContentLoaded', () => {
        const propertyCard = document.querySelector('.property-card');
        if (!propertyCard) return;

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.1 });

        propertyCard.style.opacity = '0';
        propertyCard.style.transform = 'translateY(50px)';
        propertyCard.style.transition = 'opacity 0.8s ease, transform 0.8s ease';

        observer.observe(propertyCard);
    });
</script>

<!-- Include Footer -->
<%@ include file="../includes/footer.jsp" %>

