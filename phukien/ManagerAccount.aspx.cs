using System;
using System.Linq;
using System.Web.UI.WebControls;
using phukien.Models;

namespace phukien
{
    public partial class ManagerAccount : System.Web.UI.Page
    {
        // Chuỗi kết nối đến cơ sở dữ liệu
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QL_BANPHUKIENLAPTOPEntities2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid(); // Load dữ liệu lên Grid khi trang load lần đầu
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid(); // Gọi lại hàm BindGrid để load dữ liệu với từ khóa tìm kiếm
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Chuyển hướng đến trang thêm mới hoặc hiển thị modal thêm mới
            Response.Redirect("AddManagerAccount.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Lấy MA_ADMIN của dòng được chọn và chuyển hướng đến trang sửa đổi thông tin
            LinkButton btnEdit = (LinkButton)sender;

            GridViewRow row = (GridViewRow)btnEdit.NamingContainer;

            if (row != null && managerAccountTable.DataKeys != null)
            {
                int rowIndex = row.RowIndex;

                if (rowIndex >= 0 && rowIndex < managerAccountTable.DataKeys.Count)
                {
                    string maAdmin = managerAccountTable.DataKeys[rowIndex].Value.ToString();
                    Response.Redirect($"EditManagerAccount.aspx?id={maAdmin}");
                }
                else
                {
                    // Xử lý khi chỉ số không hợp lệ
                }
            }
            else
            {
                // Xử lý khi GridViewRow hoặc DataKeys không tồn tại
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btnDelete = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;

            if (row != null && managerAccountTable.DataKeys != null)
            {
                int rowIndex = row.RowIndex;

                if (rowIndex >= 0 && rowIndex < managerAccountTable.DataKeys.Count)
                {
                    string maAdmin = managerAccountTable.DataKeys[rowIndex].Value.ToString();
                    using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
                    {
                        var admin = dbcontext.ADMINs.Find(maAdmin);
                        if (admin != null)
                        {
                            dbcontext.ADMINs.Remove(admin);
                            dbcontext.SaveChanges();
                        }
                    }
                    BindGrid(); // Load lại Grid sau khi xóa dữ liệu
                }
                else
                {
                    // Xử lý khi chỉ số không hợp lệ
                }
            }
            else
            {
                // Xử lý khi GridViewRow hoặc DataKeys không tồn tại
            }
        }

        protected void managerAccountTable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Xử lý sự kiện chỉnh sửa dòng trong GridView
            managerAccountTable.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void managerAccountTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Xử lý sự kiện xóa dòng trong GridView
            string maAdmin = managerAccountTable.DataKeys[e.RowIndex].Value.ToString();

            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                var admin = dbcontext.ADMINs.Find(maAdmin);
                if (admin != null)
                {
                    dbcontext.ADMINs.Remove(admin);
                    dbcontext.SaveChanges();
                }
            }

            BindGrid(); // Load lại Grid sau khi xóa dữ liệu
        }

        protected void managerAccountTable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Hủy chế độ chỉnh sửa trong GridView
            managerAccountTable.EditIndex = -1;
            BindGrid();
        }

        private void BindGrid()
        {
            // Hàm này dùng để load dữ liệu từ cơ sở dữ liệu lên GridView
            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                var keyword = searchKeyword.Text.Trim();
                var admins = dbcontext.ADMINs
                    .Where(m => m.TEN_ADMIN.Contains(keyword))
                    .Select(m => new { m.MA_ADMIN, m.TEN_ADMIN, m.MATKHAU })
                    .ToList();

                managerAccountTable.DataSource = admins;
                managerAccountTable.DataBind();
            }
        }
    }
}
//AddManagerAccount??????