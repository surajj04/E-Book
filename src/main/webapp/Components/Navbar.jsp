<!-- Top Navbar -->
<nav
    class="grid grid-cols-1 md:grid-cols-3 gap-2 place-content-evenly px-4 md:px-20 py-7 items-center bg-white shadow-md">
    <div class="text-center md:text-left">
        <h1 class="text-xl text-gray-800 font-bold">E-Book Platform</h1>
    </div>
    <div class="flex items-center border border-gray-300 p-2 rounded-lg mx-auto md:mx-0 md:mr-3">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 pt-0.5 text-gray-600" fill="none" viewBox="0 0 24 24"
            stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
        </svg>
        <input class="ml-2 outline-none bg-transparent" type="text" name="search" id="search" placeholder="Search..." />
    </div>
    <div class="flex justify-center md:justify-end items-center">
        <ul class="flex items-center space-x-6">
            <li class="text-sm">
                <button class="flex items-center justify-center px-3 py-2 mr-1 text-gray-900 font-semibold rounded">
                    <i class="fa-solid fa-user-plus"></i>
                    <a class="ml-1" href="login.jsp">Login</a>
                </button>
            </li>
            <li class="text-sm">
                <button class="flex items-center justify-center px-3 py-2 mr-1 text-gray-900 font-semibold rounded">
                    <i class="fa-solid fa-right-to-bracket"></i>
                    <a class="ml-1" href="register.jsp">Register</a>
                </button>
            </li>
        </ul>
    </div>
    <!-- Phone Menu Toggle Button -->
    <div class="md:hidden">
        <button id="phoneMenuToggle" class="text-gray-600 hover:text-gray-800 focus:outline-none focus:text-gray-800">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
            </svg>
        </button>
    </div>
</nav>

<!-- Bottom Navbar -->
<nav id="phoneMenu" class="bg-indigo-700 shadow hidden md:block">
    <div class="container flex flex-wrap items-center justify-center p-6 mx-auto text-white capitalize">
        <a href="index.jsp"
            class="border-b-2 border-transparent hover:text-gray-300 hover:border-blue-500 mx-1.5 sm:mx-6 mb-2 sm:mb-0"><i
                class="fa-solid fa-house"></i> Home</a>

        <a href="recentbooks.jsp"
            class="border-b-2 border-transparent hover:text-gray-300 hover:border-blue-500 mx-1.5 sm:mx-6 mb-2 sm:mb-0"><i
                class="fa-solid fa-book-open-reader"></i> Recent books</a>

        <a href="newbooks.jsp"
            class="border-b-2 border-transparent hover:text-gray-300 hover:border-blue-500 mx-1.5 sm:mx-6 mb-2 sm:mb-0"><i
                class="fa-solid fa-book-open"></i> New Books</a>

        <a href="oldbooks.jsp"
            class="border-b-2 border-transparent hover:text-gray-300 hover:border-blue-500 mx-1.5 sm:mx-6 mb-2 sm:mb-0"><i
                class="fa-solid fa-book"></i> Old Books</a>

        <a href="#"
            class="border-b-2 border-transparent hover:text-gray-300 hover:border-blue-500 mx-1.5 sm:mx-6 mb-2 sm:mb-0"><i
                class="fa-solid fa-headset"></i> Contact Us</a>
    </div>
</nav>

<script>
    // JavaScript to toggle phone menu visibility
    document.getElementById('phoneMenuToggle').addEventListener('click', function () {
        document.getElementById('phoneMenu').classList.toggle('hidden');
    });
</script>