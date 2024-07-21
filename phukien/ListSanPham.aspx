<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListSanPham.aspx.cs" Inherits="phukien.ListSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Custom styles for the product list */
.cart-list img {
    max-width: 100px;
    height: auto;
}

.table thead th {
    background-color: #343a40;
    color: #fff;
}

.table tbody tr:hover {
    background-color: #f8f9fa;
}

.alert-warning {
    margin-top: 20px;
}

.mb-3 {
    margin-bottom: 1rem !important;
}

.mt-4 {
    margin-top: 1.5rem !important;
}

.text-center {
    text-align: center !important;
}

.btn-sm {
    font-size: 0.875rem;
    padding: 0.25rem 0.5rem;
}

    </style>
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center mb-4">
                <div class="col-md-12">
                    <asp:TextBox type="text" class="form-control mb-3" placeholder="Tên sản phẩm" ID="txtFind" runat="server" OnTextChanged="txtFind_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
            </div>
            <div class="row gx-4 gx-lg-5 align-items-center">
                <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.SANPHAM" SelectMethod="GetSANPHAMs" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" AllowPaging="true" PageSize="8">
                    <EmptyDataTemplate>
                        <div class="alert alert-warning">No data was returned.</div>
                    </EmptyDataTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <tr class="cart-list">
                            <td><asp:Label ID="lblMaSanPham" runat="server" Text='<%# Item.MASANPHAM %>' CssClass="badge badge-secondary"></asp:Label></td>
                            <td><%# Item.TENSANPHAM %></td>
                            <td><img style="width: 150px" class="card-img-top h-100" src="<%# Item.DUONGDAN %>" alt="..." /></td>
                            <td><%#: string.Format("{0:#,##0} VNĐ", Item.GIA) %></td>
                            <td><%# Item.MOTA %></td>
                            <td><%# Item.HANGSANXUAT.TENHANGSANXUAT %></td>
                            <td><%# Item.LOAIPHUKIEN.TENLOAIPHUKIEN %></td>
                            <td><asp:Button runat="server" ID="btnDel" Text="X" CssClass="btn btn-danger btn-sm" OnClick="btnDel_Click" /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered table-striped" id="groupPlaceholderContainer" runat="server" style="width: 100%">
                            <thead class="thead-dark">
                                <tr class="cart-list">
                                    <th>Mã sản phẩm</th>
                                    <th>Tên</th>
                                    <th>Ảnh</th>
                                    <th>Giá</th>
                                    <th>Mô tả</th>
                                    <th>Hãng Sản Xuất</th>
                                    <th>Loại Phụ Kiện</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="groupPlaceholder"></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

                <!-- DataPager for Paging -->
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="8" class="d-flex justify-content-center mt-3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowPreviousPageButton="True" ShowNextPageButton="False" ShowLastPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="True" ShowLastPageButton="True" ShowFirstPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
            <div class="text-center mt-4">
                <asp:Button runat="server" ID="btnAdd" OnClick="btnAdd_Click" Text="Thêm sản phẩm" CssClass="btn btn-primary" />
            </div>
        </div>
    </section>
</asp:Content>
