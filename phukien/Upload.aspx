<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="phukien.Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
           
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
    <div class="container">
        <h2 class="text-center">Thông tin sản phẩm</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="fileUpload">Chọn Ảnh:</label>
                    <asp:FileUpload ID="fileUpload" runat="server" onchange="previewImage(event)" class="form-control-file" />
                   
                </div>
                <div class="form-group">
                    <label for="txtTenSP">Tên sản phẩm:</label>
                    <asp:TextBox type="text" class="form-control" placeholder="Tên sản phẩm" ID="txtTenSP" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtGia">Giá:</label>
                    <asp:TextBox type="number" class="form-control" placeholder="Giá" ID="txtGia" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMT">Mô tả:</label>
                    <asp:TextBox type="text" class="form-control" placeholder="Mô tả" ID="txtMT" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtML">Mã Loại:</label>
                    <asp:TextBox type="text" class="form-control" placeholder="Mã Loại" ID="txtML" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtHSX">Hãng Sản Xuất:</label>
                    <asp:TextBox type="text" class="form-control" placeholder="Hãng Sản Xuất" ID="txtHSX" runat="server"></asp:TextBox>
                </div>
                <asp:Button Class="btn btn-primary" ID="btnAdd" runat="server" Text="Thêm" OnClick="btnAdd_Click" />
            </div>
        </div>
    </div>
</asp:Content>
