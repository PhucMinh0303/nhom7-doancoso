<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Information.aspx.cs" Inherits="phukien.Information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #007bff;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            font-size: 16px;
        }

       

        table {
            width: 100%;
            border-spacing: 0 10px;
        }

        td {
            vertical-align: top;
        }
    </style>

    <div class="container">
        <h2>THÔNG TIN CÁ NHÂN</h2>
        <form method="post" action="/WebForm2">
            <table>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="txtTK">Tài khoản:</label>
                            <asp:TextBox type="text" class="form-control" placeholder="Enter email"
                                name="email" ID="txtTK" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="txtTen">Họ và tên:</label>
                            <asp:TextBox type="text" class="form-control" placeholder="Họ và tên"
                                name="email" ID="txtTen" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDT">Số điện thoại:</label>
                            <asp:TextBox type="number" class="form-control" placeholder="Số điện thoại"
                                name="email" ID="txtDT" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDC">Địa chỉ:</label>

                            <asp:TextBox type="text" class="form-control" placeholder="Địa chỉ"
                                name="email" ID="txtDC" runat="server"></asp:TextBox>
                        </div>
                        <div class="btn-container">
                            <asp:Button Class="btn btn-default" ID="btnSua" runat="server" Text="Sửa"
                                OnClick="btnSua_Click" CssClass="btn" />
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="txtMK">Mật khẩu:</label>
                            <asp:TextBox class="form-control" placeholder="Mật khẩu"
                                ID="txtMK" runat="server" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="txtMK2">Mật khẩu mới:</label>
                            <asp:TextBox class="form-control" placeholder="Mật khẩu mới"
                                ID="txtMK2" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtTenMoi">Họ và tên:</label>
                            <asp:TextBox type="text" class="form-control" placeholder="Họ và tên"
                                name="email" ID="txtTenMoi" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtSDTMoi">Số điện thoại:</label>
                            <asp:TextBox type="number" class="form-control" placeholder="Số điện thoại"
                                name="email" ID="txtSDTMoi" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDCMoi">Địa chỉ:</label>
                            <asp:TextBox type="text" class="form-control" placeholder="Địa chỉ"
                                name="email" ID="txtDCMoi" runat="server"></asp:TextBox>
                        </div>
                        <div class="btn-container">
                            <asp:Button Class="btn btn-default" ID="btnChange" runat="server" Text="Thay đổi"
                                OnClick="btnChange_Click" CssClass="btn" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
