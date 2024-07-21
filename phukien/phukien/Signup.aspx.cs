using System;
using System.Linq;
using System.Web.UI;
using phukien.Models;

namespace phukien
{
    public partial class SignIn : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOPEntities1 dbcontext = new QL_BANPHUKIENLAPTOPEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtTK.Text) ||
                    string.IsNullOrEmpty(txtMK.Text) ||
                    string.IsNullOrEmpty(txtMK2.Text) ||
                    string.IsNullOrEmpty(txtTen.Text) ||
                    string.IsNullOrEmpty(txtDT.Text) ||
                    string.IsNullOrEmpty(txtDC.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng điền đầy đủ thông tin.');", true);
                    return;
                }

                if (txtMK.Text != txtMK2.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mật khẩu không khớp.');", true);
                    return;
                }

                if (txtDT.Text.Length != 10)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Vui lòng nhập đúng số điện thoại.');", true);
                    return;
                }

                if (dbcontext.KHACHHANGs.Any(s => s.MAKH == txtTK.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Tài khoản đã tồn tại.');", true);
                    return;
                }

                KHACHHANG newCustomer = new KHACHHANG
                {
                    MAKH = txtTK.Text,
                    MATKHAU = txtMK.Text,
                    TENKH = txtTen.Text,
                    DIENTHOAI = txtDT.Text,
                    DIACHI = txtDC.Text
                };

                dbcontext.KHACHHANGs.Add(newCustomer);
                dbcontext.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng ký thành công.');", true);
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Đã xảy ra lỗi: {ex.Message}');", true);
            }
        }
    }

}

