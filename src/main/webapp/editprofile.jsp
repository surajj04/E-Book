<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="org.ebook.service.BookService" %>
        <%@ page import="org.ebook.model.Book" %>
            <%@ page import="org.ebook.model.User" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>Profile Edit </title>
                    <%@include file="css.jsp" %>
                </head>

                <body class="bg-gray-100">
                    <c:if test="${empty user}">
                        <c:redirect url="login.jsp" />
                    </c:if>
                    <% User user=(User) session.getAttribute("user"); %>
                        <% String addressMSG=(String) session.getAttribute("addMsg"); %>

                            <%if (user !=null && !user.getName().equals("admin")) { %>
                                <%@ include file="Components/userNavbar.jsp" %>
                                    <% } else { %>
                                        <%@ include file="Components/Navbar.jsp" %>
                                            <% } %>
                                                <c:if test="${empty user}">
                                                    <c:redirect url="../login.jsp" />
                                                </c:if>
                                                <div class="w-1/3 mx-auto my-10 border bg-white p-8 ">


                                                    <form action="updateuser" method="post">
                                                        <input type="hidden" name="id" value="<%=user.getId()%>">
                                                        <h1 class="text-3xl my-6">Edit Profile</h1>
                                                        <div class="form">
                                                            <div class="w-full text-xs">
                                                                <div class="mb-3 space-y-2 w-full text-xs">
                                                                    <label class="font-semibold text-gray-600 py-2">Full
                                                                        Name <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="Full name"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        required="required" type="text" name="name"
                                                                        id="integration_shop_name"
                                                                        value="<%=user.getName()%>">

                                                                    <p class="text-red text-xs hidden">
                                                                        Please fill out this field.
                                                                    </p>
                                                                </div>

                                                                <div class="w-full flex flex-col mb-3">
                                                                    <label
                                                                        class="font-semibold text-gray-600 py-2">Mobile No
                                                                        <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="Mobile No"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        type="text" name="phone"
                                                                        value="<%= user.getPhone() != null ? user.getPhone() : "" %>">


                                                                </div>
                                                            </div>
                                                            <div class=" w-full text-xs">
                                                                <div class="w-full flex flex-col mb-3">
                                                                    <label
                                                                        class="font-semibold text-gray-600 py-2">Email
                                                                        <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="Email"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        type="email" name="email"
                                                                        value="<%=user.getEmail()%>">
                                                                </div>

                                                                <div class="w-full flex flex-col mb-3">
                                                                    <label
                                                                        class="font-semibold text-gray-600 py-2">Address
                                                                        <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="Address"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        type="text" name="address"
                                                                        value="<%= user.getAddress() != null ? user.getAddress() : "" %>">


                                                                </div>

                                                                <div class="w-full flex flex-col mb-3">
                                                                    <label
                                                                        class="font-semibold text-gray-600 py-2">State
                                                                        <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="State"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        type="text" name="state"
                                                                        value="<%= user.getState() != null ? user.getState() : "" %>">
                                                                </div>
                                                                <div class="w-full flex flex-col mb-3">
                                                                    <label class="font-semibold text-gray-600 py-2">City
                                                                        <span title="required"
                                                                            class="text-red-500">*</span></label>
                                                                    <input placeholder="city"
                                                                        class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                                        type="text" name="city"
                                                                        value="<%= user.getCity() != null ? user.getCity() : "" %>">
                                                                </div>
                                                            </div>

                                                            <div
                                                                class="mt-5 text-right md:space-x-3 md:block flex flex-col-reverse">
                                                                <button
                                                                    class="mb-2 md:mb-0 bg-indigo-700 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white rounded-full hover:shadow-lg hover:bg-indigo-600"
                                                                    type="submit">Update Profile</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>
                                                <%@include file="footer.jsp" %>
                </body>

                </html>