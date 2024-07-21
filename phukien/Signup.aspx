<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="phukien.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #ffffff; /* Bright background color */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .mycenter {
            padding: 20px; /* Reduced padding */
            max-width: 400px; /* Reduced max width */
            width: 100%;
            background-color: #f0f0f0; /* Light background color */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .mycenter img {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .mycenter h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #00aaff;
        }
        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            color: #333333; /* Darker label color for contrast */
            margin-bottom: 5px;
        }
        .form-control {
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #ffffff;
            color: #333333;
            width: 100%;
            display: inline-block;
        }
        .label-inline {
            display: inline-block;
            width: 30%; /* Adjust the width as needed */
            margin-right: 10px; /* Adjust the spacing between label and input */
        }
        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #00aaff;
            color: #ffffff;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            display: block;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #0088cc;
        }
        footer {
            margin-top: 20px;
            text-align: center;
            color: #666666;
            font-size: 14px;
        }
    </style>

    <div class="mycenter">
        <img src="images/poster/poster1.jpg" alt=""/>
        <h2>THÔNG TIN ĐĂNG NHẬP</h2>
        <form method="post" action="/WebForm2">
            <div class="form-group">
                <label for="txtTK">Tài khoản:</label>
                <asp:TextBox type="text" class="form-control" placeholder="Tài khoản" ID="txtTK" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMK">Mật khẩu:</label>
                <asp:TextBox class="form-control" placeholder="Mật khẩu" ID="txtMK" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMK2">Nhập lại mật khẩu:</label>
                <asp:TextBox class="form-control" placeholder="Nhập lại mật khẩu" ID="txtMK2" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtTen">Họ và tên:</label>
                <asp:TextBox type="text" class="form-control" placeholder="Họ và tên" ID="txtTen" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDT" class="label-inline">Số điện thoại:</label>
                <asp:TextBox type="number" class="form-control" placeholder="Số điện thoại" ID="txtDT" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDC">Địa chỉ:</label>
                <asp:TextBox type="text" class="form-control" placeholder="Địa chỉ" ID="txtDC" runat="server"></asp:TextBox>
            </div>
            <asp:Button CssClass="btn" ID="btnSignup" runat="server" Text="Đăng ký" OnClick="btnSignup_Click" />
        </form>
    </div>
</asp:Content>
