<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagerAccount.aspx.cs" Inherits="phukien.ManagerAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* CSS để tạo layout và style cho giao diện */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-danger {
            background-color: #f44336;
        }
        .btn-danger:hover {
            background-color: #da190b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
    <script>
        function confirmDelete(maAdmin) {
            return confirm('Bạn có chắc chắn muốn xóa quản trị viên này?');
        }
    </script>

    <div class="container">
        <h2>Quản Lý Tài Khoản Quản Trị</h2>
        <div class="form-group">
            <label for="searchKeyword">Tìm Kiếm:</label>
            <asp:TextBox ID="searchKeyword" runat="server" CssClass="form-control" placeholder="Nhập Từ Khóa"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm Kiếm" CssClass="btn" OnClick="btnSearch_Click" />
        </div>
        <asp:GridView ID="managerAccountTable" runat="server" AutoGenerateColumns="False" CssClass="table table-striped"
            DataKeyNames="MA_ADMIN" OnRowEditing="managerAccountTable_RowEditing" OnRowDeleting="managerAccountTable_RowDeleting">
            <Columns>
                <asp:BoundField DataField="MA_ADMIN" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="TEN_ADMIN" HeaderText="Tên" />
                <asp:BoundField DataField="MATKHAU" HeaderText="Mật khẩu" />
                <asp:TemplateField HeaderText="Hành Động">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" Text="Sửa" CommandName="Edit" CausesValidation="False" OnClick="btnEdit_Click" />
                        <asp:LinkButton ID="btnDelete" runat="server" Text="Xóa" CommandName="Delete" CausesValidation="False" OnClick="btnDelete_Click"
                            CommandArgument='<%# Eval("MA_ADMIN") %>' OnClientClick="return confirmDelete();" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div>
            <asp:Button ID="btnAdd" runat="server" Text="Thêm Mới" CssClass="btn" OnClick="btnAdd_Click" />
        </div>
    </div>
</asp:Content>
