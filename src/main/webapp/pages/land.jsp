<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 4:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!-- Include Header -->
<%@ include file="../includes/header.jsp" %>

<!-- Hero Section -->
<section class="relative h-96 flex items-center justify-center text-center text-white">
    <!-- Background Image -->
    <div class="absolute inset-0 bg-cover bg-center" style="background-image:url('/images/placeholder.jpg');"></div>
    <!-- Overlay -->
    <div class="absolute inset-0 bg-black opacity-30"></div>
    <div class="relative z-10">
        <h1 class="text-6xl font-bold mb-4">Lands</h1>
    </div>
</section>

<!-- Breadcrumb Navigation -->
<div class="bg-gray-100 py-3 px-4">
    <div class="container mx-auto flex items-center">
        <a href="${pageContext.request.contextPath}/" class="text-gray-600 hover:text-gray-800">
            <i class="fas fa-home mr-1"></i> Home
        </a>
        <span class="mx-2">›</span>
        <span class="text-gray-800 font-medium">Lands</span>
    </div>
</div>

<!-- Featured Lands Section -->
<section class="py-12 bg-green-600">
    <div class="container mx-auto px-4">
        <div class="flex items-center mb-8">
            <div class="w-1 h-10 bg-white mr-4"></div>
            <h2 class="text-4xl font-bold text-white">Featured Lands</h2>
        </div>
        <p class="text-white mb-10 max-w-3xl">
            Choose from a wide range of lands across 18 districts, tailored to suit your needs
            and preferred location. Find the perfect plot for your lifestyle or investment today!
        </p>

        <c:choose>
            <%--@elvariable id="lands" type="data"--%>
            <c:when test="${empty lands}">
                <p class="text-white text-center">No featured lands available.</p>
            </c:when>
            <c:otherwise>
                <div class="overflow-hidden">
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        <c:forEach var="land" items="${lands}" begin="0" end="3" varStatus="loop">
                            <div class="bg-white rounded-lg overflow-hidden shadow-lg">
                                <div class="relative h-64 overflow-hidden" style="background-color: ${loop.index % 4 == 0 ? '#8e44ad' : loop.index % 4 == 1 ? '#f1c40f' : loop.index % 4 == 2 ? '#7cb342' : '#e74c3c'}">
                                    <c:choose>
                                        <c:when test="${not empty land.imagePath}">
                                            <img src="${pageContext.request.contextPath}${land.imagePath}" alt="Land Logo" class="w-full h-full object-contain p-4">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/images/land.jpg" alt="Land Logo" class="w-full h-full object-contain p-4">
                                        </c:otherwise>
                                    </c:choose>                                    <div class="absolute bottom-0 left-0 right-0 bg-white bg-opacity-90 p-3">
                                        <h3 class="text-xl font-bold">${land.address != null ? land.address : 'Property'} - ${land.city}</h3>
                                    </div>
                                </div>
                                <div class="p-4">
                                    <div class="flex items-center text-gray-600 mb-2">
                                        <i class="fas fa-map-marker-alt mr-2"></i>
                                        <span>${land.city}</span>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/property?action=view&id=${land.id}" class="block w-full text-center py-2 bg-green-600 text-white rounded hover:bg-green-700 transition duration-200">View Details</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Main Content: Lands and Filters -->
