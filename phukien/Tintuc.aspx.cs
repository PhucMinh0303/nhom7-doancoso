using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace phukien
{
    public partial class About : Page
    {
        public class TechNews
        {
            public string Title { get; set; }
            public string Content { get; set; }
            public DateTime DatePosted { get; set; }
            public string ImageUrl { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTechNews();
            }
        }

        private void BindTechNews()
        {
            List<TechNews> newsList = new List<TechNews>
            {
                new TechNews
                {
                    Title = "Ba tuyến IA, APG, AAE-1 gặp sự cố",
                    Content = "Một nhà cung cấp dịch vụ Internet tại Việt Nam cho biết sự cố mới nhất xảy ra với tuyến Intra-Asia (IA) sáng 13/6, được xác định do lỗi rò nguồn trên nhánh S1 hướng đi Singapore. Trước đó, hai tuyến khác kết nối Việt Nam cũng gặp trục trặc gồm APG từ tháng 3 và AAE-1 vào ngày 23/5, đều chưa được khắc phục.",
                    DatePosted = DateTime.Now,
                    ImageUrl = "images/poster/OIP.jpg"
                },
                new TechNews
                {
                    Title = "Samsung công bố công nghệ đúc chip mới",
                    Content = "Samsung công bố công nghệ đúc chip mới gồm hai nút tiên tiến SF2Z (2 nm) và SF4U (4 nm) dành cho chip HPC và AI. Samsung Electronics, một trong những công ty hàng đầu thế giới về bán dẫn, đã mô tả những cải tiến trong công nghệ đúc tại sự kiện Samsung Foundry Forum (SFF) ở San Jose ngày 12-13/6.",
                    DatePosted = DateTime.Now,
                    ImageUrl = "images/poster/hinh.jpg"
                }
            };

            lvTechNews.DataSource = newsList;
            lvTechNews.DataBind();
        }
    }
}
