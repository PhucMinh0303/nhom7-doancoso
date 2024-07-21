using phukien.Models;
using System;
using System.Linq;
using System.Web.UI;

namespace phukien
{
    public partial class DienTu : Page
    {
        // Khởi tạo DbContext ở mức lớp
        private QL_BANPHUKIENLAPTOP2Entities dbcontext;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Khởi tạo DbContext khi trang được tải
            dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        }

        public IQueryable<DIENTU> GetPhone()
        {
            // Truy vấn dữ liệu từ DbContext
            IQueryable<DIENTU> dIENTUs = dbcontext.DIENTUs;
            return dIENTUs;
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // Đảm bảo DbContext được xử lý khi trang bị xử lý
            if (dbcontext != null)
            {
                dbcontext.Dispose();
            }
        }
    }
}
