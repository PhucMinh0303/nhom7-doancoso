<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddManagerAccount.aspx.cs" Inherits="phukien.AddManagerAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* CSS để tạo layout và style cho giao diện */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            border: none;
            border-radius: 8px;
        }
        .card-body {
            padding: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn-success {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        .btn-success:hover {
            background-color: #45a049;
        }
        .text-center {
            text-align: center;
        }
    </style>

    <div class="container">
        <h2 class="text-center">Thêm người dùng quản trị </h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="txtTenAdmin">Tên Quản Trị Viên:</label>
                            <asp:TextBox ID="txtTenAdmin" runat="server" CssClass="form-control" placeholder="Nhập tên quản trị viên"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Mật Khẩu:</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Nhập mật khẩu"></asp:TextBox>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <asp:Button ID="btnQuay" runat="server" Text="Quay Lại" CssClass="btn btn-success" OnClick="btnQuay_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
