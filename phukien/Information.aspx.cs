using phukien.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class Information : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // kiêm tra xem người dùng đăng nhập đúng hay chưa
            if (Session["user"] != null)
            {
                txtTK.Enabled = false;
                txtTen.Enabled = false;
                txtDT.Enabled = false;
                txtDC.Enabled = false;
                txtMK.Enabled = false;
                txtMK2.Enabled = false;
                txtTenMoi.Enabled = false;
                txtSDTMoi.Enabled = false;
                txtDCMoi.Enabled = false;
                var user = dbcontext.KHACHHANGs.FirstOrDefault(u => u.MAKH == Login.name);
                if (user != null)
                {
                    txtTK.Text = user.MAKH;
                    txtTen.Text = user.TENKH;
                    txtDT.Text = user.DIENTHOAI;
                    txtDC.Text = user.DIACHI;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }    
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            txtMK.Enabled = true;
            txtMK2.Enabled = true;
            txtTenMoi.Enabled = true;
            txtSDTMoi.Enabled = true;
            txtDCMoi.Enabled = true;
            var user = dbcontext.KHACHHANGs.FirstOrDefault(u => u.MAKH == Login.name);
            if (user != null)
            {
                txtTenMoi.Text = user.TENKH;
               txtSDTMoi.Text = user.DIENTHOAI;
               txtDCMoi.Text = user.DIACHI;
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.ToString();
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            if (
                string.IsNullOrEmpty(txtTen.Text) ||
                string.IsNullOrEmpty(txtDT.Text) ||
                string.IsNullOrEmpty(txtDC.Text))
            {
                // Thông báo cho người dùng nhập đầy đủ thông tin
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin.');</script>");
                return;
            }

            // Kiểm tra xác nhận mật khẩu

            if (txtDT.Text.Length != 10)
            {
                Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại.');</script>");
                return;
            }

            KHACHHANG kh = dbcontext.KHACHHANGs.First(s => s.MAKH == txtTK.Text);


            kh.TENKH = txtTenMoi.Text;
            kh.DIENTHOAI = txtSDTMoi.Text;
            kh.DIACHI = txtDCMoi.Text;

            if (txtMK.Text.Length > 0 && txtMK2.Text.Length > 0)
            {
                if (dbcontext.KHACHHANGs.Where(s => s.MATKHAU == txtMK.Text).Count() > 0)
                {
                    kh.MATKHAU = txtMK2.Text;
                    if (txtMK.Text != txtMK2.Text)
                    {

                        dbcontext.SaveChanges();

                        Response.Write("<script>alert('Thay đổi thành công!');</script>");
                        Response.Redirect(url);

                    }
                    else
                    {
                        Response.Write("<script>alert('Mật khẩu mới trùng vui lòng nhập lại!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Sai mật khẩu cũ!');</script>");
                }

                // Lấy thông tin thành viên từ cơ sở dữ liệu
            }
            dbcontext.SaveChanges();
            Response.Write("<script>alert('Thay đổi thành công!');</script>");
            Response.Redirect(url);
        }
    }
}
