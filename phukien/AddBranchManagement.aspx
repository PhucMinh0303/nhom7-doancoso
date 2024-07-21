<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBranchManagement.aspx.cs" Inherits="phukien.AddBranchManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .panel {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .table thead th {
            background-color: #343a40;
            color: #fff;
        }

        .btn-custom {
            background-color: #007bff;
            color: #fff;
        }

            .btn-custom:hover {
                background-color: #0056b3;
                color: #fff;
            }
    </style>
   
     
        
            <div class="container">
                <h2 class="text-center mb-4">Chi nhánh</h2>
                <div class="row mb-3">
                    <div class="col-md-12 text-right">
                        <asp:Button ID="btnAddNew" runat="server" CssClass="btn btn-custom" Text="Thêm địa chỉ" OnClick="btnAddNew_Click" />
                    </div>
                </div>
                <asp:Panel ID="pnlAddEdit" runat="server" CssClass="panel mb-4" Visible="False">
                    <div class="form-group">
                        <asp:Label ID="lblBranchName" runat="server" AssociatedControlID="txtBranchName" CssClass="control-label">Tên chi nhánh</asp:Label>
                        <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control" Placeholder="Nhập tên chi nhánh"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblLocation" runat="server" AssociatedControlID="txtLocation" CssClass="control-label">Địa chỉ</asp:Label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" Placeholder="Nhập địa chỉ"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" CssClass="control-label">Số điện thoại</asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Nhập số điện thoại"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success" Text="Lưu" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-secondary" Text="Hủy" OnClick="btnCancel_Click" />
                    </div>
                </asp:Panel>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="BranchID"
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="BranchID" HeaderText="ID Chi nhánh" ReadOnly="True" />
                        <asp:BoundField DataField="BranchName" HeaderText="Tên chi nhánh" />
                        <asp:BoundField DataField="BranchAddress" HeaderText="Địa chỉ" />
                        <asp:BoundField DataField="BranchPhone" HeaderText="Số điện thoại" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
      
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
         
</asp:Content>
