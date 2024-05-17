<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
      <%@ page import="org.ebook.model.User" %>
        <!DOCTYPE html>
        <html>

        <head>
          <title>Profile </title>

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
                        <p class="text-center text-red-600 text-2xl my-6">
                          <% if (addressMSG !=null && !addressMSG.isEmpty()) { %>
                            <%= addressMSG %>
                              <% } %>
                        </p>

                        <div class="h-full bg-white p-8">
                          <div class="my-4 flex  space-y-4 2xl:space-y-0 2xl:space-x-4">
                            <div class="w-full flex flex-col">
                              <div class="flex-1 bg-white border rounded-lg shadow-xl p-8">
                                <h4 class="text-xl text-gray-900 font-bold">Personal Info</h4>
                                <ul class="mt-2 text-gray-700">
                                  <li class="flex border-y py-2">
                                    <span class="font-bold w-24">Full name:</span>
                                    <span class="text-gray-700"><%=user.getName()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <span class="font-bold w-24">Mobile:</span>
                                    <span class="text-gray-700"><%=user.getPhone()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <span class="font-bold w-24">Email:</span>
                                    <span class="text-gray-700"><%=user.getEmail()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <span class="font-bold w-24">Address:</span>
                                    <span class="text-gray-700"><%=user.getAddress()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <span class="font-bold w-24">City:</span>
                                    <span class="text-gray-700"><%=user.getCity()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <span class="font-bold w-24">State</span>
                                    <span class="text-gray-700"><%=user.getState()%></span>
                                  </li>
                                  <li class="flex border-b py-2">
                                    <button onclick="openModal2()"
                                      class="flex items-center justify-center px-3 py-2 mr-1 text-gray-600 font-semibold rounded">
                                      <i class="fa-solid fa-pen-to-square"></i>
                                      <a class="ml-1" href="editprofile.jsp">Edit Info</a>
                                    </button>
                                    <button onclick="openModal()"
                                      class="flex items-center justify-center px-3 py-2 mr-1 text-red-600 font-semibold rounded">
                                      <i class="fa-solid fa-right-to-bracket"></i>
                                      <a class="ml-1" href="#">logout</a>
                                    </button>
                              </div>
                              </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        </div>


                        <%@include file="footer.jsp" %>




        </body>

        </html>