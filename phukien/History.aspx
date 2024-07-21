<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="phukien.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .cart-list th, .cart-list td {
            text-align: center;
            vertical-align: middle;
        }
        .cart-list img {
            border-radius: 8px;
            transition: transform 0.2s;
        }
        .cart-list img:hover {
            transform: scale(1.1);
        }
        .table-bordered {
            border: 2px solid #dee2e6;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #dee2e6;
        }
        .data-pager {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .data-pager button {
            margin: 0 5px;
        }
    </style>
   
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.CHITIETDONHANG" SelectMethod="GetList"
                    AllowPaging="true" PageSize="4">
                    <EmptyDataTemplate>
                        <table class="table">
                            <tr>
                                <td>Không có dữ liệu được trả về.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr class="cart-list">
                            <td><%# Item.TENSANPHAM %></td>
                            <td>
                                <img style="width: 150px" class="card-img-top h-100" src="<%# Item.DUONGDAN %>" alt="..." />
                            </td>
                            <td><%# Item.SOLUONG %></td>
                            <td><%# string.Format("{0:#,##0} VNĐ", Item.GIA) %></td>
                            <td><%# string.Format("{0:#,##0} VNĐ", Item.THANHTIEN) %></td>
                           
                            <td><%# Item.DONHANG.NGAYDAT %></td>
                             <td><%# Item.DONHANG.NGAYGIAO %></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered" id="groupPlaceholderContainer" runat="server" style="width: 100%">
                            <thead>
                                <tr class="cart-list">
                                    <th>Tên sản phẩm</th>
                                    <th>Ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th>Ngày đặt</th>
                                    <th>Ngày giao</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="itemPlaceholder" runat="server"></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>

                <!-- DataPager for Paging -->
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="4" class="data-pager">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowPreviousPageButton="True"
                            ShowNextPageButton="False" ShowLastPageButton="False" />
                        <asp:NumericPagerField ButtonType="Button" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="True" ShowLastPageButton="True"
                            ShowFirstPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>

            </div>
        </div>
    </section>
</asp:Content>
