using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using phukien.Models;
using phukien.Help;
using System.Web.ModelBinding;
using System.Data.Entity.Migrations;
using Stripe;
using Stripe.Checkout;
using System.Configuration;

namespace phukien
{
    public partial class Cart : System.Web.UI.Page
    {
        public static string nguoinhan;
        public static string dienthoai;
        public static string diachi;
        public static string hinhthuc;

        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PaymentSuccess"] = false;
            if (Session["user"] != null)
            {
                // User is logged in
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            Helper helper = new Helper();
            ThanhTien();
        }

        public IEnumerable<phukien.Models.CHITIETDONHANG> GetCart()
        {
            if (Session["GioHang"] != null)
            {
                List<CHITIETDONHANG> gioHang = Session["GioHang"] as List<CHITIETDONHANG>;
                return gioHang;
            }
            return new List<CHITIETDONHANG>();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Button btnAdd = (Button)sender;
            int masp = int.Parse(btnAdd.CommandArgument);

            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;

            CHITIETDONHANG existingItem = lstGioHang.FirstOrDefault(item => item.MASANPHAM == masp);
            if (existingItem != null)
            {
                existingItem.SOLUONG++;
                existingItem.THANHTIEN = existingItem.SOLUONG * existingItem.GIA;
            }

            Session["GioHang"] = lstGioHang;

            ListView1.DataBind();
            ThanhTien();
        }

        protected void btnSubtract_Click(object sender, EventArgs e)
        {
            Button btnSubtract = (Button)sender;
            int masp = int.Parse(btnSubtract.CommandArgument);

            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;

            CHITIETDONHANG existingItem = lstGioHang.FirstOrDefault(item => item.MASANPHAM == masp);
            if (existingItem != null && existingItem.SOLUONG > 1)
            {
                existingItem.SOLUONG--;
                existingItem.THANHTIEN = existingItem.SOLUONG * existingItem.GIA;
            }

            Session["GioHang"] = lstGioHang;

            ListView1.DataBind();
            ThanhTien();
        }

        protected void btncu_Click(object sender, EventArgs e)
        {
            var user = dbcontext.KHACHHANGs.FirstOrDefault(u => u.MAKH == Login.name);
            txtTen.Text = user.TENKH;
            txtDT.Text = user.DIENTHOAI;
            txtDC.Text = user.DIACHI;
            txtTen.Enabled = false;
            txtDT.Enabled = false;
            txtDC.Enabled = false;
        }

        protected void btnmoi_Click(object sender, EventArgs e)
        {
            txtTen.Text = null;
            txtDT.Text = null;
            txtDC.Text = null;
            txtTen.Enabled = true;
            txtDT.Enabled = true;
            txtDC.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ListView1.Items.Count == 0)
            {
                Response.Write("<script>alert('Vui lòng chọn sản phẩm');</script>");
                return;
            }
            if (string.IsNullOrEmpty(txtTen.Text) ||
                string.IsNullOrEmpty(txtDT.Text) ||
                string.IsNullOrEmpty(txtDC.Text))
            {
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin.');</script>");
                return;
            }
            if (txtDT.Text.Length != 10)
            {
                Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại.');</script>");
                return;
            }
            if (string.IsNullOrEmpty(hinhthuc))
            {
                Response.Write("<script>alert('Vui lòng chọn hình thức giao hàng.');</script>");
                return;
            }

            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;

            DONHANG dONHANG = new DONHANG();
            dONHANG.MAKH = Login.name;
            dONHANG.NGAYDAT = DateTime.Now;
            dONHANG.NGUOINHAN = txtTen.Text;
            dONHANG.DIENTHOAI = txtDT.Text;
            dONHANG.DIACHI = txtDC.Text;
            dONHANG.HINHTHUC = hinhthuc;
            dONHANG.NGAYGIAO = DateTime.Now;

            dbcontext.DONHANGs.Add(dONHANG);
            dbcontext.SaveChanges(); // Save changes to get the order ID

            foreach (var item in lstGioHang)
            {
                CHITIETDONHANG chiTietDon = new CHITIETDONHANG();
                chiTietDon.MADH = dONHANG.MADH;
                chiTietDon.MASANPHAM = item.MASANPHAM;
                chiTietDon.TENSANPHAM = item.TENSANPHAM;
                chiTietDon.DUONGDAN = item.DUONGDAN;
                chiTietDon.SOLUONG = item.SOLUONG;
                chiTietDon.GIA = item.GIA;
                chiTietDon.THANHTIEN = item.THANHTIEN;

                dbcontext.CHITIETDONHANGs.Add(chiTietDon);
            }

