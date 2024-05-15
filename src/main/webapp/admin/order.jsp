<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Order</title>
        <%@include file="css.jsp" %>
    </head>

    <body class="bg-gray-100">
        <%@include file="Navbar.jsp" %>
  <c:if test="${empty user}">
            <c:redirect url="../login.jsp"/>
        </c:if>
            <div class="">


                <div class="overflow-hidden rounded-lg border border-gray-200 shadow-md m-5">
                    <table class="w-full border-collapse bg-white text-left text-sm text-gray-500">
                        <thead class="bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Order id</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Name</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Email</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Address</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Phone</th>

                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Book Name</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Author</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Price</th>
                                <th scope="col" class="px-6 py-4 font-medium text-gray-900">Payment Method</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                            <tr class="hover:bg-gray-50">
                                <th class="flex gap-3 px-6 py-4 font-normal text-gray-900">
                                    <div class="text-sm">
                                        <div class="font-medium text-gray-700">Steven Jobs</div>
                                    </div>
                                </th>
                                <td class="px-6 py-4">name</td>
                                <td class="px-6 py-4">Email</td>
                                <td class="px-6 py-4">Address</td>
                                <td class="px-6 py-4">Phone Number</td>
                                <td class="px-6 py-4">Book Name</td>
                                <td class="px-6 py-4">Author</td>
                                <td class="px-6 py-4">Price</td>
                                <td class="px-6 py-4">COD</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <%@include file="footer.jsp" %>
    </body>

    </html>