<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Successful</title>
        <%@include file="css.jsp" %>
    </head>

    <body class="">
        <%@include file="Navbar.jsp" %>
            <c:if test="${empty user}">
                <c:redirect url="../login.jsp" />
            </c:if>
            <div class="max-w-md mx-auto bg-white rounded-md p-8 shadow-md text-center my-20">
                <h1 class="text-3xl font-semibold mb-4">Update Successful</h1>
                <p class="text-gray-700 mb-4">The book details have been updated successfully.</p>
                <a href="allbooks.jsp" class="text-indigo-500 hover:text-indigo-600">
                    <i class="fas fa-arrow-left"></i> Go All Books
                </a>
            </div>

    </body>

    </html>