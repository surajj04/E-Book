<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ page import="java.util.List" %>
    <%@ page import="org.ebook.service.BookService" %>
      <%@ page import="org.ebook.model.Book" %>
        <!DOCTYPE html>
        <html>

        <head>
          <title>E-Book Platform</title>
          <%@include file="Components/css.jsp" %>

        </head>

        <body>
          <%@include file="Components/Navbar.jsp" %>

            <div class="bg-cover bg-center h-64 md:h-96 flex items-center"
              style="background-image: url('images/bg-image.jpg');">
              <div class="flex-1"></div>
              <div class="text-blue-900 mx-3">
                <p class="text-3xl md:text-4xl">E-Book Platform</p>
                <p>Explore boundless knowledge. Dive into our e-book platform today!</p>
              </div>
            </div>

            <!-- Recent Books section -->
            <div class="my-20">
              <div>
                <h2 class="text-center mt-10 text-4xl">Recent Books</h2>
              </div>
              <div class=" flex justify-center items-center">
                <div class="md:px-4 md:grid md:grid-cols-3 lg:grid-cols-5 gap-5 space-y-4 md:space-y-0 my-20">

                  <% BookService service1=new BookService(); List<Book> recentbooks = service1.getRecentBook();

                    for(Book b : recentbooks) {
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
                           Recent Books
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
              <div class="text-center mt-10">
                <a href="recentbooks.jsp"
                  class="text-indigo-500 bg-transparent border border-solid border-indigo-500 hover:bg-indigo-500 hover:text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150 inline-block">
                  View More
              </a>
              </div>
            </div>











            <!-- New Books Section -->
            <div class="my-20">
              <h2 class="text-center text-4xl">New Books</h2>
              <div class="flex justify-center items-center">

                <div class="md:px-4 md:grid md:grid-cols-3 lg:grid-cols-5 gap-5 space-y-4 md:space-y-0 my-20">


                  <% BookService service2=new BookService(); List<Book> newbooks = service2.getNewBook();

                    for(Book b : newbooks) {
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
                            <%= b.getBookCategory() %>
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
              <div class="text-center mt-10">
                <a href="newbooks.jsp"
                  class="text-indigo-500 bg-transparent border border-solid border-indigo-500 hover:bg-indigo-500 hover:text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150 inline-block">
                  View More
              </a>
              </div>
            </div>


            <!-- Old Books Section -->
            <div class="">
              <h2 class="text-center text-4xl">Old Books</h2>
              <div class="flex justify-center items-center">

                <div class="md:px-4 md:grid md:grid-cols-3 lg:grid-cols-5 gap-5 space-y-4 md:space-y-0 my-20">
                  <% BookService service3=new BookService(); List<Book> oldbooks = service3.getOldBook();

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
              <div class="text-center mt-10">
                <a href="oldbooks.jsp"
                  class="text-indigo-500 bg-transparent border border-solid border-indigo-500 hover:bg-indigo-500 hover:text-white active:bg-indigo-600 font-bold uppercase text-sm px-6 py-3 rounded outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150 inline-block">
                  View More
              </a>
              </div>
            </div>


            <!-- footer -->
            <%@include file="Components/footer.jsp" %>
        </body>

        </html>