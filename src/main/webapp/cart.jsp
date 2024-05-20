<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="org.ebook.service.BookService" %>
    <%@ page import="org.ebook.model.Book" %>
      <%@ page import="org.ebook.model.User" %>
        <%@ page import="java.util.List" %>
          <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html>

            <head>
              <title>Cart Books</title>
              <%@ include file="css.jsp" %>
            </head>
            <style>
              @layer utilities {

                input[type="number"]::-webkit-inner-spin-button,
                input[type="number"]::-webkit-outer-spin-button {
                  -webkit-appearance: none;
                  margin: 0;
                }
              }

              

            </style>

            <body class="bg-gray-100">


              <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate" ); // HTTP 1.1
                response.setHeader("Pragma", "no-cache" ); // HTTP 1.0 response.setDateHeader("Expires", 0); // Proxies
                User user=(User) session.getAttribute("user"); %>

                <% if (user !=null && !user.getName().equals("admin")) { %>
                  <%@ include file="Components/userNavbar.jsp" %>
                    <% } else { %>
                      <%@ include file="Components/Navbar.jsp" %>
                        <% } %>

                          <c:if test="${empty user}">
                            <c:redirect url="login.jsp" />
                          </c:if>

                          <% List<Book> books = (List<Book>) session.getAttribute("ebooks"); %>
                              <% double totalPrice=0; %>
                                <div class="bg-gray-100 pt-20">
                                  <h1 class="mb-10 text-center text-2xl font-bold">Cart Items</h1>
                                  <div class="mx-auto max-w-5xl justify-center px-6 md:flex md:space-x-6 xl:px-0">
                                    <div class="rounded-lg md:w-2/3">
                                      <% int index=0; %>

                                        <% if (books !=null && !books.isEmpty()) { %>
                                          <% for (Book b : books) { %>
                                            <div
                                              class="justify-between mb-6 rounded-lg bg-white p-6 shadow-md sm:flex sm:justify-start">
                                              <img src="<%= b.getPhoto() %>" alt="product-image"
                                                class="w-24 rounded-lg" />
                                              <div class="sm:ml-4 sm:flex sm:w-full sm:justify-between">
                                                <div class="mt-5 sm:mt-0">
                                                  <h2 class="text-lg font-bold text-gray-900">
                                                    <%= b.getBookName() %>
                                                  </h2>
                                                  <p class="mt-1 text-xs text-gray-700">—&ensp;<%= b.getAuthor() %>
                                                  </p>
                                                </div>
                                                <div
                                                  class="mt-4 flex justify-between sm:space-y-6 sm:mt-0 sm:block sm:space-x-6">
                                                  <div class="flex items-center space-x-4">
                                                    <p class="text-sm">$<%= b.getPrice() %>
                                                    </p>
                                                    <% totalPrice +=b.getPrice(); %>
                                                      <a href="remove?i=<%=index%>">
                                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                                          viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                                                          class="h-5 w-5 cursor-pointer duration-150 hover:text-red-500">
                                                          <path stroke-linecap="round" stroke-linejoin="round"
                                                            d="M6 18L18 6M6 6l12 12" />
                                                        </svg>
                                                      </a>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                            <% index++; %>
                                              <% } %>
                                    </div>
                                    <div class="mt-6 h-full rounded-lg border bg-white p-6 shadow-md md:mt-0 md:w-1/3 md:ml-4">
                                      <div class="mb-2 flex justify-between">
                                          <p class="text-gray-700">Subtotal</p>
                                          <p class="text-gray-700">$<%= totalPrice %></p>
                                      </div>
                                      <div class="flex justify-between">
                                          <p class="text-gray-700">Shipping</p>
                                          <p class="text-gray-700">$4.99</p>
                                      </div>
                                      <hr class="my-4" />
                                      <div class="flex justify-between">
                                          <p class="text-lg font-bold">Total</p>
                                          <div>
                                              <p class="mb-1 text-lg font-bold">$<%= (totalPrice + 4.99) %> USD</p>
                                              <p class="text-sm text-gray-700">including VAT</p>
                                          </div>
                                      </div>
                                      <a href="checkout.jsp" class="p-2 mt-6 w-full rounded-md bg-blue-500 py-1.5 font-medium text-blue-50 hover:bg-blue-600 block text-center">Check out</a>
                                  </div>
                                  
                                    <% } else { %>
                                      <p class="h-48 text-center">No items in the cart.</p>
                                      <% } %>


                                        <!-- Sub total -->

                                  </div>
                                </div>
                                <%@ include file="footer.jsp" %>
            </body>

            </html>