<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerRevenue.aspx.cs" CodeBehind="ManagerRevenue.aspx.cs" Inherits="phukien.ManagerRevenue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản lý doanh thu</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Quản lý doanh thu</h1>
            <asp:GridView ID="GridViewRevenue" runat="server" AutoGenerateColumns="false" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="NgayGiao" HeaderText="Ngày Giao" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="TongDoanhThu" HeaderText="Tổng Doanh Thu" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Trạng Thái">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Convert.ToBoolean(Eval("DaGiao")) ? "Đã giao" : "Chưa giao" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" />
                </Columns>
            </asp:GridView>
            <hr />
            <asp:Label ID="lblOrderIdLabel" runat="server" Text="Nhập ID đơn hàng cần cập nhật:" AssociatedControlID="txtOrderId"></asp:Label>
            <asp:TextBox ID="txtOrderId" runat="server"></asp:TextBox>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </div>
    </form>
</body>
</html>
