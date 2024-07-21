<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="phukien.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Existing styles */
        .cart-list td {
            vertical-align: middle;
        }

        .cart-list img {
            max-width: 100px;
            height: auto;
        }

        .btn-action {
            width: 30px;
            height: 30px;
            font-size: 14px;
            line-height: 1;
            padding: 6px 8px;
            margin-right: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            color: #fff;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }

        .form-group {
            margin-bottom: 15px;
            margin-right:auto;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input[type=text],
        .form-group input[type=number] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-order {
            background-color: #28a745;
            border-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 10px;
            display: block; /* Ensures each button is on a new line */
        }

        .btn-payment {
            background-color: #17a2b8;
            border-color: #17a2b8;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            margin-top: 10px;
            display: block; /* Ensures each button is on a new line */
        }

        /* New styles for DropDownList */
        .form-group select,
        .form-group select:focus,
        .form-group select:hover {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            font-size: 16px;
            color: #495057;
        }

        .form-group select:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .form-group select:hover {
            border-color: #adb5bd;
        }

        .form-group select option {
            padding: 10px;
        }

        /* Additional styles for button spacing */
        .button-group {
            margin-top: 10px;
        }
    </style>

    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div>
                    <h3>Thông tin giao hàng</h3>
                </div>
                <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.CHITIETDONHANG" SelectMethod="GetCart" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">

                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <tr class="cart-list">
                            <td><%#: Item.MASANPHAM %></td>
                            <td><%#: Item.TENSANPHAM %></td>
                            <td>
                                <img style="max-width: 150px; height: auto;" class="card-img-top h-100" src="<%#: Item.DUONGDAN %>" alt="..." /></td>
                            <td><%#: Item.SOLUONG %></td>
                            <td><%#: string.Format("{0:#,###} VNĐ", Item.GIA) %></td>
                            <td><%#: string.Format("{0:#,###} VNĐ", Item.THANHTIEN) %></td>
                            <td>
                                <asp:Button runat="server" ID="BtnDel" Text="X" OnClick="btnDel_Click" CssClass="btn btn-danger btn-action" CommandArgument="<%#: Item.MASANPHAM %>" />
                                <asp:Button runat="server" ID="btnAdd" Text="+" CssClass="btn btn-primary btn-action" OnClick="btnAdd_Click" CommandArgument="<%#: Item.MASANPHAM %>" />
                                <asp:Button runat="server" ID="btnSubtract" Text="-" CssClass="btn btn-warning btn-action" OnClick="btnSubtract_Click" CommandArgument="<%#: Item.MASANPHAM %>" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered" id="groupPlaceholderContainer" runat="server" style="width: 100%">
                            <thead>
                                <tr class="cart-list">
                                    <th>Mã Sản Phẩm</th>
                                    <th>Tên</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="groupPlaceholder"></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

                <div style="font-size: 22px; margin-top: 20px;">
                    <b>Tổng tiền: </b>
                    <asp:Label ID="lbTongThanhToan" runat="server" Text=""></asp:Label>
                </div>
                <br />
            </div>
            

            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5">
                    <div>
                        <div class="form-group">
                            <label for="txtTen">Người nhận:</label>
                            <asp:TextBox type="text" class="form-control" placehoder="Nhập tên người nhận" ID="txtTen" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDT">Số điện thoại:</label>
                            <asp:TextBox type="number" class="form-control" placehoder="Nhập số điện thoại" ID="txtDT" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDC">Nơi giao:</label>
                            <asp:TextBox type="text" class="form-control" placehoder="Nhập địa chỉ giao hàng" ID="txtDC" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlMenu">Phương thức giao hàng:</label>
                            <asp:DropDownList ID="ddlMenu" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMenu_SelectedIndexChanged" CssClass="form-control">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Text="Grab" Value="Grab" />
                                <asp:ListItem Text="Giao hàng tiết kiệm" Value="Giao hàng tiết kiệm" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />

                    <div>
                        <div class="button-group">
                            <asp:Button ID="btncu" runat="server" Text="Thông tin cũ" OnClick="btncu_Click" CssClass="btn btn-secondary btn-order" />
                        </div>
                        <div class="button-group">
                            <asp:Button ID="btnmoi" runat="server" Text="Thông tin mới" OnClick="btnmoi_Click" CssClass="btn btn-secondary btn-order" />
                        </div>
                        <div class="button-group">
                            <asp:Button ID="Button1" runat="server" Text="Đặt Hàng" OnClick="Button1_Click" CssClass="btn btn-success btn-order" />
                        </div>
                        <div class="button-group">
                            <asp:Button ID="ThanhToanOnline" runat="server" Text="Thanh toán online" OnClick="ThanhToanOnline_Click" CssClass="btn btn-info btn-payment" />
                        </div>
                    </div>
                </div>
                
            </div>

                
        </div>
    </section>
</asp:Content>
