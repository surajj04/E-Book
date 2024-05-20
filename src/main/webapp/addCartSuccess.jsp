<%@ page isELIgnored="false" %>
    <%@ page import="org.ebook.model.User" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Add to Cart Success</title>
            <%@include file="Components/css.jsp" %>
        </head>

        <body class="">
            <% User user=(User) session.getAttribute("user"); %>
                <%if (user !=null && !user.getName().equals("admin")) { %>
                    <%@ include file="Components/userNavbar.jsp" %>
                        <% } else { %>
                            <%@ include file="Components/Navbar.jsp" %>
                                <% } %>
                                    <div class="bg-white p-8 rounded-lg shadow-md max-w-md mx-auto my-20">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 mx-auto text-green-500"
                                            viewBox="0 0 20 20" fill="currentColor">
                                            <path fill-rule="evenodd"
                                                d="M10 2a8 8 0 1 0 0 16 8 8 0 0 0 0-16zm3.293 5.293a1 1 0 1 1 1.414 1.414l-5 5a1 1 0 0 1-1.414 0l-3-3a1 1 0 1 1 1.414-1.414L8 10.586l4.293-4.293z"
                                                clip-rule="evenodd" />
                                        </svg>
                                        <h1 class="text-2xl font-semibold text-center text-gray-800 mb-4">Added to Cart
                                            Successfully!</h1>
                                        <p class="text-center text-gray-600">Your item has been added to the cart.</p>
                                        <div class="flex justify-center mt-6">
                                            <a href="cart"
                                                class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-6 rounded-md text-center inline-block">View
                                                Cart</a>
                                        </div>
                                    </div>
                                    <%@include file="Components/footer.jsp" %>
        </body>

        </html>