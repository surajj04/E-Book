<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Added Successfully</title>
        <%@include file="css.jsp" %>
    </head>

    <body>
        <%@include file="Navbar.jsp" %>
            <c:if test="${empty user}">
                <c:redirect url="../login.jsp" />
            </c:if>
            <div class="max-w-lg bg-white p-8 rounded shadow-md mx-auto my-20">
                <h2 class="text-2xl font-bold mb-4 text-center">Book Added Successfully</h2>
                <p class="text-gray-700 text-lg mb-8 text-center">Your book has been added to the database.</p>
                <div class="flex justify-center">
                    <a href="home.jsp"
                        class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded transition duration-300 flex items-center">
                        <i class="fas fa-home mr-2"></i> Back to Home
                    </a>
                </div>
            </div>
    </body>

    </html>