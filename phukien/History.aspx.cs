using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;

namespace phukien
{
    public partial class History : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public IQueryable<phukien.Models.CHITIETDONHANG> GetList()
        {
            // Sử dụng SingleOrDefault thay vì Where trong trường hợp chỉ trả về một kết quả
            // var cHITIETDONHANGS = dbcontext.CHITIETDONHANG.Where(s => s.DONHANG.MAKH == Login.name).OrderByDescending(s => s.DONHANG.NGAYDAT);
            var cHITIETDONHANGS = dbcontext.CHITIETDONHANGs.OrderByDescending(s => s.DONHANG.NGAYDAT);
            return cHITIETDONHANGS;
        }
    }
}