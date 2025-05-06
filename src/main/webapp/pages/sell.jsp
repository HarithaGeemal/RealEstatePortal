<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/includes/header.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell Your Property - Homescape Haven</title>

    <!-- Import fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Rajdhani:wght@300;400;500;600&display=swap" rel="stylesheet">

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

        /* Property Submission Section */
        .property-submission-section {
            padding: 5rem 0;
            position: relative;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.8));
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 2;
        }

        .flex-container {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .flex-container {
                flex-direction: row;
            }

            .column-half {
                width: 50%;
            }
        }

        /* Left Column Styles */
        .left-column {
            position: relative;
        }

        .section-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
            letter-spacing: 1px;
            line-height: 1.2;
        }

        .section-description {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        /* Contact Cards */
        .contact-cards {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .contact-card {
            flex: 1;
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 1rem;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            transition: all 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-color: var(--primary-glow);
        }

        .contact-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            border-radius: 50%;
            margin-right: 1rem;
            color: white;
        }

        .contact-info h4 {
            font-weight: 600;
            color: white;
            margin-bottom: 0.25rem;
        }

        .contact-info p {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.95rem;
        }

        /* Form Styles */
        .form-select option {
            background-color: #1e293b; /* dark blue-gray background */
            color: white;
            padding: 10px;
        }

        .form-select {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            overflow-y: auto;
            max-height: 200px;
        }


        .submission-form {
            background: rgba(30, 41, 59, 0.5);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 2rem;
            position: relative;
        }

        .submission-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
            z-index: 1;
        }

        .form-section-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            color: white;
            position: relative;
            display: inline-block;
        }

        .form-section-title::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 50px;
            height: 2px;
            background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-row {
            display: flex;
            gap: 1rem;
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-label {
            display: block;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.95rem;
            letter-spacing: 1px;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: white;
            font-family: 'Rajdhani', sans-serif;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);
        }

        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px;
        }

        .form-file {
            padding: 0.5rem;
            background: rgba(255, 255, 255, 0.05);
        }

        .form-file::-webkit-file-upload-button {
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            margin-right: 1rem;
            font-family: 'Rajdhani', sans-serif;
            transition: all 0.3s ease;
        }

        .form-file::-webkit-file-upload-button:hover {
            box-shadow: 0 0 15px rgba(14, 165, 233, 0.3);
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--accent-color), #059669);
            color: white;
            border: none;
            border-radius: 8px;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            letter-spacing: 1px;
            margin-top: 1rem;
        }

        .submit-button:hover {
            box-shadow: 0 0 20px rgba(16, 185, 129, 0.4);
            transform: translateY(-2px);
        }

        .submit-button::after {
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

        .submit-button:hover::after {
            transform: rotate(30deg) translate(10%, 10%);
            opacity: 1;
        }

        /* Right Column Styles */
        .right-column {
            position: relative;
            display: none;
        }

        @media (min-width: 768px) {
            .right-column {
                display: block;
            }
        }

        .property-image {
            width: 100%;
            height: 700px;
            object-fit: cover;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .image-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.2), rgba(15, 23, 42, 0.6));
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 2rem;
        }

        .overlay-content {
            max-width: 80%;
        }

        .overlay-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: white;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .overlay-text {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            margin-bottom: 1.5rem;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .feature-list {
            list-style: none;
            margin-bottom: 1.5rem;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
            color: rgba(255, 255, 255, 0.9);
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
        }

        .feature-icon {
            margin-right: 0.5rem;
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
    </style>
</head>
<body>
<section class="property-submission-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="container">
        <div class="flex-container">
            <!-- Left Side: Form and Contact Details -->
            <div class="column-half left-column">
                <h2 class="section-title">Get the Best Value for Your Property</h2>
                <p class="section-description">Are you looking to sell your land? Let us take the hassle out of the process!</p>

                <!-- Company Contact Details -->
                <div class="contact-cards">
                    <div class="contact-card">
                        <div class="contact-icon">
                            <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                            </svg>
                        </div>
                        <div class="contact-info">
                            <h4>Hotline Numbers</h4>
                            <p>+94 112 112 380</p>
                        </div>
                    </div>
                    <div class="contact-card">
                        <div class="contact-icon">
                            <svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <div class="contact-info">
                            <h4>Email</h4>
                            <p>info@homescapehaven.lk</p>
                        </div>
                    </div>
                </div>

                <!-- Form -->
                <form action="${pageContext.request.contextPath}/property" method="post" enctype="multipart/form-data" class="submission-form">
                    <h3 class="form-section-title">Contact Information</h3>
                    <div class="form-group">
                        <label for="sellerName" class="form-label">Full Name*</label>
                        <input type="text" id="sellerName" name="sellerName" class="form-control" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="sellerContact" class="form-label">Phone Number*</label>
                            <input type="text" id="sellerContact" name="sellerContact" class="form-control"
                                   pattern="\+94[0-9]{9}" title="Phone number must start with +94 followed by 9 digits (e.g., +94123456789)" required>
                        </div>
                        <div class="form-group">
                            <label for="sellerEmail" class="form-label">Email Address*</label>
                            <input type="email" id="sellerEmail" name="sellerEmail" class="form-control"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Please enter a valid email address (e.g., example@domain.com)" required>
                        </div>
                    </div>

                    <h3 class="form-section-title">Land Information</h3>
                    <div class="form-group">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" id="address" name="address" class="form-control" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="type" class="form-label">Type</label>
                            <select id="type" name="type" class="form-control form-select" required>
                                <option value="Land">Land</option>
                                <option value="House">House</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="city" class="form-label">City</label>
                            <select id="city" name="city" class="form-control form-select" required>
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
                    <div class="form-group">
                        <label for="category" class="form-label">Category</label>
                        <select id="category" name="category" class="form-control form-select" required>
                            <option value="">Select Category</option>
                            <option value="Residential">Residential</option>
                            <option value="Commercial">Commercial</option>
                            <option value="Coconut Land">Coconut Land</option>
                            <option value="Water Front Land">Water Front Land</option>
                            <option value="Agricultural Land">Agricultural Land</option>
                            <option value="Paddy field facing lands">Paddy field facing lands</option>
                            <option value="Mountain view lands">Mountain view lands</option>
                            <option value="Up country lands">Up country lands</option>
                            <option value="Down south lands">Down south lands</option>
                            <option value="Close to sacred/ancient city lands">Close to sacred/ancient city lands</option>
                            <option value="Close to highways">Close to highways</option>
                            <option value="Close to Airport">Close to Airport</option>
                            <option value="Close to railway stations">Close to railway stations</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="price" class="form-label">Price (LKR)</label>
                        <input type="number" id="price" name="price" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="image" class="form-label">Upload Image</label>
                        <input type="file" id="image" name="image" class="form-control form-file">
                    </div>
                    <button type="submit" class="submit-button">Submit Property</button>
                </form>
            </div>

            <!-- Right Side: Image -->
            <div class="column-half right-column">
                <div class="image-overlay">
                    <div class="overlay-content">
                        <h3 class="overlay-title">Why Sell With Us?</h3>
                        <p class="overlay-text">Join thousands of satisfied customers who have successfully sold their properties through Homescape Haven.</p>
                        <ul class="feature-list">
                            <li class="feature-item"><span class="feature-icon">✓</span><span>Expert market valuation</span></li>
                            <li class="feature-item"><span class="feature-icon">✓</span><span>Wide network of potential buyers</span></li>
                            <li class="feature-item"><span class="feature-icon">✓</span><span>Hassle-free paperwork handling</span></li>
                            <li class="feature-item"><span class="feature-icon">✓</span><span>Professional photography services</span></li>
                        </ul>


                        <img src="${pageContext.request.contextPath}/images/sell.jpg.jpg" alt="Sell Your Land" class="property-image" style="margin-top: 1.5rem; max-height: 400px;">
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<!-- Footer-->
<%@include file="/includes/footer.jsp"%>

<script>
    //  JavaScript here
</script>
</body>
</html>