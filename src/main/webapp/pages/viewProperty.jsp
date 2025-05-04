<%--@elvariable id="property" type="com.realestate.model.Property"--%>
<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<section class="py-16">
    <div class="container mx-auto px-4">
        <h1 class="text-4xl font-bold text-gray-800 text-center mb-8">Property Details</h1>
        <div class="max-w-2xl mx-auto bg-white shadow-lg rounded-lg p-6">
            <c:choose>
                <c:when test="${not empty property.imagePath}">
                    <img src="${pageContext.request.contextPath}${property.imagePath}" alt="Property Image" class="w-full h-64 object-cover mb-4">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/placeholder.jpg" alt="Property Image" class="w-full h-64 object-cover mb-4">
                </c:otherwise>
            </c:choose>
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">${property.address}</h2>
            <p class="text-gray-600 mb-2"><strong>Type:</strong> ${property.type}</p>
            <p class="text-gray-600 mb-2"><strong>Category:</strong> ${property.category}</p>
            <p class="text-gray-600 mb-2"><strong>City:</strong> ${property.city}</p>
            <p class="text-gray-600 mb-2"><strong>Price:</strong> LKR ${property.price}</p>
            <p class="text-gray-600 mb-2"><strong>Seller:</strong> ${property.sellerName}</p>
            <p class="text-gray-600 mb-2"><strong>Contact:</strong> ${property.sellerContact}</p>
            <p class="text-gray-600 mb-6"><strong>Email:</strong> ${property.sellerEmail}</p>
            <div class="flex space-x-4">
                <a href="${pageContext.request.contextPath}/property?action=edit&id=${property.id}" class="inline-block px-6 py-3 bg-blue-500 text-white rounded-lg hover:bg-blue-600">Edit</a>
                <a href="${pageContext.request.contextPath}/property?action=delete&id=${property.id}" class="inline-block px-6 py-3 bg-red-500 text-white rounded-lg hover:bg-red-600" onclick="return confirm('Are you sure you want to delete this property?')">Delete</a>
                <a href="${pageContext.request.contextPath}/home" class="inline-block px-6 py-3 bg-gray-500 text-white rounded-lg hover:bg-gray-600">Back to Home</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>

