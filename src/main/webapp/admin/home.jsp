<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Admin Home </title>
            <%@include file="css.jsp" %>
        </head>

        <body class="bg-gray-100">
            <%@include file="Navbar.jsp" %>
                <c:if test="${empty user}">
                    <c:redirect url="../login.jsp" />
                </c:if>
                <div class="container">
                    <!-- component -->
                    <section class="bg-white  py-24 px-4 lg:px-16">
                        <div class="container mx-auto px-[12px] md:px-24 xl:px-12 max-w-[1300px] nanum2">
                            <h1 class="text-center text-5xl pb-12">Hello Admin</h1>
                            <div
                                class="grid grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 gap-x-4 gap-y-28 lg:gap-y-16 my-10">
                                <div
                                    class="relative group h-48 flex   flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
                                    <a href="addbooks.jsp" class="block">
                                        <div class="h-28">
                                            <div
                                                class="absolute -top-20 lg:top-[-10%] left-[5%] z-40 group-hover:top-[-40%] group-hover:opacity-[0.9] duration-300 w-[90%] h-48 bg-blue-500 rounded-xl flex justify-center items-center">
                                                <i class="fa-solid fa-square-plus text-8xl text-white"></i>
                                            </div>

                                        </div>
                                        <div class="p-6  z-10 w-full   ">
                                            <p
                                                class="mb-2 inline-block text-tg text-center w-full  text-xl  font-sans  font-semibold leading-snug tracking-normal   antialiased">
                                                Add Books
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div
                                    class="relative group h-48 flex   flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
                                    <a href="allbooks.jsp" class="block">
                                        <div class="h-28">
                                            <div
                                                class="absolute -top-20 lg:top-[-10%] left-[5%] z-40 group-hover:top-[-40%] group-hover:opacity-[0.9] duration-300 w-[90%] h-48 bg-red-500 rounded-xl flex justify-center items-center">
                                                <i class="fa-solid fa-book-open text-8xl text-white"></i>
                                            </div>
                                        </div>
                                        <div class="p-6   z-10 w-full   ">
                                            <p
                                                class="mb-2 inline-block text-tg text-center w-full  text-xl  font-sans  font-semibold leading-snug tracking-normal   antialiased">
                                                All Books
                                            </p>
                                        </div>
                                    </a>
                                </div>

                                <div
                                    class="relative group h-48 flex   flex-col rounded-xl bg-white bg-clip-border text-gray-700 shadow-md">
                                    <a href="../adminorders" class="block">
                                        <div class="h-28">
                                            <div
                                                class="absolute -top-20 lg:top-[-10%] left-[5%] z-40 group-hover:top-[-40%] group-hover:opacity-[0.9] duration-300 w-[90%] h-48 bg-orange-500 rounded-xl flex justify-center items-center">
                                                <i class="fa-solid fa-truck text-8xl text-white"></i>
                                            </div>
                                        </div>
                                        <div class="p-6   z-10 w-full   ">
                                            <p
                                                class="mb-2 inline-block text-tg text-center w-full  text-xl  font-sans  font-semibold leading-snug tracking-normal   antialiased">
                                                Order
                                            </p>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
                <%@include file="footer.jsp" %>
        </body>

        </html>