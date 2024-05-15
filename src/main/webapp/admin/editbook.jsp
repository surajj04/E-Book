<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="org.ebook.service.BookService" %>
        <%@ page import="org.ebook.model.Book" %>

            <!DOCTYPE html>
            <html>

            <head>
                <title>Add Books </title>
                <%@include file="css.jsp" %>
            </head>

            <body class="bg-gray-100">
                <%@include file="Navbar.jsp" %>
  <c:if test="${empty user}">
            <c:redirect url="../login.jsp"/>
        </c:if>
                    <div class="w-1/3 mx-auto my-10 border bg-white p-8 ">

                        <% int id=Integer.parseInt(request.getParameter("id")); BookService service=new BookService();
                            Book book=service.getById(id); %>

                            <form action="../editbook" method="post">
                                <input type="hidden" name="id" value="<%=book.getBookId()%>">
                                <h1 class="text-3xl my-6">Edit Book</h1>
                                <div class="form">
                                    <div class="w-full text-xs">
                                        <div class="mb-3 space-y-2 w-full text-xs">
                                            <label class="font-semibold text-gray-600 py-2">Book Name <span
                                                    title="required" class="text-red-500">*</span></label>
                                            <input placeholder="Name"
                                                class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                required="required" type="text" name="bookname"
                                                id="integration_shop_name"
                                                value="<%=(book!=null) ? book.getBookName() : "" %>">

                                            <p class="text-red text-xs hidden">Please fill out this field.</p>
                                        </div>
                                        <div class="mb-3 space-y-2 w-full text-xs">
                                            <label class="font-semibold text-gray-600 py-2">Author Name <span
                                                    title="required" class="text-red-500">*</span></label>
                                            <input placeholder="Author Name"
                                                class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                required="required" type="text" name="authorname"
                                                id="integration_shop_name"
                                                value="<%=(book!=null) ? book.getAuthor() : "" %>">
                                            <p class="text-red text-xs hidden">Please fill out this field.</p>
                                        </div>
                                    </div>
                                    <div class=" w-full text-xs">
                                        <div class="w-full flex flex-col mb-3">
                                            <label class="font-semibold text-gray-600 py-2">Price <span title="required"
                                                    class="text-red-500">*</span></label>
                                            <input placeholder="price"
                                                class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                type="number" name="price"
                                                value="<%=(book!=null) ? book.getPrice() : "" %>">
                                        </div>
                                        <div class="w-full flex flex-col mb-3">
                                            <label class="font-semibold text-gray-600 py-2">Book Categories <span
                                                    class="text-red-600" title="required">*</span></label>
                                            <select
                                                class="block w-full bg-grey-100 text-grey-darker border border-grey-lighter rounded-lg h-10 px-4 md:w-full"
                                                required="required" name="category" id="integration_city_id">
                                                <option value="<%=book.getBookCategory()%>">Selected Category</option>
                                                <option value="Old Book">Old Book</option>
                                                <option value="New Book">New Book</option>
                                            </select>

                                            <p class="text-sm text-red-500 hidden mt-3" id="error">Please fill out this
                                                field.</p>
                                        </div>


                                        <div class="w-full flex flex-col mb-3">
                                            <label class="font-semibold text-gray-600 py-2">Book Status <span
                                                    class="text-red-600" title="required">*</span></label>
                                            <select
                                                class="block w-full bg-grey-100 text-grey-darker border border-grey-lighter rounded-lg h-10 px-4 md:w-full "
                                                required="required" name="status" id="integration_city_id">
                                                <option value="<%=book.getStatus()%>">Seleted Status</option>
                                                <option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                            </select>
                                            <p class="text-sm text-red-500 hidden mt-3" id="error">Please fill out this
                                                field.</p>
                                        </div>
                                        <div class="w-full flex flex-col mb-3">
                                            <label class="font-semibold text-gray-600 py-2">Email<span title="required"
                                                    class="text-red-500">*</span></label>
                                            <input placeholder="Email"
                                                class="appearance-none block w-full py-2 bg-light text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                type="email" name="email"
                                                value="<%=book.getEmail()%>">
                                            <p class="text-sm text-red-500 hidden mt-3" id="error"></p>
                                        </div>
                                        <div class="w-full flex flex-col mb-3">
                                            <label class="font-semibold text-gray-600 py-2">Image URL<span
                                                    title="required" class="text-red-500">*</span></label>
                                            <input placeholder="Image URL"
                                                class="appearance-none block w-full py-2 bg-light text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                type="text" accept="image/*" name="imageURL" id="image_upload"
                                                value="<%=book.getPhoto()%>">
                                            <p class="text-sm text-red-500 hidden mt-3" id="error">Please select an
                                                image.</p>
                                        </div>
                                    </div>

                                    <div class="mt-5 text-right md:space-x-3 md:block flex flex-col-reverse">
                                        <button
                                            class="mb-2 md:mb-0 bg-indigo-700 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white rounded-full hover:shadow-lg hover:bg-indigo-600"
                                            type="submit">Update Book</button>
                                    </div>
                                </div>
                            </form>
                    </div>
                    <%@include file="footer.jsp" %>
            </body>

            </html>