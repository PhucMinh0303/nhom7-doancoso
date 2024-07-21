<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="phukien.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-image: url('images/nen/nen2.jpg');
            background-size: cover;
            background-position: center;
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
            padding: 40px;
            max-width: 600px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .slideshow-container {
            position: relative;
            width: 100%;
            height: 200px;
            border-radius: 8px;
            overflow: hidden;
        }
        .slideshow-container img {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            animation: slide 20s infinite;
        }
        .slideshow-container img:nth-child(1) {
            animation-delay: 0s;
        }
        .slideshow-container img:nth-child(2) {
            animation-delay: 5s;
        }
        @keyframes slide {
            0% { opacity: 0; }
            25% { opacity: 1; }
            50% { opacity: 1; }
            75% { opacity: 0; }
            100% { opacity: 0; }
        }
        .mycenter h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #00aaff;
        }
        .form-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .form-group label {
            color: #444444;
            margin-right: 10px;
            flex: 1;
        }
        .form-control {
            flex: 2;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #ffffff;
            color: #333333;
        }
        .btn-row {
            display: flex;
            gap: 10px;
        }
        .btn, .btn-link {
            flex: 1;
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
            margin-top: 10px;
        }
        .btn:hover, .btn-link:hover {
            background-color: #0088cc;
        }
        .checkbox {
            margin-bottom: 15px;
            color: #666666;
        }
        .checkbox input {
            margin-right: 5px;
        }
        footer {
            margin-top: 20px;
            text-align: center;
            color: #666666;
            font-size: 14px;
        }
    </style>

    <div class="mycenter">
        <div class="slideshow-container">
            <img src="content/images/poster1.jpg" alt="Poster 1"/>
            <img src="content/images/poster2.jpg" alt="Poster 2"/>
        </div>
        <h2>THÔNG TIN ĐĂNG NHẬP</h2>
        <form method="post" action="/WebForm2">
            <div class="form-group">
                <label for="email">Tài khoản:</label>
                <asp:TextBox type="text" class="form-control" placeholder="Tài khoản" name="email" ID="txtName" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="pwd">Mật khẩu:</label>
                <asp:TextBox type="password" class="form-control" placeholder="Mật khẩu" name="pwd" ID="txtPass" runat="server"></asp:TextBox>
            </div>
            <div class="checkbox">
                <asp:CheckBox ID="chkRemember" runat="server" Text="Ghi nhớ đăng nhập"/>
            </div>
            <div class="btn-row">
                <asp:Button Class="btn btn-default" ID="btLogin" runat="server" Text="Đăng nhập" OnClick="btLogin_Click"/>
                <asp:LinkButton ID="btndki" runat="server" CssClass="btn-link" OnClick="btndki_Click">Đăng ký</asp:LinkButton>
            </div>
        </form
   
</asp:Content>
