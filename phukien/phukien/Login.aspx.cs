using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;

namespace phukien
{
    public partial class Login : System.Web.UI.Page
    {
        public static string name;

        private QL_BANPHUKIENLAPTOPEntities1 dbcontext = new QL_BANPHUKIENLAPTOPEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserInfo"] != null)
                {
                    HttpCookie cookie = Request.Cookies["UserInfo"];
                    txtName.Text = cookie["Username"];
                    txtPass.Attributes["value"] = cookie["Password"];
                    chkRemember.Checked = true;
                }
            }

            if (Session["User"] != null && (bool)Session["User"])
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btndki_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string username = txtName.Text.Trim();
            string password = txtPass.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Vui lòng nhập tên người dùng và mật khẩu.');</script>");
                return;
            }

            var user = dbcontext.KHACHHANGs.FirstOrDefault(u => u.MAKH == username && u.MATKHAU == password);

            if (user != null)
            {
                // Nếu tìm thấy người dùng, tạo session và chuyển hướng đến trang chính
                if (chkRemember.Checked)
                {
                    // Tạo một cookie để lưu thông tin đăng nhập
                    HttpCookie cookie = new HttpCookie("UserInfo");
                    cookie["Username"] = username;
                    cookie["Password"] = password;
                    cookie.Expires = DateTime.Now.AddMonths(1); // thời gian hết hạn sau 1 tháng 
                    Response.Cookies.Add(cookie);
                }
                Session["User"] = true;
                Response.Redirect("Default.aspx");
            }
            else
            {
                // Nếu không tìm thấy người dùng, hiển thị thông báo lỗi
                Response.Write("<script>alert('Sai tài khoản hoặc mật khẩu');</script>");
            }
        }
    }
}
