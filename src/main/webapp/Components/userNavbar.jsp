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
		<ul class="flex items-center space-x-2">
			<li class="text-sm">
				<button class="flex items-center justify-center px-1 py-2 text-gray-900 font-semibold rounded">
					<a class="ml-1  mx-3" href="cart"><i class="fa-solid fa-user-plus"></i> Cart</a>
				</button>
			</li>
			<li class="text-sm">
				<button class="flex items-center justify-center px-1 py-2 text-gray-900 font-semibold rounded">
					<a href="profile.jsp" class="border-b-2 border-transparent  mx-3 mb-2 sm:mb-0"><i
							class="fa-solid fa-user"></i> Profile</a>
				</button>
			</li>
			<li class="text-sm">
				<button class="flex items-center justify-center px-1 py-2 text-gray-900 font-semibold rounded">
					<a href="order.jsp" class="border-b-2 border-transparent  mx-3 mb-2 sm:mb-0"><i
							class="fa-solid fa-box-open"></i> Order</a>
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

		<a href="contactus.jsp"
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




<div class="main-modal fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
	style="background: rgba(0,0,0,.7);">
	<div
		class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
		<div class="modal-content py-4 text-left px-6">
			<!--Title-->
			<div class="flex justify-between items-center pb-3">
				<div class="modal-close cursor-pointer z-50" onclick="modalClose()">
					<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18"
						viewBox="0 0 18 18">
						<path
							d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
						</path>
					</svg>
				</div>
			</div>
			<!--Body-->
			<div class="my-3">
				<p class="text-2xl text-center">Do you want to Logout</p>
			</div>
			<!--Footer-->
			<div class="flex justify-center pt-2">
				<button
					class="focus:outline-none modal-close px-4 bg-green-600 p-2 rounded-lg text-white hover:bg-green-700"
					onclick="modalClose()">No</button>
				<a href="logout"
					class="focus:outline-none px-4 bg-red-600 p-2 ml-3 rounded-lg text-white hover:bg-red-700">Yes</a>
			</div>
		</div>
	</div>
</div>




<script>
	const modal = document.querySelector('.main-modal');
	const closeButton = document.querySelectorAll('.modal-close');

	const modalClose = () => {
		modal.classList.remove('fadeIn');
		modal.classList.add('fadeOut');
		setTimeout(() => {
			modal.style.display = 'none';
		}, 500);
	};

	const openModal = () => {
		modal.classList.remove('fadeOut');
		modal.classList.add('fadeIn');
		modal.style.display = 'flex';
	};

	for (let i = 0; i < closeButton.length; i++) {
		const element = closeButton[i];
		element.onclick = (e) => modalClose();
		modal.style.display = 'none';
	}

	window.onclick = function (event) {
		if (event.target == modal) modalClose();
	};
</script>

</script>


<script>

	const changeMode = (text) => {
		const ele = document.getElementById("btn-text");
		switch (text) {
			case 1:
				ele.innerText = "Place Your Order";
				break;
			case 2:
				ele.innerText = "PAY NOW";
				break;
			default:
				break;
		}

	}
</script>