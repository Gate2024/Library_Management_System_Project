<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="lms_1.forgotpassword" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Forgot Password</title>

    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            background-image: url('background_img.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            padding: 40px;
            width: 100%;
            max-width: 600px;
            margin: 60px auto;
            text-align: center;
        }

        .forgot-icon {
            font-size: 3rem;
            color: #000;
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

        .form-control,
        .input-group-text {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
        }

            .form-control::placeholder {
                color: black;
            }

            .input-group-text i {
                color: #fff;
            }

        .btn-primary {
            background-color: #1d3557;
            border: none;
        }

            .btn-primary:hover {
                background-color: #457b9d;
            }

        .socialIcon {
            width: 30px;
            height: 40px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            transition: transform 0.3s ease;
            display: inline-block;
            margin-right: 8px;
        }

            .socialIcon:hover {
                transform: scale(1.1);
            }

        .facebook {
            background-image: url('https://cdn-icons-png.flaticon.com/512/733/733547.png');
        }

        .instagram {
            background-image: url('https://cdn-icons-png.flaticon.com/512/2111/2111463.png');
        }

        .linkedin {
            background-image: url('https://cdn-icons-png.flaticon.com/512/145/145807.png');
        }

        .youtube {
            background-image: url('https://cdn-icons-png.flaticon.com/512/1384/1384060.png');
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom fixed-topm">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Library Logo" width="50" class="me-2" />
                <strong>LIBRARY</strong>
            </a>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.aspx">About Us</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Services</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">News Paper</a></li>
                            <li><a class="dropdown-item" href="#">PYQ</a></li>
                            <li><a class="dropdown-item" href="#">Service Three</a></li>
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

    <!-- Forgot Password Form -->
    <form id="form1" runat="server">
        <div class="login-card">
            <i class="fas fa-lock-open forgot-icon"></i>
            <h3 class="mt-3 text-dark">Forgot Password</h3>
            <p class="text-dark-50">Enter your registered email to receive OTP.</p>

            <div class="text-start mt-3">
                <asp:Label ID="txtLabel" runat="server" Text="Email:" CssClass="form-label text-white"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Registered Email"></asp:TextBox>
            </div>

            <asp:Button ID="btnSendOtp" runat="server" Text="Send OTP" CssClass="btn btn-primary w-100 mt-3" OnClick="btnSendOtp_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary w-100 mt-3" OnClick="btnBack_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-info d-block text-center mt-3" Visible="false"></asp:Label>
        </div>
    </form>

    <!-- Footer -->
    <footer class="bg-dark text-light pt-5 pb-4 mt-5">
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
                    <p><i class="fas fa-home me-3"></i>ICEEM Library, Aurangabad</p>
                    <p><i class="fas fa-envelope me-3"></i>iceemlibrary@abad.com</p>
                    <p><i class="fas fa-phone me-3"></i>+91 9876543210</p>
                    <p><i class="fas fa-print me-3"></i>+91 9999999999</p>
                </div>

                <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Follow Us</h5>
                    <a href="https://www.facebook.com/yourusername" target="_blank" rel="noopener noreferrer" aria-label="Facebook">
                        <div class="socialIcon facebook"></div>
                    </a>
                    <a href="https://www.instagram.com/yourusername" target="_blank" rel="noopener noreferrer" aria-label="Instagram">
                        <div class="socialIcon instagram"></div>
                    </a>
                    <a href="https://www.linkedin.com/in/yourusername" target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">
                        <div class="socialIcon linkedin"></div>
                    </a>
                    <a href="https://www.youtube.com/@yourusername" target="_blank" rel="noopener noreferrer" aria-label="YouTube">
                        <div class="socialIcon youtube"></div>
                    </a>
                </div>
            </div>

            <hr class="mb-4" />
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