<section class="py-16 bg-gray-100">
    <div class="container mx-auto px-4">
        <div class="flex items-center mb-10">
            <div class="w-1 h-10 bg-red-600 mr-4"></div>
            <h2 class="text-4xl font-bold text-gray-800">Find Your Dream Property</h2>
        </div>

        <div class="flex flex-col lg:flex-row gap-8">
            <!-- Left: Lands -->
            <div class="lg:w-2/3">
                <c:choose>
                    <%--@elvariable id="lands" type="data"--%>
                    <c:when test="${empty lands}">
                        <p class="text-gray-600 text-center">No lands available. Add a land to get started!</p>
                    </c:when>
                    <c:otherwise>
                        <div class="space-y-8">
                                <%--@elvariable id="lands" type="java.util.List"--%>
                            <c:forEach var="land" items="${lands}">
                                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                                    <div class="flex flex-col md:flex-row">
                                        <div class="md:w-2/5 h-64 relative">
                                            <c:choose>
                                                <c:when test="${not empty land.imagePath}">
                                                    <img src="${pageContext.request.contextPath}${land.imagePath}" alt="Land Logo" class="w-full h-full object-contain p-4">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/images/land.jpg" alt="Land Logo" class="w-full h-full object-contain p-4">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="absolute bottom-0 left-0 right-0 bg-black bg-opacity-70 text-white p-2 text-center">
                                                    ${land.city}
                                            </div>
                                        </div>
                                        <div class="md:w-3/5 p-6">
                                            <h3 class="text-2xl font-bold text-gray-800 mb-2">${land.address != null ? land.address : 'Property'} - ${land.city}</h3>
                                            <div class="flex items-center text-gray-600 mb-4">
                                                <i class="fas fa-map-marker-alt mr-2"></i>
                                                <span>${land.address}</span>
                                            </div>
                                            <div class="mb-4">
                                                <div class="text-3xl font-bold text-red-600">${land.price} LKR</div>
                                                <div class="text-sm text-gray-500">PER PERCH UPWARDS</div>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/property?action=view&id=${land.id}"
                                               class="inline-flex items-center text-green-600 hover:text-green-800 font-medium">
                                                Explore Land
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-1" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                                </svg>
                                            </a>
                                            <div class="mt-4 flex space-x-2">
                                                <a href="${pageContext.request.contextPath}/property?action=edit&id=${land.id}" class="inline-block px-3 py-1 bg-blue-500 text-white rounded hover:bg-blue-600 text-sm">Edit</a>
                                                <a href="${pageContext.request.contextPath}/property?action=delete&id=${land.id}" class="inline-block px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600 text-sm" onclick="return confirm('Are you sure you want to delete this property?')">Delete</a>
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
            <div class="lg:w-1/3">
                <div class="bg-green-300 text-white p-6 rounded-lg shadow-lg">
                    <h3 class="text-2xl font-bold mb-6">Filters</h3>
                    <form action="<c:url value="/land"/>" method="post" class="search-form">
                        <!-- Districts -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium mb-2">Districts</label>
                            <div class="relative">
                                <label>
                                    <select name="city" class="w-full p-3 rounded-lg text-gray-800 appearance-none">
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
                                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-800">
                                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                        <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>



<%--                        <!-- Perch Price (Min) -->--%>
<%--                        <div class="mb-6">--%>
<%--                            <label class="block text-sm font-medium mb-2">Perch Price (Min)</label>--%>
<%--                            <div class="relative">--%>
<%--                                <label>--%>
<%--                                    <input type="number" name="minPrice" placeholder="" class="w-full p-3 rounded-lg text-gray-800 pr-12">--%>
<%--                                </label>--%>
<%--                                <div class="absolute inset-y-0 right-0 flex items-center px-3 text-gray-800 bg-gray-200 rounded-r-lg">--%>
<%--                                    <span>LKR</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <!-- Perch Price (Max) -->--%>
<%--                        <div class="mb-6">--%>
<%--                            <label class="block text-sm font-medium mb-2">Perch Price (Max)</label>--%>
<%--                            <div class="relative">--%>
<%--                                <label>--%>
<%--                                    <input type="number" name="maxPrice" placeholder="" class="w-full p-3 rounded-lg text-gray-800 pr-12">--%>
<%--                                </label>--%>
<%--                                <div class="absolute inset-y-0 right-0 flex items-center px-3 text-gray-800 bg-gray-200 rounded-r-lg">--%>
<%--                                    <span>LKR</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

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

                        <!-- Reset and Search Buttons -->
                        <div class="flex justify-between items-center">
                            <a href="<c:url value="/land"/>" class="text-white hover:underline">Reset</a>
                            <button type="submit" class="px-6 py-3 bg-white text-green-600 font-medium rounded-lg hover:bg-gray-100 transition duration-200">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Back to Top Button -->
<a href="#" class="fixed bottom-6 left-6 bg-green-800 text-white w-10 h-10 rounded-md flex items-center justify-center shadow-lg hover:bg-green-700 transition duration-200">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 15l7-7 7 7"></path>
    </svg>
</a>

<!-- Include Footer -->
<%@ include file="../includes/footer.jsp" %>



