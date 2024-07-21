using phukien.Models;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class ManagerRevenue : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRevenueData();
            }
        }

        private void LoadRevenueData()
        {
            try
            {
                // Lấy danh sách doanh thu từ cơ sở dữ liệu
                var revenueData = dbcontext.DOANHTHUs.ToList();

                // Hiển thị dữ liệu trong GridView
                GridViewRevenue.DataSource = revenueData;
                GridViewRevenue.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ và ghi log (nếu cần)
                Response.Write($"Đã xảy ra lỗi khi tải dữ liệu doanh thu: {ex.Message}");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                // Kiểm tra null và chuyển đổi giá trị từ textbox
                if (!int.TryParse(txtOrderId.Text, out int orderId))
                {
                    Response.Write("ID đơn hàng không hợp lệ.");
                    return;
                }

                // Kiểm tra xem đơn hàng đã tồn tại và chưa được đánh dấu đã giao
                var order = dbcontext.DOANHTHUs.FirstOrDefault(o => o.MASANPHAM == orderId && !o.DaGiao);
                if (order != null)
                {
                    // Cập nhật trạng thái đã giao
                    order.DaGiao = true;
                    dbcontext.SaveChanges();

                    // Reload dữ liệu
                    LoadRevenueData();
                }
                else
                {
                    // Đơn hàng không tồn tại hoặc đã được đánh dấu đã giao
                    Response.Write("Đơn hàng không tồn tại hoặc đã được giao.");
                }
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ và ghi log (nếu cần)
                Response.Write($"Đã xảy ra lỗi khi cập nhật đơn hàng: {ex.Message}");
            }
        }
    }
}
