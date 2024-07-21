using phukien.Help;
using phukien.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace phukien
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra và hiển thị nút "Quản trị" nếu người dùng là admin
            bool admin = true; // Ví dụ: bạn cần lấy từ session hoặc cơ sở dữ liệu
            btDuyet.Visible = admin;

            // Hiển thị số lượng trong giỏ hàng
            var lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            Helper helper = new Helper();
            lbCart.Text = helper.TongSoLuong(lstGioHang).ToString();
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ddlMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlMenu.SelectedValue;

            // Xử lý dựa trên giá trị đã chọn
            switch (selectedValue)
            {
                case "profile":
                    Response.Redirect("Information.aspx");
                    break;
                case "history":
                    Response.Redirect("History.aspx");
                    break;
                case "logout":
                    Session.Clear();
                    Session.Abandon();
                    Response.Redirect("Login.aspx");
                    break;
                default:
                    break;
            }
        }

        protected void btDuyet_Click(object sender, EventArgs e)
        {
            // Xử lý khi người dùng nhấn nút "Quản trị"
            Response.Redirect("Admin.aspx");
        }
    }
}
