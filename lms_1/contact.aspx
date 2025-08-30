<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="lms_1.contact" %>
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
            <style>
        body {

            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .contact-container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }
        .form-label {
            font-weight: 600;
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .section-title {
            font-size: 1.75rem;
            font-weight: bold;
            color: #003366;
            margin-bottom: 25px;
        }
        .btn-send {
            background-color: #003366;
            color: white;
        }
        .btn-send:hover {
            background-color: #00509e;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
                <style>
            .login-card {
                border-radius: 15px;
                padding: 30px;
                background-color: #fff;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }
        </style>
        <style>
    .form-background {
        background-image: url('background_img.jpg'); /* Replace with your image path */
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        min-height: 100vh;
    }

    /* Optional: add semi-transparent layer behind form */
    .form-wrapper {
        background: rgba(255, 255, 255, 0.9); /* white with opacity */
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 500px;
    }
</style>


    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#">
                    <img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Library Logo" width="50"
                        class="me-2" />
                    <strong>LIBRARY</strong>
                </a>
<%--                <form class="d-flex ms-3 flex-grow-1" role="search">
                    <input class="form-control me-2 w-100" type="search" placeholder="Search books..."
                        aria-label="Search">
                </form>--%>
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


<%--        <section class="container-fluid py-5">
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
        </section>--%>
    <form id="form1" runat="server">
<div class="login-card w-500" style="max-width: 100%; overflow-x: auto;">
    <div class="card shadow mt-4 p-4" style="max-width: 100%; overflow-x: auto;">

            <h2 class="text-center section-title">Contact Us</h2>

<%--            <asp:Panel ID="successMessage" runat="server" CssClass="alert alert-success alert-dismissible fade show" Visible="false">
                <strong>Thank you!</strong> We’ve received your message and will contact you shortly.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Panel>

            <asp:Panel ID="errorMessage" runat="server" CssClass="alert alert-danger alert-dismissible fade show" Visible="false">
                <strong>Error!</strong> Please fill all required fields correctly.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Panel>--%>
                                <!-- Alerts -->
                        <asp:Panel ID="SuccessAlert" runat="server"
                            CssClass="alert alert-success alert-dismissible fade show" Visible="false">
                            <strong>Success!</strong>
                            <asp:Label ID="lblSuccessMsg" runat="server" />
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </asp:Panel>
                        <asp:Panel ID="ErrorAlert" runat="server"
                            CssClass="alert alert-danger alert-dismissible fade show" Visible="false">
                            <strong>Error!</strong>
                            <asp:Label ID="lblErrorMsg" runat="server" />
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </asp:Panel>

            <div class="mb-3">
                <label for="txtName" class="form-label">Full Name <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
            </div>
            <div class="mb-3">
    <label for="txtPhoneNo" class="form-label">Phone.No <span class="text-danger">*</span></label>
    <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" placeholder="1234567890" TextMode="Number" ></asp:TextBox>
</div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@email.com" TextMode="Email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtSubject" class="form-label">Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter subject (optional)"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtMessage" class="form-label">Message <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Write your message here..."></asp:TextBox>
            </div>

            <div class="d-grid">
<asp:Button ID="btnSend" runat="server" Text="Save MESSAGE" CssClass="btn btn-success mb-4"
    OnClick="btnSend_Click" />            

            </div>
            </div>
        </div>
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