<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
        <%@ page import="org.ebook.service.BookService" %>
            <%@ page import="org.ebook.model.Book" %>

                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Recent Books</title>
                    <%@include file="Components/css.jsp" %>
                </head>

                <body>
                    <%@include file="Components/Navbar.jsp" %>
                    <div class="my-20">
                        <h2 class="text-center text-4xl">Old Books</h2>
                        <div class="flex justify-center items-center">
          
                          <div class="md:px-4 md:grid md:grid-cols-3 lg:grid-cols-5 gap-5 space-y-4 md:space-y-0 my-20">
                            <% BookService service3=new BookService(); List<Book> oldbooks = service3.getAllOldBook();
          
                              for(Book b : oldbooks) {
                              %>
                              <div
                                class="max-w-sm bg-white px-6 pt-6 pb-2 rounded-xl shadow-lg transform hover:scale-105 transition duration-500 border">
                                <div class="relative">
                                  <img class="w-40 h-40 rounded-xl" src="<%=b.getPhoto()%>" alt="Colors" />
                                </div>
                                <h1 class="mt-4 text-gray-800 text-lg font-bold cursor-pointer">
                                  <%= b.getBookName() %>
                                </h1>
                                <div class="my-4">
                                  <div class="flex space-x-1 items-center">
                                    <span>
                                      <i class="fa-solid fa-at text-indigo-600"></i>
                                    </span>
                                    <p>
                                      <%= b.getAuthor() %>
                                    </p>
                                  </div>
                                  <div class="flex space-x-1 items-center">
                                    <span>
                                      <i class="fa-solid fa-list text-indigo-600"></i>
                                    </span>
                                    <p>
                                      Old Books
                                    </p>
                                  </div>
                                  <div class="flex my-2">
                                    <button
                                      class="flex px-2 py-2 bg-red-600 mr-1 text-white font-semibold rounded text-xs my-auto items-center">
                                      <i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i>
                                      <span class="ml-1 self-center">Add Cart</span>
                                    </button>
                                    <button
                                      class="flex px-2 py-2 bg-green-600 mr-1 text-white font-semibold rounded text-xs my-auto items-center">
                                      <i class="fa-solid fa-circle-info" style="color: #ffffff;"></i>
                                      <span class="ml-1 self-center">Detail</span>
                                    </button>
                                    <button
                                      class="flex px-2 py-2 bg-red-600 mr-1 text-white font-semibold rounded text-xs my-auto items-center">
                                      <i class="fa-solid fa-dollar-sign" style="color: #ffffff;"></i>
                                      <span class="ml-1 self-center">
                                        <%= b.getPrice() %>
                                      </span>
                                    </button>
                                  </div>
                                </div>
                              </div>
                              <% } %>
          
                          </div>
                        </div>
                      </div>
                      <%@include file="Components/footer.jsp" %>

                </body>

                </html>