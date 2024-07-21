using phukien.Models;
using System;
using System.Linq;
using System.Web.UI;

namespace phukien
{
    public partial class admin : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOPEntities1 dbcontext = new QL_BANPHUKIENLAPTOPEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Chỉ thực thi khi trang không được load lại từ postback
            {
                CheckAccess();
            }
        }

        private void CheckAccess()
        {
            // Lấy thông tin người dùng hiện tại từ session hoặc từ cookie (tùy vào cách bạn lưu trữ thông tin đăng nhập)
            string currentUserId = Session["CurrentUserId"] ;

            if (currentUserId != null)
            {
                // Lấy người dùng có mã tương ứng từ cơ sở dữ liệu
                var admin = dbcontext.ADMINs.FirstOrDefault(p => p.MA_ADMIN == currentUserId);

                if (admin != null)
                {
                    // Kiểm tra mật khẩu
                    string currentPassword = Session["CurrentUserPassword"] as string;

                    if (currentPassword != null && admin.MATKHAU == currentPassword)
                    {
                        // Người dùng có quyền truy cập vào trang quản trị, chuyển hướng đến trang admin
                        Response.Redirect("AdminPanel.aspx");
                        return; // Kết thúc phương thức sau khi chuyển hướng
                    }
                }

                // Nếu không thỏa mãn các điều kiện trên, chuyển hướng đến trang lỗi hoặc trang đăng nhập
                Response.Redirect("Error.aspx");
            }
            else
            {
                // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                Response.Redirect("Login.aspx");
            }
        }
    }
}
