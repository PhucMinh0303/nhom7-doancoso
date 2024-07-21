<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Item.aspx.cs" Inherits="phukien.Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <asp:FormView ID="productDetail" runat="server" ItemType="phukien.Models.SANPHAM" SelectMethod="GetDetails" RenderOuterTable="false">
                        <ItemTemplate>
                            <img class="img-fluid rounded mb-4 mb-lg-0" src="<%#: Item.DUONGDAN %>" alt="<%#: Item.TENSANPHAM %>" />
                        </ItemTemplate>
                    </asp:FormView>
                </div>
                <div class="col-lg-6">
                    <asp:FormView ID="FormView1" runat="server" ItemType="phukien.Models.SANPHAM" SelectMethod="GetDetails" RenderOuterTable="false">
                        <ItemTemplate>
                            <h1 class="display-5 fw-bolder"><%#: Item.TENSANPHAM %></h1>
                            <p class="lead"><%#: Item.MOTA %></p>
                            <div class="mb-3">
                                <span class="text-muted">Hãng sản xuất:</span>
                                <span><%#: Item.HANGSANXUAT.TENHANGSANXUAT %></span>
                            </div>
                            <div class="mb-3">
                                <span class="text-muted">Thể loại:</span>
                                <span><%#: Item.LOAIPHUKIEN.TENLOAIPHUKIEN %></span>
                            </div>
                            <div class="mb-3">
                                <span class="text-muted">Giá:</span>
                                <!-- Product price -->
                                <span class="text-muted"> <%#: string.Format("{0:#,##0} VNĐ", Item.GIA) %></span>

                            </div>
                            <asp:Button ID="Button1" runat="server" Text="Thêm vào giỏ hàng" OnClick="AddToCart_Click" CssClass="btn btn-outline-dark" />
                            <i class="bi-cart-fill me-1"></i>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </section>

    <!-- Related items section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="fw-bolder mb-4">Sản phẩm khác</h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.SANPHAM" SelectMethod="GetPhones">
                    <EmptyDataTemplate>
                        <div class="col">
                            <p>No data was returned.</p>
                        </div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <img src="<%#: Item.DUONGDAN %>" class="card-img-top" alt="<%#: Item.TENSANPHAM %>" />
                                <div class="card-body">
                                    <h5 class="card-title"><%#: Item.TENSANPHAM %></h5>
                                    <p class="card-text">Hãng sản xuất: <%#: Item.HANGSANXUAT.TENHANGSANXUAT %></p>
                                    <p class="card-text">Loại: <%#: Item.LOAIPHUKIEN.TENLOAIPHUKIEN %></p>
                                    <p class="card-text">Giá:<%#: string.Format("{0:#,##0} VNĐ", Item.GIA) %></p>
                                    <a class="btn btn-outline-dark mt-auto" href="item.aspx?sp=<%#: Item.MASANPHAM %>">Xem</a>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </section>
</asp:Content>
