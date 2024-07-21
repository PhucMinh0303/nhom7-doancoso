using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;
using System.Data.Entity.Migrations;
using System.Web.ModelBinding;

namespace phukien
{
    public partial class Item : System.Web.UI.Page
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra người dùng đã đăng nhập hay chưa
                if (HttpContext.Current.Session["user"] == null)
                {
                    // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Nếu đã đăng nhập, làm các việc khác cần thiết
                }
            }
        }

        public IQueryable<phukien.Models.SANPHAM> GetPhones()
        {
            IQueryable<SANPHAM> sANPHAMs =dbcontext.SANPHAMs;
            return sANPHAMs;
        }
        public IQueryable<phukien.Models.SANPHAM> GetDetails([QueryString("sp")] int sp)
        {
            IQueryable<SANPHAM> sachs = dbcontext.SANPHAMs.Where(p => p.MASANPHAM == sp);

            return sachs;
        }
        public List<CHITIETDONHANG> LayGioHang()
        {
            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<CHITIETDONHANG>();
                Session["GioHang"] = lstGioHang;

            }
            return lstGioHang;


        }
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            if ((Session["user"] != null))
            {
                // Trở lại trang hiện tại
                string url = HttpContext.Current.Request.Url.ToString();
                //productDetail.DataItem.
                // Lấy giở hàng
                List<CHITIETDONHANG> lstGioHang = LayGioHang();
                // 
                string idsp = HttpContext.Current.Request.QueryString.Get("sp");
                int idSach;
                if (int.TryParse(idsp, out idSach))
                {

                    CHITIETDONHANG chiTietDon = lstGioHang.Find(sp => sp.MASANPHAM == idSach);
                    if (chiTietDon == null)
                    {
                        SANPHAM sANPHAM = dbcontext.SANPHAMs.FirstOrDefault(p => p.MASANPHAM == idSach);
                        chiTietDon = new CHITIETDONHANG();
                        chiTietDon.MASANPHAM = idSach;
                        chiTietDon.SOLUONG = 1;
                        chiTietDon.TENSANPHAM = sANPHAM.TENSANPHAM;
                        chiTietDon.DUONGDAN = sANPHAM.DUONGDAN;
                        chiTietDon.GIA = sANPHAM.GIA;
                        chiTietDon.THANHTIEN = sANPHAM.GIA;
                        lstGioHang.Add(chiTietDon);
                        Session["GioHang"] = lstGioHang;
                        Response.Redirect(url);
                    }
                    else
                    {
                        chiTietDon.SOLUONG++;
                        chiTietDon.THANHTIEN = chiTietDon.GIA * chiTietDon.SOLUONG;

                        Session["GioHang"] = lstGioHang;
                        Response.Redirect(url);
                    }
                }
                else
                {
                    // Xử lý trường hợp idsp không phải là số nguyên
                    // Ví dụ: Redirect hoặc thông báo lỗi
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }


        }


    }
}
