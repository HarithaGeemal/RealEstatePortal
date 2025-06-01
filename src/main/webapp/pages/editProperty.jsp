<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>


<style>
    :root {
        --primary-glow: #0ea5e9;
        --secondary-glow: #6366f1;
        --accent-color: #10b981;
        --dark-bg: rgba(15, 23, 42, 0.8);
        --border-glow: rgba(14, 165, 233, 0.3);
    }

    .edit-property-section {
        padding: 5rem 0;
        position: relative;
        background: linear-gradient(to bottom, rgba(15, 23, 42, 0.9), rgba(15, 23, 42, 0.8));
        min-height: 100vh;
        display: flex;
        align-items: center;
    }

    .edit-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 0 20px;
        position: relative;
        z-index: 2;
    }

    .edit-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 2rem;
        text-align: center;
        background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
        letter-spacing: 1px;
    }

    .edit-subtitle {
        text-align: center;
        color: rgba(255, 255, 255, 0.7);
        margin-bottom: 3rem;
        font-size: 1.1rem;
    }

    .edit-form-container {
        background: rgba(30, 41, 59, 0.5);
        border-radius: 16px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        padding: 2.5rem;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        position: relative;
    }

    .edit-form-container::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 2px;
        background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
        z-index: 1;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    @media (min-width: 640px) {
        .form-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-group.full-width {
        grid-column: 1 / -1;
    }

    .form-label {
        display: block;
        color: rgba(255, 255, 255, 0.9);
        margin-bottom: 0.5rem;
        font-weight: 500;
        font-size: 0.95rem;
        letter-spacing: 0.5px;
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
    select.form-select,
    select.form-select option {
        background-color: rgb(44, 53, 71); /* dark dropdown bg */
        color: white;              /* white option text */
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
        background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
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
        box-shadow: 0 0 20px rgba(14, 165, 233, 0.4);
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

    .form-section-title {
        font-family: 'Orbitron', sans-serif;
        font-size: 1.2rem;
        font-weight: 600;
        margin: 1.5rem 0 1rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        color: rgba(255, 255, 255, 0.9);
        grid-column: 1 / -1;
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

    /* Current image preview */
    .current-image {
        margin-top: 0.5rem;
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .current-image img {
        width: 100%;
        height: auto;
        display: block;
    }

    .image-label {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .current-image-text {
        font-size: 0.85rem;
        color: rgba(255, 255, 255, 0.6);
    }
</style>

<section class="edit-property-section">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
        <div class="geometric-shape shape-1"></div>
        <div class="geometric-shape shape-2"></div>
        <div class="geometric-shape shape-3"></div>
    </div>

    <div class="edit-container">
        <h1 class="edit-title">Edit Property</h1>
        <p class="edit-subtitle">Update your property information below</p>

        <div class="edit-form-container">
            <form action="${pageContext.request.contextPath}/property?action=update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${property.id}">

                <div class="form-grid">
                    <div class="form-section-title">Property Details</div>

                    <div class="form-group full-width">
                        <label for="address" class="form-label">Property Address</label>
                        <input type="text" id="address" name="address" value="${property.address}" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="type" class="form-label">Property Type</label>
                        <select id="type" name="type" class="form-control form-select" required>
                            <option value="Land" ${property.type == 'Land' ? 'selected' : ''}>Land</option>
                            <option value="House" ${property.type == 'House' ? 'selected' : ''}>House</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="price" class="form-label">Price (per perch)</label>
                        <input type="number" id="price" name="price" value="${property.price}" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="city" class="form-label">City</label>
                        <select id="city" name="city" class="form-control form-select" required>
                            <option value="Anuradhapura" ${property.city == 'Anuradhapura' ? 'selected' : ''}>Anuradhapura</option>
                            <option value="Colombo" ${property.city == 'Colombo' ? 'selected' : ''}>Colombo</option>
                            <option value="Galle" ${property.city == 'Galle' ? 'selected' : ''}>Galle</option>
                            <option value="Gampaha" ${property.city == 'Gampaha' ? 'selected' : ''}>Gampaha</option>
                            <option value="Hambantota" ${property.city == 'Hambantota' ? 'selected' : ''}>Hambantota</option>
                            <option value="Kalutara" ${property.city == 'Kalutara' ? 'selected' : ''}>Kalutara</option>
                            <option value="Kandy" ${property.city == 'Kandy' ? 'selected' : ''}>Kandy</option>
                            <option value="Kegalle" ${property.city == 'Kegalle' ? 'selected' : ''}>Kegalle</option>
                            <option value="Kurunegala" ${property.city == 'Kurunegala' ? 'selected' : ''}>Kurunegala</option>
                            <option value="Matale" ${property.city == 'Matale' ? 'selected' : ''}>Matale</option>
                            <option value="Matara" ${property.city == 'Matara' ? 'selected' : ''}>Matara</option>
                            <option value="Nuwara Eliya" ${property.city == 'Nuwara Eliya' ? 'selected' : ''}>Nuwara Eliya</option>
                            <option value="Ratnapura" ${property.city == 'Ratnapura' ? 'selected' : ''}>Ratnapura</option>
                        </select>
                    </div>

                    <div class="form-group full-width">
                        <label for="category" class="form-label">Property Category</label>
                        <select id="category" name="category" class="form-control form-select" required>
                            <option value="Residential" ${property.category == 'Residential' ? 'selected' : ''}>Residential</option>
                            <option value="Commercial" ${property.category == 'Commercial' ? 'selected' : ''}>Commercial</option>
                            <option value="Coconut Land" ${property.category == 'Coconut Land' ? 'selected' : ''}>Coconut Land</option>
                            <option value="Water Front Land" ${property.category == 'Water Front Land' ? 'selected' : ''}>Water Front Land</option>
                            <option value="Agricultural Land" ${property.category == 'Agricultural Land' ? 'selected' : ''}>Agricultural Land</option>
                            <option value="Paddy field facing lands" ${property.category == 'Paddy field facing lands' ? 'selected' : ''}>Paddy field facing lands</option>
                            <option value="Mountain view lands" ${property.category == 'Mountain view lands' ? 'selected' : ''}>Mountain view lands</option>
                            <option value="Up country lands" ${property.category == 'Up country lands' ? 'selected' : ''}>Up country lands</option>
                            <option value="Down south lands" ${property.category == 'Down south lands' ? 'selected' : ''}>Down south lands</option>
                            <option value="Close to sacred/ancient city lands" ${property.category == 'Close to sacred/ancient city lands' ? 'selected' : ''}>Close to sacred/ancient city lands</option>
                            <option value="Close to highways" ${property.category == 'Close to highways' ? 'selected' : ''}>Close to highways</option>
                            <option value="Close to Airport" ${property.category == 'Close to Airport' ? 'selected' : ''}>Close to Airport</option>
                            <option value="Close to railway stations" ${property.category == 'Close to railway stations' ? 'selected' : ''}>Close to railway stations</option>
                        </select>
                    </div>

                    <div class="form-group full-width">
                        <label for="image" class="form-label image-label">
                            <span>Property Image</span>
                            <span class="current-image-text">Current: ${not empty property.imagePath ? property.imagePath : 'No image'}</span>
                        </label>
                        <input type="file" id="image" name="image" class="form-control form-file">
                        <p style="font-size: 0.85rem; color: rgba(255, 255, 255, 0.6); margin-top: 0.5rem;">Leave blank to keep current image</p>

                        <c:if test="${not empty property.imagePath}">
                            <div class="current-image">
                                <img src="${pageContext.request.contextPath}${property.imagePath}" alt="Current Property Image">
                            </div>
                        </c:if>
                    </div>

                    <div class="form-section-title">Contact Information</div>

                    <div class="form-group">
                        <label for="sellerName" class="form-label">Your Name</label>
                        <input type="text" id="sellerName" name="sellerName" value="${property.sellerName}" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="sellerContact" class="form-label">Contact Number</label>
                        <input type="text" id="sellerContact" name="sellerContact" value="${property.sellerContact}" class="form-control" required>
                    </div>

                    <div class="form-group full-width">
                        <label for="sellerEmail" class="form-label">Email Address</label>
                        <input type="email" id="sellerEmail" name="sellerEmail" value="${property.sellerEmail}" class="form-control" required>
                    </div>
                </div>

                <button type="submit" class="submit-button">Update Property</button>
            </form>
        </div>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>