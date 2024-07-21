using phukien.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class ItemDT : System.Web.UI.Page
    {
        public static int Masanphamdientu;
         private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<phukien.Models.DIENTU> GetDIENTU()
        {
            IQueryable<DIENTU> dIENTUs = dbcontext.DIENTUs;
            return dIENTUs;
        }
        public IQueryable<phukien.Models.DIENTU> GetDetails([QueryString("sp")] int sp)
        {
            IQueryable<DIENTU> sachs = dbcontext.DIENTUs.Where(p => p.MASANPHAMDT == sp);
            Masanphamdientu = sp;
            return sachs;
        }
        protected void AddRead_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReadFile.aspx");
        }
    }
}