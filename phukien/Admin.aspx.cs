using phukien.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class Admin : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Chỉ thực thi khi trang không được load lại từ postback
            {
                CheckAccess();
            }
        }

        private void CheckAccess()
        {
            if (Session["user"] != null && Session["pass"] != null)
            {
                string pass = Session["pass"].ToString();
                string taikhoan = Session["user"].ToString();

                var hadAdmin = dbcontext.ADMINs.Any(s => s.MA_ADMIN == taikhoan && s.MATKHAU == pass);
                if (hadAdmin)
                {
                    // Lấy người dùng có mã tương ứng từ cơ sở dữ liệu
                    var Admin = dbcontext.ADMINs.FirstOrDefault(p => p.MA_ADMIN == taikhoan && p.MATKHAU == pass);

                }
                else
                {
                    // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                // Session không tồn tại, chuyển hướng đến trang đăng nhập
                Response.Redirect("Login.aspx");
            }
        }

    }
}