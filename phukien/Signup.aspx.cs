using System;
using System.Linq;
using System.Web.UI;
using phukien.Models;

namespace phukien
{
    public partial class Signup : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra xem các trường thông tin đã được nhập đủ hay chưa 
                if (string.IsNullOrEmpty(txtTK.Text) ||
                    string.IsNullOrEmpty(txtMK.Text) ||
                    string.IsNullOrEmpty(txtMK2.Text) ||
                    string.IsNullOrEmpty(txtTen.Text) ||
                    string.IsNullOrEmpty(txtDC.Text) ||
                    string.IsNullOrEmpty(txtDT.Text))
                {
                    // Thông báo cho người dùng nhập đầy đủ thông tin 
                    Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin.');</script>");
                    return;
                }

                // Kiểm tra xác nhận mật khẩu 
                if (txtMK.Text != txtMK2.Text)
                {
                    Response.Write("<script>alert('Mật khẩu không khớp.');</script>");
                    return;
                }

                // Kiểm tra số điện thoại hợp lệ
                if (txtDT.Text.Length < 10 || txtDT.Text.Length > 11 || !txtDT.Text.All(char.IsDigit))
                {
                    Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại.');</script>");
                    return;
                }

                // Kiểm tra xem tài khoản đã tồn tại chưa
                if (dbcontext.KHACHHANGs.Any(s => s.MAKH == txtTK.Text))
                {
                    Response.Write("<script>alert('Tài khoản đã tồn tại.');</script>");
                    return;
                }

                // Tạo mới đối tượng khách hàng và thêm vào cơ sở dữ liệu 
                KHACHHANG kHACHHANG = new KHACHHANG
                {
                    MAKH = txtTK.Text,
                    MATKHAU = txtMK.Text, // Băm mật khẩu trước khi lưu (nếu cần)
                    TENKH = txtTen.Text,
                    DIENTHOAI = txtDT.Text,
                    DIACHI = txtDC.Text,
                    CAP = "PERSON",
                };

                dbcontext.KHACHHANGs.Add(kHACHHANG);
                dbcontext.SaveChanges();

                Response.Write("<script>alert('Đăng ký thành công!');</script>");
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
            }
        }

    }
}
