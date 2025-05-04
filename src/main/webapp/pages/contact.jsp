<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Rajdhani:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-glow: #0ea5e9;
      --secondary-glow: #6366f1;
      --accent-color: #10b981;
      --dark-bg: rgba(15, 23, 42, 0.8);
      --border-glow: rgba(14, 165, 233, 0.3);
    }

    body {
      font-family: 'Rajdhani', sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0; /* Removed padding */
      background-color: #0f172a;
      color: rgba(255, 255, 255, 0.9);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Main content wrapper - takes up all available space */
    .main-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: flex-start; /* Align content to the top */
      padding: 20px;
    }

    .container {
      max-width: 800px;
      margin: 0 auto; /* Center horizontally but no top margin */
      background: rgba(15, 23, 42, 0.8);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 30px rgba(14, 165, 233, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.1);
      position: relative;
      overflow: hidden;
    }

    .container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 1px;
      background: linear-gradient(90deg, transparent, var(--primary-glow), var(--secondary-glow), var(--primary-glow), transparent);
      z-index: 1;
    }

    h1 {
      text-align: center;
      color: #fff;
      margin-bottom: 20px;
      font-family: 'Orbitron', sans-serif;
      letter-spacing: 2px;
      font-weight: 700;
      background: linear-gradient(to right, var(--primary-glow), var(--secondary-glow));
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      text-shadow: 0 0 10px rgba(14, 165, 233, 0.3);
    }

    .description {
      text-align: center;
      color: rgba(255, 255, 255, 0.7);
      margin-bottom: 30px;
      font-weight: 300;
      letter-spacing: 0.5px;
    }

    .form-group {
      margin-bottom: 20px;
      position: relative;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: rgba(255, 255, 255, 0.9);
      letter-spacing: 0.5px;
    }

    input, textarea {
      width: 100%;
      padding: 12px 15px;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 8px;
      font-size: 16px;
      box-sizing: border-box;
      color: #fff;
      font-family: 'Rajdhani', sans-serif;
      transition: all 0.3s ease;
    }

    input:focus, textarea:focus {
      outline: none;
      border-color: var(--primary-glow);
      box-shadow: 0 0 15px rgba(14, 165, 233, 0.2);
    }

    textarea {
      min-height: 120px;
      resize: vertical;
    }

    .error {
      color: #f87171;
      font-size: 14px;
      margin-top: 5px;
      font-weight: 500;
    }

    .form-row {
      display: flex;
      gap: 20px;
    }

    .form-row .form-group {
      flex: 1;
    }

    button {
      background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
      color: white;
      border: none;
      padding: 14px 20px;
      font-size: 16px;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      transition: all 0.3s ease;
      font-family: 'Rajdhani', sans-serif;
      font-weight: 600;
      letter-spacing: 1px;
      position: relative;
      overflow: hidden;
      text-transform: uppercase;
    }

    button:hover {
      box-shadow: 0 0 20px rgba(14, 165, 233, 0.4);
      transform: translateY(-2px);
    }

    button::after {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: linear-gradient(
              rgba(255, 255, 255, 0.2),
              rgba(255, 255, 255, 0)
      );
      transform: rotate(30deg);
      transition: transform 0.5s ease;
      opacity: 0;
    }

    button:hover::after {
      transform: rotate(30deg) translate(10%, 10%);
      opacity: 1;
    }

    .contact-info {
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid rgba(255, 255, 255, 0.1);
      color: rgba(255, 255, 255, 0.7);
      font-size: 15px;
    }

    .contact-info p {
      margin: 8px 0;
    }

    .contact-info strong {
      color: rgba(255, 255, 255, 0.9);
      font-weight: 600;
    }

    .success-message {
      background: rgba(16, 185, 129, 0.2);
      color: #10b981;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
      border: 1px solid rgba(16, 185, 129, 0.3);
      text-align: center;
      font-weight: 500;
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
    }

    .geometric-shape {
      position: absolute;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .shape-1 {
      width: 150px;
      height: 150px;
      top: -50px;
      right: -50px;
      border-color: var(--primary-glow);
      border-radius: 50%;
    }

    .shape-2 {
      width: 100px;
      height: 100px;
      bottom: 50px;
      left: -30px;
      border-color: var(--secondary-glow);
      transform: rotate(45deg);
    }

    .shape-3 {
      width: 70px;
      height: 70px;
      bottom: -20px;
      right: 30%;
      border-color: var(--accent-color);
      border-radius: 10px;
      transform: rotate(30deg);
    }

    /* Input focus effect */
    .input-focus-effect {
      position: absolute;
      bottom: 0;
      left: 50%;
      width: 0;
      height: 2px;
      background: linear-gradient(90deg, var(--primary-glow), var(--secondary-glow));
      transition: all 0.3s ease;
      transform: translateX(-50%);
    }

    input:focus + .input-focus-effect,
    textarea:focus + .input-focus-effect {
      width: calc(100% - 30px);
    }

    /* Header styles - just for reference, your actual header is separate */
    .header {
      background: rgba(15, 23, 42, 0.8);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      padding: 1rem 2rem;
      position: sticky;
      top: 0;
      z-index: 100;
    }

    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 0;
      }

      .container {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
<!-- Main content wrapper to control spacing -->
<div class="main-content">
  <div class="container">
    <!-- Geometric background elements -->
    <div class="geometric-bg">
      <div class="geometric-shape shape-1"></div>
      <div class="geometric-shape shape-2"></div>
      <div class="geometric-shape shape-3"></div>
    </div>

    <h1>Contact Us</h1>
    <p class="description">Have a question or feedback? We'd love to hear from you. Fill out the form below and we'll get back to you as soon as possible.</p>

    <%-- Display success message if form was submitted successfully --%>
    <%
      String message = request.getParameter("message");
      if (message != null && message.equals("success")) {
    %>
    <div class="success-message">
      Your message has been sent successfully. We'll get back to you soon!
    </div>
    <% } %>

    <form action="processContact.jsp" method="post" onsubmit="return validateForm()">
      <div class="form-row">
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" id="name" name="name" placeholder="Your name">
          <div class="input-focus-effect"></div>
          <div id="nameError" class="error"></div>
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="your.email@example.com">
          <div class="input-focus-effect"></div>
          <div id="emailError" class="error"></div>
        </div>
      </div>

      <div class="form-group">
        <label for="subject">Subject</label>
        <input type="text" id="subject" name="subject" placeholder="What is this regarding?">
        <div class="input-focus-effect"></div>
        <div id="subjectError" class="error"></div>
      </div>

      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" placeholder="Please provide details about your inquiry..."></textarea>
        <div class="input-focus-effect"></div>
        <div id="messageError" class="error"></div>
      </div>

      <button type="submit">Send Message</button>
    </form>

    <div class="contact-info">
      <p><strong>Other ways to reach us:</strong></p>
      <p>Email: support@example.com</p>
      <p>Phone: +1 (555) 123-4567</p>
      <p>Address: 123 Business Ave, Suite 100, City, State 12345</p>
    </div>
  </div>
</div>

<script>
  function validateForm() {
    let isValid = true;
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const subject = document.getElementById('subject').value.trim();
    const message = document.getElementById('message').value.trim();

    // Reset error messages
    document.getElementById('nameError').innerHTML = '';
    document.getElementById('emailError').innerHTML = '';
    document.getElementById('subjectError').innerHTML = '';
    document.getElementById('messageError').innerHTML = '';

    // Validate name
    if (name === '') {
      document.getElementById('nameError').innerHTML = 'Name is required';
      isValid = false;
    } else if (name.length < 2) {
      document.getElementById('nameError').innerHTML = 'Name must be at least 2 characters';
      isValid = false;
    }

    // Validate email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === '') {
      document.getElementById('emailError').innerHTML = 'Email is required';
      isValid = false;
    } else if (!emailRegex.test(email)) {
      document.getElementById('emailError').innerHTML = 'Please enter a valid email address';
      isValid = false;
    }

    // Validate subject
    if (subject === '') {
      document.getElementById('subjectError').innerHTML = 'Subject is required';
      isValid = false;
    } else if (subject.length < 5) {
      document.getElementById('subjectError').innerHTML = 'Subject must be at least 5 characters';
      isValid = false;
    }

    // Validate message
    if (message === '') {
      document.getElementById('messageError').innerHTML = 'Message is required';
      isValid = false;
    } else if (message.length < 10) {
      document.getElementById('messageError').innerHTML = 'Message must be at least 10 characters';
      isValid = false;
    }

    return isValid;
  }
</script>
</body>
</html>

