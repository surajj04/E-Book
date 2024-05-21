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
                                    <title>Order</title>
                                    <%@include file="css.jsp" %>
                                </head>

                                <body class="bg-gray-100">
                                    <%@include file="Navbar.jsp" %>
                                        <c:if test="${empty user}">
                                            <c:redirect url="../login.jsp" />
                                        </c:if>
                                        <div class="">


                                            <div
                                                class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
                                                <table
                                                    class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                                                    <thead class="bg-gray-50">
                                                        <tr>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Order Details
                                                            </th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Name</th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Email</th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Address</th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Phone</th>

                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Book Name
                                                            </th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Total Price</th>
                                                            <th scope="col" class="px-6 py-4 font-medium text-gray-900">
                                                                Payment
                                                                Method</th>
                                                            <th scope="col"
                                                                class="px-6 py-4 font-medium text-gray-900">
                                                                Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="divide-y divide-gray-100 border-t border-gray-100">

                                                        <% List<Order> orders = (List<Order>)
                                                                session.getAttribute("allOrders"); %>
                                                                <% if (orders !=null) { %>
                                                                    <% for (Order o : orders) { %>
                                                                        <tr class="hover:bg-gray-50">
                                                                            <th
                                                                                class="flex gap-3 px-6 py-4 font-normal text-gray-900">
                                                                                <div class="text-sm">
                                                                                    <div
                                                                                        class="font-medium text-gray-700">
                                                                                        Order id: <span
                                                                                            class="text-gray-900 font-semibold">#
                                                                                            <%=o.getOrderID() %>
                                                                                        </span>
                                                                                    </div>
                                                                                    <div
                                                                                        class="font-medium text-gray-700">
                                                                                        Order Date: <span
                                                                                            class="font-semibold text-gray-900">
                                                                                            <%=o.getOrderDate() %>
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </th>
                                                                            <td class="px-6 py-4">
                                                                                <%= o.getName() %>
                                                                            </td>
                                                                            <td class="px-6 py-4">
                                                                                <%= o.getEmail() %>
                                                                            </td>
                                                                            <td class="px-6 py-4">
                                                                                <%= o.getAddress() %>
                                                                            </td>
                                                                            <td class="px-6 py-4">
                                                                                <%= o.getPhoneNO() %>
                                                                            </td>
                                                                            <td class="px-6 py-4">

                                                                                <% BookService service=new
                                                                                    BookService(); %>
                                                                                    <% List<Integer> arr =
                                                                                        o.getBooksID(); %>

                                                                                        <% for(int i : arr){ %>
                                                                                            <% Book
                                                                                                book=service.getById(i);
                                                                                                %>
                                                                                                <li>
                                                                                                    <%=book.getBookName()%>
                                                                                                </li>
                                                                                                <%} %>

                                                                            </td>
                                                                            <td class="px-6 py-4">$
                                                                                <%=Math.round(o.getTotalPrice())%>
                                                                            </td>
                                                                            <td class="px-6 py-4">
                                                                                <%=o.getPayment()%>
                                                                            </td>
                                                                            <td class="py-4">
                                                                                <div class="m-3 space-x-3 flex">
                                                                                    <% if(o.getStatus().equals("Pending")){
                                                                                        %>
                                                                                        <a href="../shipped?id=<%=o.getOrderID()%>"
                                                                                            class="relative group cursor-pointer mx-auto">
                                                                                            <button 
                                                                                                class="flex items-center justify-center w-8 h-8 text-center text-white transition bg-green-700 rounded-full shadow ripple hover:shadow-lg hover:bg-green-800 focus:outline-none">
                                                                                                <i
                                                                                                    class="fa-solid fa-check "></i>
                                                                                            </button>
                                                                                            <div
                                                                                                class="absolute left-1/2 transform -translate-x-1/2 -translate-y-full mb-2 hidden w-max px-2 py-1 text-xs text-white bg-black rounded shadow-md group-hover:block">
                                                                                                Approve Request
                                                                                            </div>
                                                                                        </a>
                                                                                        <%}%>
                                                                                            <% if(o.getStatus().equals("Shipped")){
                                                                                                %>
                                                                                                <a href="../shipped?id=<%=o.getOrderID()%>"
                                                                                                    class="relative group cursor-pointer mx-auto">
                                                                                                    <button 
                                                                                                        class="flex items-center justify-center w-8 h-8 text-center text-white transition bg-blue-700 rounded-full shadow ripple hover:shadow-lg hover:bg-green-800 focus:outline-none">
                                                                                                        <i
                                                                                                            class="fa-regular fa-thumbs-up"></i>
                                                                                                    </button>
                                                                                                    <div
                                                                                                        class="absolute left-1/2 transform -translate-x-1/2 -translate-y-full mb-2 hidden w-max px-2 py-1 text-xs text-white bg-black rounded shadow-md group-hover:block">
                                                                                                        Delivered
                                                                                                    </div>
                                                                                                </a>
                                                                                                <%}%>

                                                                                                <% if(o.getStatus().equals("Delivered")){
                                                                                                    %>
                                                                                                    <a href=""
                                                                                                        class="relative group cursor-pointer mx-auto">
                                                                                                        <button 
                                                                                                            class="flex items-center justify-center w-8 h-8 text-center text-gray-900 transition bg-gray-100 rounded-full shadow ripple hover:shadow-lg hover:bg-green-800 focus:outline-none">
                                                                                                            <i class="fa-solid fa-truck"></i>
                                                                                                        </button>
                                                                                                        <div
                                                                                                            class="absolute left-1/2 transform -translate-x-1/2 -translate-y-full mb-2 hidden w-max px-2 py-1 text-xs text-white bg-black rounded shadow-md group-hover:block">
                                                                                                            Delivered
                                                                                                        </div>
                                                                                                    </a>
                                                                                                    <%}%>

                                                                                                    <div class="relative group cursor-pointer <%= (o.getStatus().equals("Shipped") || o.getStatus().equals("Delivered")) ? "hidden" : "" %>">
                                                                                                                <button
                                                                                                                    class="inline-block w-8 h-8 text-center text-white transition bg-red-700 rounded-full shadow ripple hover:shadow-lg hover:bg-red-800 focus:outline-none">
                                                                                                                    <i
                                                                                                                        class="fa-solid fa-trash-can "></i>
                                                                                                                </button>
                                                                                                                <div
                                                                                                                    class="absolute left-1/2 transform -translate-x-1/2 -translate-y-full mb-2 hidden w-max px-2 py-1 text-xs text-white bg-black rounded shadow-md group-hover:block ">
                                                                                                                    Reject
                                                                                                                    Request
                                                                                                                </div>
                                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <% } %>
                                                                            <% } else{%>
                                                                                <tr>
                                                                                    <td colspan="6"
                                                                                        class="px-4 py-3 border text-center text-gray-700">
                                                                                        <p
                                                                                            class="font-semibold text-black">
                                                                                            No orders found.
                                                                                        </p>
                                                                                    </td>
                                                                                </tr>
                                                                                <%}%>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <%@include file="footer.jsp" %>
                                </body>

                                </html>