<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Book Login</title>
    <%@include file="Components/css.jsp" %>
</head>

<body>
    <%@include file="Components/Navbar.jsp" %>

        <div class="">
            <div
                class="relative flex items-center justify-center bg-center py-12 px-4 sm:px-6 lg:px-8 bg-no-repeat bg-cover relative items-center">
                <div class="absolute opacity-60 inset-0 z-0"></div>
                <div class="max-w-md w-full space-y-8 p-10 bg-white border rounded-xl shadow-lg z-10">
                    <div class="grid  gap-8 grid-cols-1">
                        <div class="flex flex-col ">
                            <form action="login" method="post">
                                <div class="flex flex-col sm:flex-row items-center">
                                    <h2 class="font-semibold text-lg mr-auto">User Login</h2>
                                    <div class="w-full sm:w-auto sm:ml-auto mt-3 sm:mt-0"></div>
                                </div>
                                <div class="mt-5">
                                    <div class="form">
                                        <div class="w-full text-xs">
                                            <div class="mb-3 space-y-2 w-full text-xs">
                                                <label class="font-semibold text-gray-600 py-2">Mail <span
                                                        title="required" class="text-red-500">*</span></label>
                                                <input placeholder="Email ID"
                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                    required="required" type="email" name="email"
                                                    id="integration_shop_name">
                                                <p class="text-red text-xs hidden">Please fill out this field.</p>
                                            </div>
                                        </div>
                                        <div class=" w-full text-xs">
                                            <div class="w-full flex flex-col mb-3">
                                                <label class="font-semibold text-gray-600 py-2">Password<span
                                                        title="required" class="text-red-500">*</span></label>
                                                <input placeholder="Password"
                                                    class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter rounded-lg h-10 px-4"
                                                    type="password" name="password"
                                                    id="integration_street_address">
                                                <p class="text-sm text-red-500 hidden mt-3" id="error">Please fill out
                                                    this
                                                    field.</p>
                                            </div>
                                        </div>

                                        <div class="mt-5 text-right md:space-x-3 md:block flex flex-col-reverse">
                                            <button
                                                class="mb-2 md:mb-0 bg-indigo-700 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white rounded-full hover:shadow-lg hover:bg-indigo-600"
                                                type="submit">Login</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="Components/footer.jsp" %>
</body>

</html>