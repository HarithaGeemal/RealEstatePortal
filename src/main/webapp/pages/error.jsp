<%--
  Created by IntelliJ IDEA.
  User: Haritha Geemal
  Date: 4/5/2025
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/header.jsp" %>

<section class="py-16">
  <div class="container mx-auto px-4">
    <h1 class="text-4xl font-bold text-red-500 text-center mb-8">Error</h1>
    <p class="text-gray-600 text-center mb-6">${error}</p>
    <div class="text-center">
      <a href="${pageContext.request.contextPath}/home" class="inline-block px-6 py-3 bg-green-500 text-white rounded-lg hover:bg-green-600">Go to Home</a>
    </div>
  </div>
</section>

<%@ include file="../includes/footer.jsp" %>

