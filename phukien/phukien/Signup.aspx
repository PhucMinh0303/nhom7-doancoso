<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="phukien.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .mycenter {
            float: left;
            margin-left: 33%;
        }
    </style>

    <div class="container mycenter">
        <h2>THÔNG TIN ĐĂNG NHẬP</h2>
        <div class="form-group">
            <label for="email">Tài khoản:</label>
            <asp:TextBox type="text" class="form-control" placeholder="Tài khoản" name="email" ID="txtTK" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="pwd">Mật khẩu:</label>
            <asp:TextBox class="form-control" placeholder="Mật khẩu" ID="txtMK" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="pwd">Nhập lại mật khẩu:</label>
            <asp:TextBox class="form-control" placeholder="Nhập lại mật khẩu" ID="txtMK2" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email">Họ và tên:</label>
            <asp:TextBox type="text" class="form-control" placeholder="Họ và tên" name="email" ID="txtTen" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email">Số điện thoại</label>
            <asp:TextBox type="number" class="form-control" placeholder="Số điện thoại" name="email" ID="txtDT" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="email">Địa chỉ:</label>
            <asp:TextBox type="text" class="form-control" placeholder="Địa chỉ" name="email" ID="txtDC" runat="server"></asp:TextBox>
        </div>

      <asp:Button class="btn btn-default" ID="btnSignup" runat="server" Text="Đăng ký" OnClick="btnSignup_Click" />


    </div>
</asp:Content>
