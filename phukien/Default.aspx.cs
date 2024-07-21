using System;
using System.Data.Entity;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;

namespace phukien
{
    public partial class _Default : Page
    {

        protected string FormatCurrency(object price)
        {
            if (price == null)
                return "0 VNĐ"; // Giá trị mặc định khi price là null

            try
            {
                decimal parsedPrice = decimal.Parse(price.ToString());
                return string.Format("{0:#,##0} VNĐ", parsedPrice);
            }
            catch (Exception )
            {
                // Xử lý lỗi nếu cần
                return "0 VNĐ"; // Trả về giá trị mặc định nếu có lỗi
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DbContext"] == null)
                {
                    Session["DbContext"] = new QL_BANPHUKIENLAPTOP2Entities();
                }

                BindLoaiSanPham();
                BindSanPham();
            }
        }

        private void BindLoaiSanPham()
        {
            var context = (QL_BANPHUKIENLAPTOP2Entities)Session["DbContext"];
            var loaiSanPhams = context.LOAIPHUKIENs.ToList();
            ddlLoaiSanPham.DataSource = loaiSanPhams;
            ddlLoaiSanPham.DataTextField = "TenLoaiPhuKien";
            ddlLoaiSanPham.DataValueField = "MaLoaiPhuKien";
            ddlLoaiSanPham.DataBind();

            ddlLoaiSanPham.Items.Insert(0, new ListItem("Tất cả", "0"));
        }
      

      
        protected void ddlLoaiSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSanPham(); // Gọi phương thức BindSanPham khi DropDownList Loại Sản phẩm thay đổi
        }

        public IQueryable<SANPHAM> GetSANPHAMs()
        {
            var selectedCategory = ddlLoaiSanPham.SelectedValue;

            var context = (QL_BANPHUKIENLAPTOP2Entities)Session["DbContext"];
            if (selectedCategory == "0")
            {
                return context.SANPHAMs.AsQueryable();
            }
            else
            {
                int maLoaiPhuKien = int.Parse(selectedCategory);
                return context.SANPHAMs.Where(sp => sp.MALOAIPHUKIEN == maLoaiPhuKien).AsQueryable();
            }
        }

        private void BindSanPham()
        {
            ListView1.DataBind();
        }

    }
}
