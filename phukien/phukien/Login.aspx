<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="phukien.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
        <style>
            .mycenter {
                float: left;
                margin-left: 33%;
            }
        </style>


        <div class="container mycenter">
            <h2>THÔNG TIN ĐĂNG NHẬP</h2>
            <form method="post" action="/WebForm2">
                <div class="form-group">
                    <label for="email">Tài khoản:</label>

                    <asp:TextBox type="text" class="form-control" placeholder="Tài khoản"
                        name="email" ID="txtName" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="pwd">Mật khẩu:</label>

                    <asp:TextBox type="password" class="form-control" placeholder="Mật khẩu"
                        name="pwd" ID="txtPass" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:CheckBox ID="chkRemember" runat="server" Text="Ghi nhớ đăng nhập" />
                </div>

                <asp:Button Class="btn btn-default" ID="btLogin" runat="server" Text="Đăng nhập"
                    OnClick="btLogin_Click" />
                <asp:LinkButton ID="btndki" runat="server" OnClick="btndki_Click">Đăng ký</asp:LinkButton>

            </form>
        </div>
    </asp:Content>
