using phukien.Models;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class AddBranchManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                GridView1.DataSource = dbcontext.Branches.ToList();
                GridView1.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string branchName = txtBranchName.Text;
            string address = txtLocation.Text;
            string phoneNumber = txtPhone.Text;

            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                Branch branch = new Branch()
                {
                    BranchName = branchName,
                    BranchAddress = address,
                    BranchPhone = phoneNumber
                };

                dbcontext.Branches.Add(branch);
                dbcontext.SaveChanges();
            }
            BindGrid();
            pnlAddEdit.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("BranchList.aspx");
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            pnlAddEdit.Visible = true;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int branchID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            TextBox txtBranchName = (TextBox)row.Cells[1].Controls[0];
            TextBox txtLocation = (TextBox)row.Cells[2].Controls[0];
            TextBox txtPhone = (TextBox)row.Cells[3].Controls[0];

            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                Branch branch = dbcontext.Branches.FirstOrDefault(b => b.BranchID == branchID);
                if (branch != null)
                {
                    branch.BranchName = txtBranchName.Text;
                    branch.BranchAddress = txtLocation.Text;
                    branch.BranchPhone = txtPhone.Text;
                    dbcontext.SaveChanges();
                }
            }
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int branchID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            using (QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities())
            {
                Branch branch = dbcontext.Branches.FirstOrDefault(b => b.BranchID == branchID);
                if (branch != null)
                {
                    dbcontext.Branches.Remove(branch);
                    dbcontext.SaveChanges();
                }
            }
            BindGrid();
        }
    }
}
