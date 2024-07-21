<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BranchList.aspx.cs" Inherits="phukien.BranchList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
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
            <h2 class="text-center mb-4">Danh sách chi nhánh</h2>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="BranchID"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="BranchID" HeaderText="ID Chi nhánh" ReadOnly="True" />
                    <asp:BoundField DataField="BranchName" HeaderText="Tên chi nhánh" />
                    <asp:BoundField DataField="BranchAddress" HeaderText="Địa chỉ" />
                    <asp:BoundField DataField="BranchPhone" HeaderText="Số điện thoại" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <div class="text-right mt-4">
                <asp:Button ID="btnAddNew" runat="server" CssClass="btn btn-custom" Text="Thêm chi nhánh" OnClick="btnAddNew_Click" />
            </div>
        </div>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


</asp:Content>
