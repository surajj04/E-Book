<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
      <%@ page import="java.util.List" %>
        <%@ page import="org.ebook.service.BookService" %>
          <%@ page import="org.ebook.model.Book" %>
            <%@ page import="org.ebook.model.User" %>
              <%@ page import="org.ebook.model.Order" %>
                <!DOCTYPE html>
                <html>

                <head>
                  <title>User </title>

                  <%@include file="css.jsp" %>
                </head>

                <body class="bg-gray-100">
                  <c:if test="${empty user}">
                    <c:redirect url="login.jsp" />
                  </c:if>
                  <% User user=(User) session.getAttribute("user"); %>
                    <% List<Order> orders = (List<Order>) session.getAttribute("orderDetails"); %>

                        <%if (user !=null && !user.getName().equals("admin")) { %>
                          <%@ include file="Components/userNavbar.jsp" %>
                            <% } else { %>
                              <%@ include file="Components/Navbar.jsp" %>
                                <% } %>
                                  <c:if test="${empty user}">
                                    <c:redirect url="../login.jsp" />
                                  </c:if>
                                  <div>
                                    <p class="text-4xl text-center my-6">Your Orders</p>
                                    <section class="container mx-auto p-6 font-mono">
                                      <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
                                        <div class="w-full overflow-x-auto">
                                          <table class="w-full border  p-4">
                                            <thead>
                                              <tr
                                                class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                                                <th class="px-4 py-3">Order Information</th>
                                                <th class="px-4 py-3">Billing Information</th>
                                                <th class="px-4 py-3">Shipping Information</th>
                                                <th class="px-4 py-3">Payment</th>
                                                <th class="px-4 py-3">Shipping Options</th>
                                                <th class="px-4 py-3">Order Notes</th>


                                              </tr>
                                            </thead>

                                            <tbody class="bg-white">
                                              <% if (orders !=null) { %>
                                                <% for (Order o : orders) { %>
                                                  <tr class="text-gray-700">
                                                    <td class="px-4 py-3 border">
                                                      <div class="flex items-center text-sm">
                                                        <div class="relative w-8 h-8 mr-3 rounded-full md:block">
                                                          <div class="absolute inset-0 rounded-full shadow-inner"
                                                            aria-hidden="true">
                                                          </div>
                                                        </div>
                                                        <div>
                                                          <p class="font-semibold text-black">Order ID: #<%=
                                                              o.getOrderID() %>
                                                          </p>
                                                          <ul class="list-disc ml-4 my-2">
                                                            <% BookService service1=new BookService();%>
                                                              <% List<Integer> arr=o.getBooksID(); %>
                                                                <% for(int p : arr){ %>
                                                                  <%Book book=service1.getById(p);%>
                                                                    <li>
                                                                      <%=book.getBookName()%>
                                                                    </li>
                                                                    <%} %>
                                                          </ul>
                                                          <p class="text-sm text-gray-900 font-semibold">Total Price: $
                                                            <%= o.getTotalPrice() %>
                                                          </p>
                                                          <p class="text-sm text-gray-900 font-semibold my-2">Order
                                                            Status:
                                                            <%if(o.getStatus().equals("Pending")){%>
                                                            <span class="text-orange-500"><%=o.getStatus()%></span>
                                                            <%}else{%>
                                                              <span class="text-green-500"><%=o.getStatus()%></span>
                                                              <%}%>
                                                          </p>
                                                        </div>
                                                      </div>
                                                    </td>
                                                    <td class="px-4 py-3 text-ms border text-sm">
                                                      <p class="text-black my-1"><span class="font-semibold">Full
                                                          Name:</span>
                                                        <%= o.getName() %>
                                                      </p>
                                                      <p class="text-black my-1"><span class="font-semibold">Email
                                                          Address:</span>
                                                        <%= o.getEmail() %>
                                                      </p>
                                                      <p class="text-black my-1"><span class="font-semibold">Phone
                                                          Number:</span>
                                                        <%= o.getPhoneNO() %>
                                                      </p>
                                                      <p class="text-black my-1"><span class="font-semibold">Billing
                                                          Address:</span>
                                                        <%= o.getAddress() %>
                                                      </p>
                                                    </td>
                                                    <td class="px-4 py-3 text-sm border">
                                                      <p class="text-black my-1"><span class="font-semibold">Shipping
                                                          Address:</span>
                                                        <%= o.getShippingAddress() %>
                                                      </p>
                                                    </td>
                                                    <td class="px-4 py-3 text-sm border">
                                                      <p class="text-black my-1"><span class="font-semibold">Payment
                                                          Method:</span>
                                                        <%= o.getPayment() %>
                                                      </p>
                                                    </td>
                                                    <td class="px-4 py-3 text-sm border">
                                                      <p class="text-black my-1"><span class="font-semibold">Shipping
                                                          Method:</span> Standard Shipping</p>
                                                    </td>
                                                    <td class="px-4 py-3 text-sm border">
                                                      <p class="text-black my-1"><span class="font-semibold"></span> No
                                                        special notes for this order.</p>
                                                    </td>
                                                  </tr>
                                                  <% } %>
                                                    <% } else{%>
                                                      <tr>
                                                        <td colspan="6"
                                                          class="px-4 py-3 border text-center text-gray-700">
                                                          <p class="font-semibold text-black">No orders found.</p>
                                                        </td>
                                                      </tr>
                                                      <%}%>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    </section>

                                  </div>

                </body>

                </html>