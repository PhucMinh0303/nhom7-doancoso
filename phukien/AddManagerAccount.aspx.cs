using System;
using phukien.Models;

namespace phukien
{
    public partial class AddManagerAccount : System.Web.UI.Page
    {
        // Chuỗi kết nối đến cơ sở dữ liệu
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QL_BANPHUKIENLAPTOPEntities"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Không cần phải có gì trong này vì không có logic đặc biệt cần thực hiện khi trang được load.
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string tenAdmin = txtTenAdmin.Text.Trim();
            string password = txtPassword.Text; // Lưu ý: bạn cần mã hóa password trước khi lưu vào database

            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                try
                {
                    ADMIN newAdmin = new ADMIN
                    {
                        MA_ADMIN = tenAdmin,
                        MATKHAU = password, // Bạn cần mã hóa password trước khi lưu vào database
                        TEN_ADMIN = "Nhân viên",
                    };

                    dbcontext.ADMINs.Add(newAdmin);
                    dbcontext.SaveChanges();

                    // Chuyển hướng sau khi lưu thành công
                    Response.Redirect("ManagerAccount.aspx");
                }
                catch (Exception ex)
                {
                    // Xử lý lỗi khi lưu dữ liệu không thành công
                    Console.WriteLine("Lỗi khi lưu dữ liệu: " + ex.Message);
                    // Có thể thêm mã lỗi để thông báo cho người dùng
                    // Ví dụ: lblMessage.Text = "Có lỗi xảy ra khi lưu dữ liệu";
                }
                
            }
        }
        protected void btnQuay_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerAccount.aspx");
        }
    }
}
