<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="lms_1.resetpassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Reset Password</title>
    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('background_img.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .glass-card {
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

        .form-control {
            background-color: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }

            .form-control::placeholder {
                color: black;
            }

        .form-label {
            color: white;
        }

        .btn-primary {
            width: 100%;
            font-weight: bold;
            margin-top: 15px;
            background-color: #1d3557;
            border: none;
        }

        .alert {
            margin-top: 15px;
        }
    </style>

</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
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
    <form id="form1" runat="server">
        <!-- Reset Form Panel -->
        <asp:Panel ID="pnlResetForm" runat="server" Visible="true">
            <div class="glass-card text-center">
                <div class="mb-4">
                    <h2><i class="fas fa-lock text-dark me-2"></i>Reset Password</h2>
                </div>
                <asp:Panel ID="errorAlert" runat="server" Visible="false"
                    CssClass="alert alert-danger alert-dismissible fade show" role="alert">
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>
                <!-- New Password -->
                <div class="text-start">
                    <label class="form-label">New Password:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Password"
                            placeholder="Enter new password" />
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="text-start">
                    <label class="form-label">Confirm Password:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password"
                            placeholder="Confirm password" />
                    </div>
                </div>

                <!-- Buttons -->
                <asp:Button ID="Button1" runat="server" Text="🔁 Reset Password" CssClass="btn btn-primary mt-3"
                    OnClick="btnReset_Click" />
                <a href="login.aspx" class="btn btn-secondary w-100 mt-3">Back</a>

                <!-- Message -->
                <asp:Label ID="lblReset" runat="server" CssClass="alert alert-info text-center d-block" Visible="false">
                </asp:Label>
            </div>
        </asp:Panel>

        <!-- Success Panel -->
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
            <div class="glass-card text-center">
                <div class="mb-3 text-success" style="font-size: 3rem;">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h4 class="fw-bold text-success">Password Reset Successfully!</h4>
                <p class="text-muted">You can now log in with your credentials.</p>
                <a href="login.aspx" class="btn btn-success w-100 mt-3">
                    <i class="fas fa-sign-in-alt me-2"></i>Go to Login
                </a>
            </div>
        </asp:Panel>
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
    <!-- Bootstrap & JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>

</body>

</html>
