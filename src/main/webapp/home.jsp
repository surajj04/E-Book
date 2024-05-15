<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page isELIgnored="false"%>

    <!DOCTYPE html>
    <html>

    <head>
        <title>User </title>

        <%@include file="Components/css.jsp" %>
    </head>

    <body class="bg-gray-100">
        <%@include file="Components/Navbar.jsp" %>
            <p>User:Home</p>

            <c:if test="${not empty user}">
            <p>Name : ${user.name}</p>
            </c:if>



    </body>

    </html>