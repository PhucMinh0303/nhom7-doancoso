using phukien.Models;
using System;
using System.Linq;
using System.Web.UI;

namespace phukien
{
    public partial class ReadFile : System.Web.UI.Page
    {
        // Đặt thuộc tính công khai
        public string Teptindientu { get; set; }
        protected QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Lấy mã sản phẩm từ query string hoặc nguồn khác
                string maSanPham = Request.QueryString["maSanPham"]; // Ví dụ lấy từ query string

                if (!string.IsNullOrEmpty(maSanPham))
                {
                    // Lấy thực thể DIENTU đầu tiên nơi MASANPHAMDT khớp với maSanPham.
                    DIENTU dIENTU = dbcontext.DIENTUs.FirstOrDefault(s => s.TENSANPHAMDT == maSanPham);

                    // Đảm bảo dIENTU không null để tránh lỗi NullReferenceException.
                    if (dIENTU != null)
                    {
                        // Gán giá trị thuộc tính TEPTIN cho Teptindientu.
                        Teptindientu = dIENTU.TEPTIN;
                    }
                    else
                    {
                        // Xử lý trường hợp không tìm thấy thực thể phù hợp.
                        Teptindientu = "Không tìm thấy tệp.";
                    }
                }
                else
                {
                    // Xử lý trường hợp mã sản phẩm không được cung cấp
                    Teptindientu = "Mã sản phẩm không được cung cấp.";
                }

                // Thêm dòng này để kiểm tra giá trị của Teptindientu
                System.Diagnostics.Debug.WriteLine("Teptindientu: " + Teptindientu);
            }
        }

        public string GetTeptindientu()
        {
            return Teptindientu;
        }
    }
}
