<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page import="org.ebook.model.User" %>
            <!DOCTYPE html>
            <html>

            <head>
                <%@include file="Components/css.jsp" %>
            </head>

            <body class="bg-gray-100">
                <c:if test="${empty user}">
                    <c:redirect url="login.jsp" />
                </c:if>
                <% User user=(User) session.getAttribute("user"); %>
                    <%if (user !=null && !user.getName().equals("admin")) { %>
                        <%@ include file="Components/userNavbar.jsp" %>
                            <% } else { %>
                                <%@ include file="Components/Navbar.jsp" %>
                                    <% } %>
                                        <div class="container mx-auto px-14 py-8 ">
                                            <div class="w-3/4 mx-auto bg-white rounded-lg shadow-md overflow-hidden">
                                                <div class="text-center py-4">
                                                    <i class="fas fa-exclamation-triangle text-red-500 text-6xl"></i>
                                                </div>
                                                <div class="text-center py-4">
                                                    <h1 class="text-2xl font-bold text-gray-800">Oops! Something went
                                                        wrong. Please try again later.
                                                    </h1>
                                                </div>
                                                <div class="flex justify-center py-4">
                                                    <a href="index.jsp" class="text-blue-500 hover:underline">Go to Home
                                                        Page</a>
                                                </div>
                                            </div>
                                        </div>
                                        <%@include file="Components/footer.jsp" %>
            </body>

            </html>