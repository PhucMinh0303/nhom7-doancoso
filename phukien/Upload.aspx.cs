using phukien.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace phukien
{
    public partial class Upload : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTenSP.Text) ||
               string.IsNullOrEmpty(txtGia.Text) ||
               string.IsNullOrEmpty(txtMT.Text) ||
               string.IsNullOrEmpty(txtHSX.Text) ||
               string.IsNullOrEmpty(txtML.Text) ||
               fileUpload.HasFile == false) // kiểm tra xem có file nào được tải lên không
             {
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin.');</script>");
                return;
             }

            if (dbcontext.SANPHAMs.Any(s => s.TENSANPHAM == txtTenSP.Text))
            {
                Response.Write("<script>alert('Sản phẩm đã có.');</script>");
                return;
            }

            // Cập nhât hình ảnh trong cơ sở dữ liệu 
            SANPHAM sANPHAM = new SANPHAM();
            sANPHAM.TENSANPHAM = txtTenSP.Text;
            sANPHAM.GIA=float.Parse(txtGia.Text);
            sANPHAM.MOTA= txtMT.Text;

            if(dbcontext.LOAIPHUKIENs.Where(s => s.TENLOAIPHUKIEN == txtML.Text).Count() >0)
            {
                var ds = dbcontext.LOAIPHUKIENs.FirstOrDefault(s => s.TENLOAIPHUKIEN==txtML.Text);
                sANPHAM.MALOAIPHUKIEN = ds.MALOAIPHUKIEN;
            }
            else
            {
               LOAIPHUKIEN oAIPHUKIEN = new LOAIPHUKIEN();
               oAIPHUKIEN.TENLOAIPHUKIEN=txtML.Text;
               dbcontext.LOAIPHUKIENs.Add(oAIPHUKIEN);
               sANPHAM.MALOAIPHUKIEN = oAIPHUKIEN.MALOAIPHUKIEN;

            }
            if (dbcontext.HANGSANXUATs.Where(s => s.TENHANGSANXUAT == txtHSX.Text).Count() > 0)
            {
                var ds = dbcontext.HANGSANXUATs.FirstOrDefault(s => s.TENHANGSANXUAT == txtHSX.Text);
            }
            else
            {
                HANGSANXUAT hANGSANXUAT = new HANGSANXUAT();
                hANGSANXUAT.TENHANGSANXUAT = txtHSX.Text;
                dbcontext.HANGSANXUATs.Add(hANGSANXUAT);
                sANPHAM.MAHANGSANXUAT = hANGSANXUAT.MAHANGSANXUAT;
            }

            if (fileUpload.HasFile)
            {
                string uploadFolderPath = Server.MapPath("~/Content/IMG/");
                if (!Directory.Exists(uploadFolderPath))
                {
                    Directory.CreateDirectory(uploadFolderPath);
                }

                string fileName = Path.GetFileName(fileUpload.FileName);
                string filePath = Path.Combine(uploadFolderPath, fileName);

                fileUpload.SaveAs(filePath);
                sANPHAM.DUONGDAN = "Content/img/" + fileName;
            }
            // Thêm sản phẩm vào cơ sở dữ liệu
            dbcontext.SANPHAMs.Add(sANPHAM);
            dbcontext.SaveChanges();
            Response.Redirect("ListSanPham.aspx");
        }
    }
}
