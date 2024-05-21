<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="org.ebook.service.BookService" %>
        <%@ page import="org.ebook.model.Book" %>
            <%@ page import="org.ebook.model.User" %>
                <%@ page import="java.util.List" %>
                    <%@ page isELIgnored="false" %>
                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Checkout</title>
                            <%@ include file="css.jsp" %>
                                <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.min.js"
                                    defer></script>

                        </head>

                        <body>

                            <c:if test="${empty user}">
                                <c:redirect url="login.jsp" />
                            </c:if>
                            <% User user=(User) session.getAttribute("user"); %>
                                <% if (user !=null && !user.getName().equals("admin")) { %>
                                    <%@ include file="Components/userNavbar.jsp" %>
                                        <% } else { %>
                                            <%@ include file="Components/Navbar.jsp" %>
                                                <% } %>

                                                    <c:if test="${empty user}">
                                                        <c:redirect url="login.jsp" />
                                                    </c:if>

                                                    <!-- component -->
                                                    <% List<Book> books = (List<Book>) session.getAttribute("ebooks");
                                                            %>
                                                            <% double totalPrice=0; %>
                                                                <div class="min-w-screen min-h-screen bg-gray-50 py-5">
                                                                    <div
                                                                        class="w-full bg-white border-t border-b border-gray-200 px-5 py-10 text-gray-800">
                                                                        <div class="w-full"
                                                                            x-data="{ paymentMethod: 'card' }">
                                                                            <div class="-mx-3 md:flex items-start">
                                                                                <div class="px-3 md:w-7/12 lg:pr-10">
                                                                                    <div
                                                                                        class="w-full mx-auto text-gray-800 font-light mb-6 border-b border-gray-200 pb-6">
                                                                                        <% for (Book b : books) { %>
                                                                                            <div
                                                                                                class="w-full flex items-center my-2">
                                                                                                <div
                                                                                                    class="overflow-hidden rounded-lg w-16 h-16 bg-gray-50 border border-gray-200">
                                                                                                    <img src="<%=b.getPhoto()%>"
                                                                                                        alt="">
                                                                                                </div>
                                                                                                <div
                                                                                                    class="flex-grow pl-3">
                                                                                                    <h6
                                                                                                        class="font-semibold uppercase text-gray-600">
                                                                                                        <%=b.getBookName()%>
                                                                                                    </h6>
                                                                                                    <p
                                                                                                        class="text-gray-400">
                                                                                                        x 1</p>
                                                                                                </div>
                                                                                                <div>
                                                                                                    <span
                                                                                                        class="font-semibold text-gray-600 text-xl">$
                                                                                                        <%=b.getPrice()%>
                                                                                                            <%totalPrice+=b.getPrice();%>
                                                                                                                </span><span
                                                                                                        class="font-semibold text-gray-600 text-sm">.00</span>
                                                                                                </div>
                                                                                            </div>
                                                                                            <%}%>
                                                                                    </div>
                                                                                    <div
                                                                                        class="mb-6 pb-6 border-b border-gray-200">
                                                                                        <div
                                                                                            class="-mx-2 flex items-end justify-end">
                                                                                            <div
                                                                                                class="flex-grow px-2 lg:max-w-xs">
                                                                                                <label
                                                                                                    class="text-gray-600 font-semibold text-sm mb-2 ml-1">Discount
                                                                                                    code</label>
                                                                                                <div>
                                                                                                    <input
                                                                                                        class="w-full px-3 py-2 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                                                                                        placeholder="XXXXXX"
                                                                                                        type="text" />
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="px-2">
                                                                                                <button
                                                                                                    class="block w-full max-w-xs mx-auto border border-transparent bg-gray-400 hover:bg-gray-500 focus:bg-gray-500 text-white rounded-md px-5 py-2 font-semibold">APPLY</button>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="mb-6 pb-6 border-b border-gray-200 text-gray-800">
                                                                                        <div
                                                                                            class="w-full flex mb-3 items-center">
                                                                                            <div class="flex-grow">
                                                                                                <span
                                                                                                    class="text-gray-600">Subtotal</span>
                                                                                            </div>
                                                                                            <div class="pl-3">
                                                                                                <span
                                                                                                    class="font-semibold">$
                                                                                                    <%=totalPrice%>
                                                                                                        </span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div
                                                                                            class="w-full flex items-center">
                                                                                            <div class="flex-grow">
                                                                                                <span
                                                                                                    class="text-gray-600">Taxes
                                                                                                    (GST)</span>
                                                                                            </div>
                                                                                            <div class="pl-3">
                                                                                                <span
                                                                                                    class="font-semibold">$4.99</span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <form action="submitorder" method="get">

                                                                                        <div
                                                                                            class="mb-6 pb-6 border-b border-gray-200 md:border-none text-gray-800 text-xl">
                                                                                            <div
                                                                                                class="w-full flex items-center">
                                                                                                <div class="flex-grow">
                                                                                                    <span
                                                                                                        class="text-gray-600">Total</span>
                                                                                                </div>
                                                                                                <div class="pl-3">
                                                                                                    <span
                                                                                                        class="font-semibold text-gray-400 text-sm">AUD</span>
                                                                                                    <span
                                                                                                        class="font-semibold">$
                                                                                                        <%=(totalPrice+4.99)%>
                                                                                                            </span>
                                                                                                    <input hidden
                                                                                                        type="number"
                                                                                                        value="<%=(totalPrice+4.99)%>"
                                                                                                        name="totalPrice">
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                </div>
                                                                                <div class="px-3 md:w-5/12">
                                                                                    <div
                                                                                        class="w-full mx-auto rounded-lg bg-white border border-gray-200 p-3 text-gray-800 font-light mb-6">
                                                                                        <div
                                                                                            class="w-full flex mb-3 items-center">
                                                                                            <div class="w-32">
                                                                                                <span
                                                                                                    class="text-gray-600 font-semibold">Contact</span>
                                                                                            </div>
                                                                                            <div class="flex-grow pl-3">
                                                                                                <span>
                                                                                                    <%=user.getName()%>
                                                                                                        &ensp;&ensp;
                                                                                                        <%=user.getPhone()%>
                                                                                                            </< /span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div
                                                                                            class="w-full flex items-center">
                                                                                            <div class="w-32">
                                                                                                <span
                                                                                                    class="text-gray-600 font-semibold">Billing
                                                                                                    Address</span>
                                                                                            </div>
                                                                                            <div class="flex-grow pl-3">
                                                                                                <span>
                                                                                                    <%=user.getAddress()%>
                                                                                                </span>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div
                                                                                        class="w-full mx-auto rounded-lg bg-white border border-gray-200 text-gray-800 font-light mb-6">
                                                                                        <!-- <div 
                                                                                    class="w-full p-3 border-b border-gray-200" >
                                                                                    <div class="mb-5">
                                                                                        <label for="type1"
                                                                                            class="flex items-center cursor-pointer">
                                                                                            <input type="radio"
                                                                                                class="form-radio h-5 w-5 text-indigo-500"
                                                                                                name="type" id="type1"
                                                                                                value="card"
                                                                                                x-model="paymentMethod" onclick="changeMode(2)">
                                                                                            <img src="https://leadershipmemphis.org/wp-content/uploads/2020/08/780370.png"
                                                                                                class="h-6 ml-3">
                                                                                        </label>
                                                                                    </div>
                                                                                    <div x-show="paymentMethod === 'card'">
                                                                                        <div class="mb-3">
                                                                                            <label
                                                                                                class="text-gray-600 font-semibold text-sm mb-2 ml-1">Name
                                                                                                on card</label>
                                                                                            <div>
                                                                                                <input
                                                                                                    class="w-full px-3 py-2 mb-1 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                                                                                    placeholder="John Smith"
                                                                                                    type="text" />
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="mb-3">
                                                                                            <label
                                                                                                class="text-gray-600 font-semibold text-sm mb-2 ml-1">Card
                                                                                                number</label>
                                                                                            <div>
                                                                                                <input
                                                                                                    class="w-full px-3 py-2 mb-1 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                                                                                    placeholder="0000 0000 0000 0000"
                                                                                                    type="text" />
                                                                                            </div>
                                                                                        </div>
                                                                                        <div
                                                                                            class="mb-3 -mx-2 flex items-end">
                                                                                            <div class="px-2 w-1/4">
                                                                                                <label
                                                                                                    class="text-gray-600 font-semibold text-sm mb-2 ml-1">Expiration
                                                                                                    date</label>
                                                                                                <div>
                                                                                                    <select
                                                                                                        class="form-select w-full px-3 py-2 mb-1 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors cursor-pointer">
                                                                                                        <option value="01">
                                                                                                            01 - January
                                                                                                        </option>
                                                                                                        <option value="02">
                                                                                                            02 -
                                                                                                            February
                                                                                                        </option>
                                                                                                        <option value="03">
                                                                                                            03 - March
                                                                                                        </option>
                                                                                                        <option value="04">
                                                                                                            04 - April
                                                                                                        </option>
                                                                                                        <option value="05">
                                                                                                            05 - May
                                                                                                        </option>
                                                                                                        <option value="06">
                                                                                                            06 - June
                                                                                                        </option>
                                                                                                        <option value="07">
                                                                                                            07 - July
                                                                                                        </option>
                                                                                                        <option value="08">
                                                                                                            08 - August
                                                                                                        </option>
                                                                                                        <option value="09">
                                                                                                            09 -
                                                                                                            September
                                                                                                        </option>
                                                                                                        <option value="10">
                                                                                                            10 - October
                                                                                                        </option>
                                                                                                        <option value="11">
                                                                                                            11 -
                                                                                                            November
                                                                                                        </option>
                                                                                                        <option value="12">
                                                                                                            12 -
                                                                                                            December
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="px-2 w-1/4">
                                                                                                <select
                                                                                                    class="form-select w-full px-3 py-2 mb-1 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors cursor-pointer">
                                                                                                    <option value="2020">
                                                                                                        2020</option>
                                                                                                    <option value="2021">
                                                                                                        2021</option>
                                                                                                    <option value="2022">
                                                                                                        2022</option>
                                                                                                    <option value="2023">
                                                                                                        2023</option>
                                                                                                    <option value="2024">
                                                                                                        2024</option>
                                                                                                    <option value="2025">
                                                                                                        2025</option>
                                                                                                    <option value="2026">
                                                                                                        2026</option>
                                                                                                    <option value="2027">
                                                                                                        2027</option>
                                                                                                    <option value="2028">
                                                                                                        2028</option>
                                                                                                    <option value="2029">
                                                                                                        2029</option>
                                                                                                </select>
                                                                                            </div>
                                                                                            <div class="px-2 w-1/4">
                                                                                                <label
                                                                                                    class="text-gray-600 font-semibold text-sm mb-2 ml-1">Security
                                                                                                    code</label>
                                                                                                <div>
                                                                                                    <input
                                                                                                        class="w-full px-3 py-2 mb-1 border border-gray-200 rounded-md focus:outline-none focus:border-indigo-500 transition-colors"
                                                                                                        placeholder="000"
                                                                                                        type="text" />
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div> -->
                                                                                        <div class="w-full p-3 border-b border-gray-200"
                                                                                            x-show="paymentMethod !== 'cod'">
                                                                                            <label for="type2"
                                                                                                class="flex items-center cursor-pointer">
                                                                                                <input type="radio"
                                                                                                    class="form-radio h-5 w-5 text-indigo-500"
                                                                                                    name="paymentMethod"
                                                                                                    id="type2"
                                                                                                    value="Cash on delivery"
                                                                                                    x-model="paymentMethod"
                                                                                                    onclick="changeMode(1)"
                                                                                                    required />
                                                                                                <label for="type3"
                                                                                                    class="flex items-center cursor-pointer">
                                                                                                    <span
                                                                                                        class="ml-3 text-gray-600 font-semibold">Cash
                                                                                                        on
                                                                                                        Delivery</span>
                                                                                                </label>
                                                                                                <div x-show="paymentMethod === 'cod'"
                                                                                                    class="mt-4">
                                                                                                    <p
                                                                                                        class="text-gray-600">
                                                                                                        You
                                                                                                        have selected
                                                                                                        Cash on
                                                                                                        Delivery. Please
                                                                                                        ensure you
                                                                                                        have the exact
                                                                                                        amount ready at
                                                                                                        the time of
                                                                                                        delivery.</p>
                                                                                                </div>
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div>
                                                                                        <a href="submitorder">
                                                                                            <button
                                                                                                class="block w-full max-w-xs mx-auto bg-indigo-500 hover:bg-indigo-700 focus:bg-indigo-700 text-white rounded-lg px-3 py-2 font-semibold"
                                                                                                type="submit"><i
                                                                                                    class="mdi mdi-lock-outline mr-1"></i><span
                                                                                                    id="btn-text">Continue</span></button>
                                                                                        </a>
                                                                                    </div>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <%@include file="Components/footer.jsp" %>

                        </body>

                        </html>