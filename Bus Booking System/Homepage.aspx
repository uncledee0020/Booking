<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Booking System</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* Custom CSS for changing the navigation bar color */
        .bg-custom {
            background-color: #4e3078 !important;
        }

        .text-custom {
            color: #dd9d4b !important;
        }

        /* Custom CSS to adjust image position */
        .moving-images {
            position: relative;
            top: -50px; /* Adjust this value as needed */
        }
    </style>
</head>
<body class="" tabindex="-1">
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-custom">
        <div class="container">
            <a class="navbar-brand text-custom" href="#">
                <img src="your-logo.png" alt="Company Logo" width="40" height="40">
                <!-- Replace with your company logo -->
                Company Name
            </a>

            <div class="justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-custom" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-custom" href="#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-custom" href="#contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-custom" href="#" onclick="openRegisterForm()">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Home Section -->
    <section id="home" class="bg-light text-center py-5" style="height: 300px;" tabindex="-1">
        <div class="container">
            <h1>Welcome to our Bus Booking System</h1>
            <p>Book your bus tickets with ease and convenience.</p>
        </div>
        <div class="container">
            <!-- Add your moving images here -->
            <div id="moving-images" class="d-flex justify-content-center align-items-center h-100 moving-images">
                <img src="assets/bus1.png" alt="Image 1" class="moving-image">
                <img src="assets/bus2.png" alt "Image 2" class="moving-image">
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="bg-light text-center py-5" style="height: 400px;">
        <div class="container">
            <h1>About Us</h1>
            <p>Learn more about our bus booking services and offerings.</p>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="bg-light text-center py-5" style="height: 400px;">
        <div class="container">
            <h2>Contact Us</h2>
            <p>If you have any questions or need assistance, feel free to get in touch with us.</p>
        </div>
    </section>

    <!-- Modal for Register Form -->
    <div class="modal" id="myModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sign Up</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h2>Hello! Welcome, Create a New Account</h2>
                    <form class="registration-form">
                        <div class="mb-3">
                            <label for="firstname" class="form-label">Firstname</label>
                            <input type="text" class="form-control" id="firstname" placeholder="Type your Firstname" required>
                        </div>
                        <div class="mb-3">
                            <label for="lastname" class="form-label">Lastname</label>
                            <input type="text" class="form-control" id="lastname" placeholder="Type your Lastname" required>
                        </div>
                        <div class="mb-3">
                            <label for="idpassport" class="form-label">ID/Passport</label>
                            <input type="text" class="form-control" id="idpassport" placeholder="Type your ID/Passport" required>
                        </div>
                        <div class="mb-3">
                            <label for="phonenumber" class="form-label">Phone number</label>
                            <input type="tel" class="form-control" id="phonenumber" placeholder="Type your phone number" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" placeholder="Type your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Type password" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="consent" required>
                            <label class="form-check-label" for="consent">By submitting my personal data, I consent to Easycoach Limited collecting, processing, and storing my information in accordance with the Easycoach Privacy Policy.</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Register Account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Bootstrap and Popper.js Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <!-- JavaScript for opening and closing the modal -->
    <script>
        function openRegisterForm() {
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                backdrop: 'static',
                keyboard: false
            });
            myModal.show();
        }
        document.oncontextmenu = function () {
            return false;
        };

        const movingImages = document.querySelectorAll(".moving-image");
        let position = 0;
        const speed = 2; // You can adjust the speed as needed.

        function moveImages() {
            position += speed;
            movingImages.forEach((img) => {
                img.style.transform = `translateX(${position}px)`;
            });

            // If the first image moves out of the screen, reset its position
            if (position >= movingImages[0].width) {
                position = -window.innerWidth;
            }
        }

        // Call the moveImages function at a regular interval
        const interval = setInterval(moveImages, 50); // Adjust the interval as needed.
    </script>
</body>
</html>
