<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReadFile.aspx.cs" Inherits="phukien.ReadFile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html>
<head>
    <title>PDF Viewer</title>
</head>
<body>
    <iframe src="<%= Teptindientu %>" width="100%" height="900px"></iframe>
</body>
</html>
</asp:Content>
