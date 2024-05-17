<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="org.ebook.service.BookService" %>
    <%@ page import="org.ebook.model.Book" %>

      <%@ page import="org.ebook.model.User" %>

        <!DOCTYPE html>
        <html>

        <head>
          <title>Add Books </title>
          <%@include file="Components/css.jsp" %>
        </head>

        <body class="bg-gray-100">
          <c:if test="${empty user}">
            <c:redirect url="login.jsp" />
        </c:if>
          <% User user=(User) session.getAttribute("user"); %>
            <%if (user !=null && !user.getName().equals("admin")) { %>
              <%@ include file="Components/userNavbar.jsp" %>
                <% } else { %>
                  <%@ include file="Components/Navbar.jsp" %>
                    <% } %>
                      <!-- component -->
                      <div class="flex items-center justify-center p-12">
                        <!-- Author: FormBold Team -->
                        <!-- Learn More: https://formbold.com -->
                        <div class="mx-auto w-full max-w-[550px]">
                          <form action="https://formbold.com/s/FORM_ID" method="POST">
                            <div class="mb-5">
                              <label for="name" class="mb-3 block text-base font-medium text-[#07074D]">
                                Full Name
                              </label>
                              <input type="text" name="name" id="name" placeholder="Full Name"
                                class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-5">
                              <label for="email" class="mb-3 block text-base font-medium text-[#07074D]">
                                Email Address
                              </label>
                              <input type="email" name="email" id="email" placeholder="example@domain.com"
                                class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-5">
                              <label for="subject" class="mb-3 block text-base font-medium text-[#07074D]">
                                Subject
                              </label>
                              <input type="text" name="subject" id="subject" placeholder="Enter your subject"
                                class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" />
                            </div>
                            <div class="mb-5">
                              <label for="message" class="mb-3 block text-base font-medium text-[#07074D]">
                                Message
                              </label>
                              <textarea rows="4" name="message" id="message" placeholder="Type your message"
                                class="w-full resize-none rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"></textarea>
                            </div>
                            <div>
                              <button
                                class="hover:shadow-form rounded-md bg-[#6A64F1] py-3 px-8 text-base font-semibold text-white outline-none">
                                Submit
                              </button>
                            </div>
                          </form>
                        </div>
                      </div>

                      <%@include file="Components/footer.jsp" %>
        </body>

        </html>