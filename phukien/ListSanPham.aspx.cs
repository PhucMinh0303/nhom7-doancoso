using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;

namespace phukien
{
    public partial class ListSanPham : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbContext = new QL_BANPHUKIENLAPTOP2Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListView1.DataBind();
            }
        }

        public IQueryable<SANPHAM> GetSANPHAMs()
        {
            string searchValue = txtFind.Text.Trim();
            IQueryable<SANPHAM> sp;

            if (!string.IsNullOrEmpty(searchValue))
            {
                sp = dbContext.SANPHAMs
                    .Where(s => s.TENSANPHAM.Contains(searchValue))
                    .OrderBy(s => s.MASANPHAM);
            }
            else
            {
                sp = dbContext.SANPHAMs.OrderByDescending(s => s.MASANPHAM);
            }

            return sp;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Upload.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Button btnXoa = (Button)sender;

            // Find the ListViewItem containing the button that was clicked
            ListViewItem item = (ListViewItem)btnXoa.NamingContainer;

            // Retrieve the MaSanPham from the item
            string maSanPham = ((Label)item.FindControl("lblMaSanPham")).Text;

            // Delete the item from the data source using MaSanPham
            if (int.TryParse(maSanPham, out int maSanPhamInt))
            {
                var sanPhamToRemove = dbContext.SANPHAMs.FirstOrDefault(sp => sp.MASANPHAM == maSanPhamInt);
                if (sanPhamToRemove != null)
                {
                    dbContext.SANPHAMs.Remove(sanPhamToRemove);
                    dbContext.SaveChanges();
                }
            }

            // Rebind the ListView to reflect the changes
            ListView1.DataBind();
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Implement any specific logic for selected item change if necessary
        }

        protected void txtFind_TextChanged(object sender, EventArgs e)
        {
            ListView1.DataBind();
        }
    }
}
