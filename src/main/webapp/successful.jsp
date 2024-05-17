<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="org.ebook.model.User" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Registration Successful</title>
            <%@include file="Components/css.jsp" %>
        </head>

        <body class="bg-gray-100">
            <c:if test="${empty user}">
                <c:redirect url="../login.jsp" />
            </c:if>
            <% User user=(User) session.getAttribute("user"); %>
                <%if (user !=null && !user.getName().equals("admin")) { %>
                    <%@ include file="Components/userNavbar.jsp" %>
                        <% } else { %>
                            <%@ include file="Components/Navbar.jsp" %>
                                <% } %>
                                    <div class="container mx-auto px-4 py-8">
                                        <div class="max-w-md mx-auto bg-white rounded-lg shadow-md overflow-hidden">
                                            <div class="text-center py-4">
                                                <i class="fas fa-check-circle text-green-500 text-6xl"></i>
                                            </div>
                                            <div class="text-center py-4">
                                                <h1 class="text-2xl font-bold text-gray-800">Registration Successful!
                                                </h1>
                                                <p class="text-gray-600 my-2">Your registration has been successful.
                                                    Thank
                                                    you!
                                                </p>
                                                <a class="text-blue-700 underline" href="login.jsp"> Go to Login Page <i
                                                        class="fa-solid fa-arrow-right"></i></a>
                                            </div>
                                        </div>
                                    </div>
        </body>

        </html>