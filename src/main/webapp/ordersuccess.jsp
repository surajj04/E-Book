<%@ page import="org.ebook.model.User" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ebook Order Successful</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>

    <body class="bg-gray-100 min-h-screen flex justify-center items-center">
        <%if (user !=null && !user.getName().equals("admin")) { %>
            <%@ include file="Components/userNavbar.jsp" %>
                <% } else { %>
                    <%@ include file="Components/Navbar.jsp" %>
                        <% } %>
                            <div class="bg-white rounded-lg p-8 shadow-md w-full sm:max-w-md">
                                <h1 class="text-3xl font-bold text-center mb-6">Order Placed Successfully</h1>
                                <p class="text-gray-700 text-center mb-6">Thank you for your order. Your ebook purchase
                                    has
                                    been completed successfully.</p>
                                <div class="flex justify-center">
                                    <a href="order"
                                        class="bg-green-500 hover:bg-green-600 text-white px-6 py-3 rounded-md text-sm font-bold mx-2">Go
                                        to orders</a>
                                    <a href="index.jsp"
                                        class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-md text-sm font-bold mx-2">Back
                                        to Homepage</a>
                                </div>
                            </div>
    </body>

    </html>