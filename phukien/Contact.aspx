<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="phukien.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
   .contact-info {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
}

.contact-info h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    font-size: 2em;
}

.contact-info address {
    font-size: 1.1em;
    line-height: 1.6;
}

.contact-info address strong {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    font-size: 1.2em;
}

.contact-info address span {
    display: inline-block;
    margin-bottom: 5px;
    margin-left: 20px;
}

.social-media {
    text-align: center;
    margin-top: 20px;
}

.social-media a {
    display: inline-block;
    margin: 0 10px;
    color: #007bff;
    font-size: 1.2em;
    text-decoration: none;
}

.social-media a:hover {
    color: #0056b3;
}

.google-map {
    margin-top: 20px;
}
        </style>

<div class="contact-info">
    <h2>Thông tin liên hệ</h2>

    <address>
        <strong style="text-align: center; display: block; margin-bottom: 10px;">Tên shop: <span style="color: #007bff;">Shop phụ kiện </span></strong>
        <strong>Thành viên:</strong>
        <span>Hồ Đắc Thịnh</span>
        <span>Hà Duy Bình</span>
        <span>Van Minh Phúc</span><br />
        <strong>Địa chỉ:</strong> 136 Nguyễn Trãi<br />
        <abbr title="Phone">Điện thoại:</abbr> 0903063916
    </address>

    <address>
        <strong>Email Hỗ trợ:</strong> <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Email Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>

    <div class="social-media">
        <strong>Kết nối với chúng tôi:</strong><br />
        <a href="https://www.facebook.com/dacthinh.ho.1" target="_blank">Facebook</a>
        <a href="mailto:dacthinho0312@gmail.com">Email</a>
        <a href="tel:+840903063916">Điện thoại</a>
    </div>
</div>

<!-- Google Map nhúng mã -->
<div class="google-map">
    <iframe
        width="100%"
        height="400"
        frameborder="0" style="border: 0"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.078036458142!2d106.6603784!3d10.7532842!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ef6ca551517%3A0xc331bdcaa0992e4b!2s736%20%C4%90.%20Nguy%E1%BB%85n%20Tr%E1%BA%A3i%2C%20Ph%C6%B0%E1%BB%9Dng%2011%2C%20Qu%E1%BA%ADn%205%2C%20Th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh%2C%20Vi%E1%BB%87t%20Nam!5e0!3m2!1svi!2s!4v1623800886651!5m2!1svi!2s"
        allowfullscreen></iframe>
</div>

</asp:Content>
