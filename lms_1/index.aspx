<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="lms_1.index" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User Dashboard - Library Portal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <%-- <style>
            body {
            background-color: #f5f7fa;
            }

            .navbar-custom {
            background-color: #003366;
            }

            .navbar-custom .nav-link,
            .navbar-custom .navbar-brand {
            color: #ffffff;
            }

            .navbar-custom .nav-link:hover,
            .navbar-custom .dropdown-toggle:hover {
            color: #ffd700;
            }

            .hero {
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-shadow: 2px 2px 5px #000;
            }

            .feature-box {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .profile-info {
            color: white;
            text-align: right;
            padding-right: 10px;
            font-size: 14px;
            }

            .carousel-inner img {
            height: 400px;
            object-fit: cover;
            }
            </style>--%>
        <style>
            body {
                background-color: #f5f7fa;
            }

            .navbar-custom {
                background-color: #f5f7fa;
            }

                .navbar-custom .nav-link,
                .navbar-custom .navbar-brand {
                    color: #000;
                }

                    .navbar-custom .nav-link:hover,
                    .navbar-custom .dropdown-toggle:hover {
                        color: #008aff;
                    }
            /*                Styling form thead Search Box 
*/
            .search-box {
                border-radius: 25px;
                padding-left: 15px;
                border: 2px solid transparent double;
                transition: all 0.3s;
            }

                .search-box:focus {
                    border: 2px solid #ffc107;
                    box-shadow: 0 0 10px rgba(255, 193, 7, 0.3);
                }

            .feature-box {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .carousel-img {
                height: 800px; /* adjust as needed */
                object-fit: cover; /* keeps aspect ratio, fills container */
            }


            .carousel-caption {
                background-color: rgba(0, 0, 0, 0.5);
                padding: 20px;
                border-radius: 10px;
            }

                .carousel-caption h5 {
                    font-size: 2rem;
                    font-weight: bold;
                    text-shadow: 2px 2px 5px #000;
                }

                .carousel-caption p {
                    font-size: 1.1rem;
                    text-shadow: 1px 1px 3px #000;
                }

            /*.socialIcon {
                width: 30px;
                height: 40px;
                background-size: contain;
                background-repeat: no-repeat;
                background-position: center;
                transition: transform 0.3s ease;
            }

                .socialIcon:hover {
                    transform: scale(1.1);
                }*/

            /* Platform-specific icons using background images or gradients */
            /*.facebook {
                background-image: url('https://cdn-icons-png.flaticon.com/512/733/733547.png');
            }

            .instagram {
                background-image: url('https://cdn-icons-png.flaticon.com/512/2111/2111463.png');
            }

            .linkedin {
                background-image: url('https://cdn-icons-png.flaticon.com/512/145/145807.png');
            }

            .twitter {
                background-image: url('https://cdn-icons-png.flaticon.com/512/733/733579.png');
            }

            .youtube {
                background-image: url('https://cdn-icons-png.flaticon.com/512/1384/1384060.png');
            }*/

/*        Style form thead footer 
        */
/* Footer Background */
            .footer-custom {
                background: linear-gradient(135deg, #0d0d0d, #1a1a40);
            }

            /* Links */
            .footer-link {
                color: #bbb;
                text-decoration: none;
                transition: color 0.3s ease, transform 0.2s ease;
            }

                .footer-link:hover {
                    color: #ffc107;
                    transform: translateX(5px);
                }

            /* Social Icons */
            .social-links a {
                display: inline-block;
                margin: 0 10px;
                font-size: 1.4rem;
                color: #bbb;
                transition: all 0.3s ease-in-out;
            }

                .social-links a:hover {
                    color: #ffc107;
                    transform: scale(1.2);
                }

            /* Headings */
            .footer-custom h5 {
                letter-spacing: 1px;
                position: relative;
            }

                .footer-custom h5::after {
                    content: '';
                    display: block;
                    width: 50px;
                    height: 3px;
                    background: #ffc107;
                    margin-top: 6px;
                    border-radius: 2px;
                }

        </style>


    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="index.aspx">
                    <img src="college_logo.png" alt="Library Logo" width="100"
                        class="me-2" />
                    <b>LIBRARY </b>
                </a>
                <form class="d-flex ms-3 flex-grow-1" role="search">
                    <input class="form-control me-2 w-100" type="search" placeholder="Search books..."
                        aria-label="Search">
                </form>
                <a href="login.aspx" class="btn btn-primary ms-2"> <b>Login</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="index.aspx"><b>Home</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="about.aspx"><b>About Us</b></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                data-bs-toggle="dropdown"><b>Services</b></a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">News Paper</a></li>
                                <li><a class="dropdown-item" href="#">PYQ</a></li>
                                <li><a class="dropdown-item" href="#">Service Three</a></li>
                                <li><a class="dropdown-item" href="#">Service Four</a></li>
                                <li><a class="dropdown-item" href="#">Service Five</a></li>
                                <li><a class="dropdown-item" href="#">Service Six</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="bookcollection.aspx"><b>Book Collection</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="new.aspx"><b>Latest News</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="info.aspx"><b> Information</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="collection.aspx"><b>Collection</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.aspx"><b>Contact Us</b></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Image Slider -->
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1">
                </button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2">
                </button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3">
                </button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"
                    aria-label="Slide 4">
                </button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4"
                    aria-label="Slide 5">
                </button>

            </div>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div id="header-carousel" class="carousel slide banner-slider" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 carousel-img" src="img_1.jpg" alt="Image">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome To The Iceem Library</h5>
                                <p>Explore The Books</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 carousel-img" src="img_2.jpg" alt="Image">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome To The Iceem Library</h5>
                                <p>Explore The Books</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 carousel-img" src="img_3.jpg" alt="Image">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome To The Iceem Library</h5>
                                <p>Explore The Books</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 carousel-img" src="img_4.jpg" alt="Image">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome To The Iceem Library</h5>
                                <p>Explore The Books</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100 carousel-img" src="img_5.jpg" alt="Image">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome To The Iceem Library</h5>
                                <p>Explore The Books</p>
                            </div>
                        </div>
                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
     </div>

            <form id="form1" runat="server">
            <section class="container-fluid py-5">
    <div class="row text-center g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Private and Secure</h5>
                <p>Your data is safe with us. Privacy-first approach always.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Why Private Tuition?</h5>
                <p>Learn with focus through our one-on-one virtual or local tutors.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Fast & Affordable</h5>
                <p>Access thousands of books and journals in just one click.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>100% Satisfaction</h5>
                <p>Dedicated support and service for every reader and student.</p>
            </div>
        </div>
    </div>
                    <div class="row text-center g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Private and Secure</h5>
                <p>Your data is safe with us. Privacy-first approach always.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Why Private Tuition?</h5>
                <p>Learn with focus through our one-on-one virtual or local tutors.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Fast & Affordable</h5>
                <p>Access thousands of books and journals in just one click.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>100% Satisfaction</h5>
                <p>Dedicated support and service for every reader and student.</p>
            </div>
        </div>
    </div>
                    <div class="row text-center g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Private and Secure</h5>
                <p>Your data is safe with us. Privacy-first approach always.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Why Private Tuition?</h5>
                <p>Learn with focus through our one-on-one virtual or local tutors.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Fast & Affordable</h5>
                <p>Access thousands of books and journals in just one click.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>100% Satisfaction</h5>
                <p>Dedicated support and service for every reader and student.</p>
            </div>
        </div>
    </div>
                    <div class="row text-center g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Private and Secure</h5>
                <p>Your data is safe with us. Privacy-first approach always.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Why Private Tuition?</h5>
                <p>Learn with focus through our one-on-one virtual or local tutors.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Fast & Affordable</h5>
                <p>Access thousands of books and journals in just one click.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>100% Satisfaction</h5>
                <p>Dedicated support and service for every reader and student.</p>
            </div>
        </div>
    </div>
                    <div class="row text-center g-4">
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Private and Secure</h5>
                <p>Your data is safe with us. Privacy-first approach always.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Why Private Tuition?</h5>
                <p>Learn with focus through our one-on-one virtual or local tutors.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>Fast & Affordable</h5>
                <p>Access thousands of books and journals in just one click.</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="feature-box">
                <h5>100% Satisfaction</h5>
                <p>Dedicated support and service for every reader and student.</p>
            </div>
        </div>
    </div>
</section>
        </form>

        <footer class="footer-custom text-light pt-5 pb-4">
            <div class="container text-center text-md-start">
                <div class="row text-center text-md-start">
                    <!-- About -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 fw-bold text-warning">Library Portal</h5>
                        <p class="small">
                            Empowering education with easy access to thousands of books and learning resources.
                        </p>
                    </div>

                    <!-- Quick Links -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 fw-bold text-warning">Quick Links</h5>
                        <p><a href="index.aspx" class="footer-link">Home</a></p>
                        <p><a href="about.aspx" class="footer-link">About</a></p>
                        <p><a href="bookcollection.aspx" class="footer-link">Books</a></p>
                        <p><a href="contact.aspx" class="footer-link">Contact</a></p>
                    </div>

                    <!-- Contact -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 fw-bold text-warning">Contact</h5>
                        <p><i class="fas fa-home me-2"></i>ICEEM Library, Aurangabad</p>
                        <p><i class="fas fa-envelope me-2"></i>iceemlibrary@abad.com</p>
                        <p><i class="fas fa-phone me-2"></i>+91 9876543210</p>
                        <p><i class="fas fa-print me-2"></i>+91 9999999999</p>
                    </div>

                    <!-- Social -->
                    <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 fw-bold text-warning">Follow Us</h5>
                        <div class="social-links">
                            <a href="https://www.facebook.com/yourusername" target="_blank" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://www.instagram.com/yourusername" target="_blank" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="https://www.linkedin.com/in/yourusername" target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://www.youtube.com/@yourusername" target="_blank" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>

                <hr class="mb-4 text-light opacity-25">

                <div class="row align-items-center">
                    <div class="col-md-7 col-lg-8 text-md-start text-center">
                        <p class="mb-0 small">© ICEEM Library - All Rights Reserved.</p>
                    </div>
                    <div class="col-md-5 col-lg-4 text-md-end text-center">
                        <p class="mb-0 small">Designed by <span class="text-warning fw-bold">Narayan Adhude</span></p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>