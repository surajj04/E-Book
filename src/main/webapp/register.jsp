<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
        <%@ page import="org.ebook.model.User" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>E-Book Register</title>
                <%@include file="Components/css.jsp" %>


            </head>

            <body>
                <% User user=(User) session.getAttribute("user"); %>
                    <%if (user !=null && !user.getName().equals("admin")) { %>
                        <%@ include file="Components/userNavbar.jsp" %>
                            <% } else { %>
                                <%@ include file="Components/Navbar.jsp" %>
                                    <% } %>

                                        <div class="">
                                            <div
                                                class="relative flex items-center justify-center bg-center py-12 px-4 sm:px-6 lg:px-8 bg-no-repeat bg-cover relative items-center">
                                                <div class="absolute opacity-60 inset-0 z-0"></div>
                                                <div
                                                    class="max-w-md w-full space-y-8 p-10 bg-white border rounded-xl shadow-lg z-10">
                                                    <p class="text-red-500">${error}</p>
                                                    <div class="grid  gap-8 grid-cols-1">
                                                        <div class="flex flex-col ">
                                                            <div class="flex flex-col sm:flex-row items-center">
                                                                <h2 class="font-semibold text-lg mr-auto">Register</h2>
                                                                <c:if test="${not empty failed}">
                                                                    <p class="text-center text-red-600">${failed}</p>
                                                                    <c:remove var="failed" scope="session" />
                                                                </c:if>
                                                                <div class="w-full sm:w-auto sm:ml-auto mt-3 sm:mt-0">
                                                                </div>
                                                            </div>
                                                            <div class="mt-5">
                                                                <form action="register" method="post">
                                                                    <div class="form">
                                                                        <div class="w-full text-xs">
                                                                            <div class="mb-3 space-y-2 w-full text-xs">
                                                                                <label
                                                                                    class="font-semibold text-gray-600 py-2">Name
                                                                                    <span title="required"
                                                                                        class="text-red-500">*</span></label>
                                                                                <input placeholder="Name"
                                                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                                    required="required" type="text"
                                                                                    name="name"
                                                                                    id="integration_shop_name">
                                                                                <p class="text-red text-xs hidden">
                                                                                    Please fill
                                                                                    out this field.
                                                                                </p>
                                                                            </div>
                                                                            <div class="mb-3 space-y-2 w-full text-xs">
                                                                                <label
                                                                                    class="font-semibold text-gray-600 py-2">Mail
                                                                                    <span title="required"
                                                                                        class="text-red-500">*</span></label>
                                                                                <input placeholder="Email ID"
                                                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                                    required="required" type="email"
                                                                                    name="email"
                                                                                    id="integration_shop_name">
                                                                                <p class="text-red text-xs hidden">
                                                                                    Please fill
                                                                                    out this field.
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class=" w-full text-xs">
                                                                            <div class="w-full flex flex-col mb-3">
                                                                                <label
                                                                                    class="font-semibold text-gray-600 py-2">Phone
                                                                                    <span title="required"
                                                                                        class="text-red-500">*</span></label>
                                                                                <input placeholder="Phone Number"
                                                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                                    type="number" name="phone"
                                                                                    id="integration_street_address">
                                                                            </div>
                                                                            <div class="w-full flex flex-col mb-3">
                                                                                <label
                                                                                    class="font-semibold text-gray-600 py-2">Password<span
                                                                                        title="required"
                                                                                        class="text-red-500">*</span></label>
                                                                                <input placeholder="Password"
                                                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                                    type="password" name="password"
                                                                                    id="integration_street_address">
                                                                                <p class="text-sm text-red-500 hidden mt-3"
                                                                                    id="error">Please
                                                                                    fill out
                                                                                    this
                                                                                    field.</p>
                                                                            </div>
                                                                        </div>

                                                                        <div
                                                                            class="mt-5 text-right md:space-x-3 md:block flex flex-col-reverse">
                                                                            <button
                                                                                class="mb-2 md:mb-0 bg-indigo-700 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white rounded-full hover:shadow-lg hover:bg-indigo-600"
                                                                                type="submit">Register</button>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%@include file="Components/footer.jsp" %>
            </body>

            </html>