            dbcontext.SaveChanges();

            lstGioHang.Clear();
            Session["GioHang"] = lstGioHang;
            hinhthuc = null;
            Response.Redirect("OrderSuccess.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Button btnXoa = (Button)sender;
            ListViewItem item = (ListViewItem)btnXoa.NamingContainer;
            int index = item.DisplayIndex;

            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            lstGioHang.RemoveAt(index);
            Session["GioHang"] = lstGioHang;
            ListView1.DataBind();
            ThanhTien();
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void ThanhTien()
        {
            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            float tongThanhToan = 0;

            if (lstGioHang != null)
            {
                foreach (var item in lstGioHang)
                {
                    tongThanhToan += float.Parse(item.THANHTIEN.ToString());
                }
            }

            lbTongThanhToan.Text = string.Format("{0:#,###} VNĐ", tongThanhToan);
        }

        protected void ThanhToanOnline_Click(object sender, EventArgs e)
        {
            // Check if items are in the cart
            if (ListView1.Items.Count == 0)
            {
                Response.Write("<script>alert('Vui lòng chọn sản phẩm');</script>");
                return;
            }

            // Check if required fields are filled
            if (string.IsNullOrEmpty(txtTen.Text) ||
                string.IsNullOrEmpty(txtDT.Text) ||
                string.IsNullOrEmpty(txtDC.Text))
            {
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin.');</script>");
                return;
            }

            // Validate phone number length
            if (txtDT.Text.Length != 10)
            {
                Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại.');</script>");
                return;
            }

            // Check if delivery method is selected
            if (string.IsNullOrEmpty(hinhthuc))
            {
                Response.Write("<script>alert('Vui lòng chọn hình thức giao hàng.');</script>");
                return;
            }

            // Assign customer information
            nguoinhan = txtTen.Text;
            dienthoai = txtDT.Text;
            diachi = txtDC.Text;

            // Retrieve cart items
            List<CHITIETDONHANG> lstGioHang = Session["GioHang"] as List<CHITIETDONHANG>;
            if (lstGioHang == null || lstGioHang.Count == 0)
            {
                Response.Write("<script>alert('Không có sản phẩm trong giỏ hàng.');</script>");
                return;
            }

            // Calculate total amount in cents (required by Stripe)
            float tongThanhToan = 0;
            foreach (var item in lstGioHang)
            {
                tongThanhToan += (float)(item.GIA * item.SOLUONG);
            }

            long totalAmount = (long)(tongThanhToan * 100); // Convert total amount to cents

            // Check if total amount exceeds Stripe's limit
            /*if (totalAmount > 99999999)
            {
                Response.Write("<script>alert('Tổng số tiền vượt quá giới hạn cho phép của Stripe.');</script>");
                return;
            }*/

            // Prepare line items for Stripe session creation
            var lineItems = lstGioHang.Select(item => new SessionLineItemOptions
            {
                PriceData = new SessionLineItemPriceDataOptions
                {
                    Currency = "vnd",
                    ProductData = new SessionLineItemPriceDataProductDataOptions
                    {
                        Name = item.TENSANPHAM,
                    },
                    // UnitAmount = (long)(item.GIA * 100),
                    UnitAmount = (long)(item.GIA * 1),
                },
                Quantity = item.SOLUONG,
            }).ToList();

            // Configure options for Stripe session creation
            var options = new SessionCreateOptions
            {
                PaymentMethodTypes = new List<string> { "card" },
                LineItems = lineItems,
                Mode = "payment",
                SuccessUrl = "https://example.com/success",
                CancelUrl = "https://example.com/cancel",
            };

            try
            {
                // Initialize Stripe API with your secret key
                StripeConfiguration.ApiKey = ConfigurationManager.AppSettings["StripeSecretKey"];

                // Create a new session with the specified options
                var service = new SessionService();
                var session = service.Create(options);

                // Redirect to Stripe Checkout page
                // Response.Redirect(session.Url);
                var url = session.Url;
                if(url != null){
                    Response.Redirect(session.Url);
                }else
                {
                    Console.WriteLine("không có url");
                }
                
            }
            catch (StripeException ex)
            {
                // Handle Stripe API exceptions
                Response.Write($"<script>alert('Lỗi thanh toán: {ex.Message}');</script>");
            }
            catch (Exception ex)
            {
                // Handle other unexpected exceptions
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
            }
        }


        protected void ddlMenu_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            hinhthuc = ddl.SelectedItem.Text;
        }
    }
}
