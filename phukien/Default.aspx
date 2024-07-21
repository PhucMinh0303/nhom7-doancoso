<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="phukien._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Include Bootstrap JS and its dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <header class="bg-dark py-5" style="background-image:url(images/nen/nen2.jpg);">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">Phụ kiện máy tính</h1>
                <p class="lead fw-normal text-white-50 mb-0">Shop phụ kiện lap top </p>
            </div>
        </div>


        <!-- Dropdown for selecting product category -->
        <div class="container text-center">
            <asp:DropDownList ID="ddlLoaiSanPham" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlLoaiSanPham_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </header>

    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.SANPHAM" SelectMethod="GetSANPHAMs">
                    <EmptyDataTemplate>
                        <div class="alert alert-warning" role="alert">
                            No data was returned.
                        </div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image carousel -->
                                <div id="carousel<%#: Item.MASANPHAM %>" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100" src="<%#: Item.DUONGDAN %>" alt="Product image" />
                                        </div>
                                        <!-- Add more carousel items here if needed -->
                                    </div>
                                    <a class="carousel-control-prev" href="#carousel<%#: Item.MASANPHAM %>" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carousel<%#: Item.MASANPHAM %>" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                                <!-- Product details -->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name -->
                                        <h5 class="fw-bolder"><%#: Item.TENSANPHAM %></h5>

                                        <!-- Product price -->
                                        <span class="text-muted">Giá: <%#: FormatCurrency(Item.GIA) %></span>


                                    </div>
                                </div>
                                <!-- Product actions -->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a class="btn btn-outline-dark mt-auto" href="item.aspx?sp=<%#: Item.MASANPHAM %>">Xem</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
</asp:Content>
