<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookcollection.aspx.cs" Inherits="lms_1.bookcollection" %>

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

        .category-list {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .book-card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: 0.3s ease;
        }

        .book-card:hover {
            transform: translateY(-5px);
        }

        .book-cover {
            height: 200px;
            object-fit: cover;
        }

        .book-title {
            font-weight: bold;
        }
    </style>
    <style>
        #txtSearch {
    border-radius: 10px;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ced4da;
}

#btnSearch {
    border-radius: 10px;
    font-weight: 500;
}
</style>
    

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Library Logo" width="40" class="me-2" />
                <strong>LIBRARY</strong>
            </a>
            <%--<form class="d-flex ms-3 flex-grow-1" role="search">
                <input class="form-control me-2 w-100" type="search" placeholder="Search books..." aria-label="Search">
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
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Services</a>
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
    <form id="form1" runat="server">
        <div class="container mt-5">
                        <!-- Search Bar -->
<div class="mb-4 d-flex justify-content-between align-items-center">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control w-100 me-3" placeholder="🔍 Search by name, author, or category..." />
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary px-5" OnClick="btnSearch_Click" />
</div>
            <div class="row">
                <!-- Category Section -->
                <div class="col-md-3">
                    <div class="category-list">
                        <h5 class="mb-3 text-primary"><i class="fa fa-filter"></i> Categories</h5>
                        <asp:Repeater ID="rptCategories" runat="server">
                            <ItemTemplate>
                                <div class="form-check">
                                    <asp:LinkButton ID="lnkCategory" runat="server" CssClass="form-check-label text-dark" CommandArgument='<%# Eval("book_category") %>' OnCommand="CategorySelected">
                                        <i class="fas fa-book me-1 text-warning"></i><%# Eval("book_category") %>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Books Display Section -->
                <div class="col-md-9">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <asp:Repeater ID="rptBooks" runat="server">
                            <ItemTemplate>
                                <div class="col">
                                    <div class="card book-card">
                                        <img src="bookCover.jpg" class="card-img-top book-cover" alt="Book Cover">
                                        <div class="card-body">
                                            <h6 class="card-title book-title"><%# Eval("book_name") %></h6>
                                            <p class="card-text">
                                                <strong>Author:</strong> <%# Eval("author_name") %><br />
                                                <strong>Category:</strong> <%# Eval("book_category") %><br />
                                                <strong> Lang Code:</strong> <%#Eval("lang_code") %><br />
                                                <strong>Available:</strong> <%# Eval("count") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <!-- Pagination Buttons (outside Repeater) -->
<div class="d-flex justify-content-center col-12 my-3">
    <asp:LinkButton ID="btnPrevious" runat="server" CssClass="btn btn-outline-primary me-2" OnClick="btnPrevious_Click">Previous</asp:LinkButton>
    <asp:Label ID="book_list" runat="server" CssClass="mx-2 fw-bold" />
    <asp:LinkButton ID="btnNext" runat="server" CssClass="btn btn-outline-primary ms-2" OnClick="btnNext_Click">Next</asp:LinkButton>
</div>

            </div>
        </div>

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
    </form>
<%--    javascript Code For Search--%>
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var searchBox = document.getElementById('<%= txtSearch.ClientID %>');
        searchBox.addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                document.getElementById('<%= btnSearch.ClientID %>').click();
            }
        });
    });
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
