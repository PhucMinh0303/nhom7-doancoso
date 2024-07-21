using phukien.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class Login : System.Web.UI.Page
    {
        public static string name;
        public static string userString;

        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            name = txtName.Text;
            chkRemember.Checked = false;
            if (Session["user"] != null)
            {
                Response.Redirect("Default.aspx");
            }
            if (Response.Cookies["UserInfo"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserInfo"];
            }               
        }

        protected void btndki_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string username = txtName.Text;
            string password = txtPass.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Vui lòng nhập tên người dùng và mật khẩu.');</script>");
                return;
            }
            
            var user = dbcontext.KHACHHANGs.FirstOrDefault(u => u.MAKH == username &&  u.MATKHAU == password);
            var admin = dbcontext.ADMINs.FirstOrDefault(s => s.MA_ADMIN == username && s.MATKHAU == password);
            if (user != null|| admin!=null)
            {
                if (chkRemember.Checked)
                {
                    //tạo một cookie để lưu thông tin đăng nhập 
                    HttpCookie cookie = new HttpCookie("UserInfo");
                    cookie["Username"] = username;
                    cookie["Password"] = password;
                    cookie.Expires = DateTime.Now.AddMonths(1); // thời gian cookie hết hạn sau 1 tháng 
                    Response.Cookies.Add(cookie);


                }
                else
                {

                }
                // nếu tìm thấy người dùng, tạo sesion  và chuyển hướng đến trang chính
                if (user != null && admin==null)
                {
                    Session["user"] = user.MAKH;
                    userString = Session["user"].ToString();
                    Session["pass"] = user.MATKHAU;
                }
                if (admin != null && user == null)
                {
                    Session["user"] = admin.MA_ADMIN;
                    userString = Session["user"].ToString();
                    Session["pass"] = admin.MATKHAU;
                    Response.Redirect("Admin.aspx");
                }
                

               
                Response.Redirect("Default.aspx");
            }
            else
            {
                // nếu không tìm thấy người dùng, hiển thị thông báo lỗi
                Response.Write("<script>alert('sai tài khoản hoặc mật khẩu');</script>");
            }        
        }
    }
}