<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DienTu.aspx.cs" Inherits="phukien.DienTu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <section class="py-5">
     <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
             <asp:ListView ID="ListView1" runat="server" ItemType="phukien.Models.DIENTU" SelectMethod="GetPhone">

                 <EmptyDataTemplate>
                     <table>
                         <tr>
                             <td>No data was returned.</td>
                         </tr>
                     </table>
                 </EmptyDataTemplate>
                 <EmptyItemTemplate>

                     <td />
                 </EmptyItemTemplate>
                 <GroupTemplate>
                     <tr id="itemPlaceholderContainer" runat="server">
                         <td id="itemPlaceholder" runat="server"></td>
                     </tr>
                 </GroupTemplate>
                 <ItemTemplate>
                     <div class="col mb-5">
                         <div class="card h-100">
                             <!-- Product image-->
                             <img class="card-img-top" src="<%#:Item.DUONGDAN%>" alt="..." />
                             <!-- Product details-->
                             <div class="card-body p-4">
                                 <div class="text-center">
                                     <!-- Product name-->
                                     <h5 class="fw-bolder"><%#:Item.TENSANPHAMDT%></h5>
                                     <!-- Product price-->
                                 </div>
                             </div>
                             <!-- Product actions-->
                             <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                 <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ItemDT.aspx?sp=<%#:Item.MASANPHAMDT%>">Xem</a></div>
                             </div>
                         </div>
                     </div>
                 </ItemTemplate>
             </asp:ListView>
         </div>
     </div>
 </section>
</asp:Content>
