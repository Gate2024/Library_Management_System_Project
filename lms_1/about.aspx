<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="lms_1.about" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User Dashboard - Library Portal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
            <style>
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
                .socialIcon {
                    width: 30px;
                    height: 40px;
                    background-size: contain;
                    background-repeat: no-repeat;
                    background-position: center;
                    transition: transform 0.3s ease;
                }

                .socialIcon:hover {
                    transform: scale(1.1);
                }

                /* Platform-specific icons using background images or gradients */
                .facebook {
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
                }
            </style>
        

    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Library Logo" width="40"
                        class="me-2" />
                    <strong>LIBRARY</strong>
                </a>
                <form class="d-flex ms-3 flex-grow-1" role="search">
                    <input class="form-control me-2 w-100" type="search" placeholder="Search books..."
                        aria-label="Search">
                </form>
                <a href="login.aspx" class="btn btn-warning ms-2">Login</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.aspx">About Us</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                data-bs-toggle="dropdown">Services</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">News Paper</a></li>
                                <li><a class="dropdown-item" href="#">PYQ</a></li>
                                <li><a class="dropdown-item" href="#">Service Three</a></li>
                                <li><a class="dropdown-item" href="#">Service Four</a></li>
                                <li><a class="dropdown-item" href="#">Service Five</a></li>
                                <li><a class="dropdown-item" href="#">Service Six</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="bookcollection.aspx">Book Collection</a></li>
                        <li class="nav-item"><a class="nav-link" href="new.aspx">Latest News</a></li>
                        <li class="nav-item"><a class="nav-link" href="info.aspx">Other Information</a></li>
                        <li class="nav-item"><a class="nav-link" href="collection.aspx">Collection</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact.aspx">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Image Slider -->

        <form id="form1" runat="server">
<section class="container py-5">
    <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-8">
            <h2 class="text-primary fw-bold">About Our Library</h2>
            <p class="lead text-muted">
                Welcome to ICEEM Library Portal — a digital platform designed to empower learners, educators, and researchers
                with seamless access to knowledge. We are committed to cultivating a vibrant learning ecosystem by offering
                thousands of books, journals, and learning resources.
            </p>
        </div>
    </div>

    <div class="row gy-4">
        <div class="col-md-6">
            <div class="card shadow-sm border-0 h-100">
                <img src="img_5.jpg" class="card-img-top" alt="Library Books">
                <div class="card-body">
                    <h5 class="card-title">Our Mission</h5>
                    <p class="card-text text-muted">
                        Our mission is to provide easy, inclusive, and equitable access to educational resources. Whether you're a
                        student, faculty, or lifelong learner — our library is your gateway to knowledge.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm border-0 h-100">
                <img src="img_4.jpg" class="card-img-top" alt="Study Space">
                <div class="card-body">
                    <h5 class="card-title">What We Offer</h5>
                    <ul class="list-unstyled text-muted">
                        <li><i class="fas fa-book-open me-2 text-primary"></i>Extensive physical & digital book collection</li>
                        <li><i class="fas fa-users me-2 text-primary"></i>Reading rooms & community events</li>
                        <li><i class="fas fa-laptop me-2 text-primary"></i>Online access to journals and research papers</li>
                        <li><i class="fas fa-headset me-2 text-primary"></i>Helpdesk support for students and faculty</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="row mt-5">
        <div class="col text-center">
            <h5 class="text-secondary fw-semibold">ICEEM Library – Your Knowledge Partner</h5>
        </div>
    </div>--%>
</section>
        </form>

        <footer class="bg-dark text-light pt-5 pb-4 mt-6">
            <div class="container text-center text-md-start">
                <div class="row text-center text-md-start">
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Library Portal</h5>
                        <p>Empowering education with easy access to thousands of books and learning resources.</p>
                    </div>
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Quick Links</h5>
                        <p><a href="index.aspx" class="text-light text-decoration-none">Home</a></p>
                        <p><a href="about.aspx" class="text-light text-decoration-none">About</a></p>
                        <p><a href="bookcollection.aspx" class="text-light text-decoration-none">Books</a></p>
                        <p><a href="contact.aspx" class="text-light text-decoration-none">Contact</a></p>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Contact</h5>
                        <p><i class="fas fa-home me-3"></i> ICEEM Library, Aurangabad</p>
                        <p><i class="fas fa-envelope me-3"></i> iceemlibrary@abad.com</p>
                        <p><i class="fas fa-phone me-3"></i> +91 9876543210</p>
                        <p><i class="fas fa-print me-3"></i> +91 9999999999</p>
                    </div>
                    <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Follow Us</h5>
                        <a href="https://www.facebook.com/yourusername" target="_blank" rel="noopener noreferrer"
                            aria-label="Facebook">
                            <div class="socialIcon facebook"></div>
                        </a>
                        <a href="https://www.instagram.com/yourusername" target="_blank" rel="noopener noreferrer"
                            aria-label="Instagram">
                            <div class="socialIcon instagram"></div>
                        </a>
                        <a href="https://www.linkedin.com/in/yourusername" target="_blank" rel="noopener noreferrer"
                            aria-label="LinkedIn">
                            <div class="socialIcon linkedin"></div>
                        </a>
                        <%--<a href="https://twitter.com/yourusername" target="_blank" rel="noopener noreferrer"
                            aria-label="Twitter">
                            <div class="socialIcon twitter"></div>
                            </a>--%>
                            <a href="https://www.youtube.com/@yourusername" target="_blank" rel="noopener noreferrer"
                                aria-label="YouTube">
                                <div class="socialIcon youtube"></div>
                            </a>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="row align-items-center">
                    <div class="col-md-7 col-lg-8">
                        <p>© ICEEM Library - All Rights Reserved.</p>
                    </div>
                    <div class="col-md-5 col-lg-4">
                        <p class="text-end">Designed by <span class="text-warning">Narayan Adhude</span></p>
                    </div>
                </div>
            </div>

        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>