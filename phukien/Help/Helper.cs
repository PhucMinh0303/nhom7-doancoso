using phukien.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace phukien.Help
{
    public class Helper
    {
        private QL_BANPHUKIENLAPTOP2Entities dbcontext = new QL_BANPHUKIENLAPTOP2Entities();

        public int TongSoLuong(List<CHITIETDONHANG> lstGioHang)
        {
            int tsl = 0;
            if (lstGioHang != null)
            {
                tsl = lstGioHang.Sum(sp => sp.SOLUONG);
            } 
            return tsl;
        }

        public double Tongthanhtien(List<CHITIETDONHANG> lstGioHang)
        {
            double ttt = 0;
            if (lstGioHang != null)
            {

                for (int i = 0; i < lstGioHang.Count; i++)
                {
                    CHITIETDONHANG cHITIETDONHANG = lstGioHang[i];

                    SANPHAM sANPHAM = dbcontext.SANPHAMs.FirstOrDefault(p => p.MASANPHAM == cHITIETDONHANG.MASANPHAM);
                }    
            } 
            return ttt; 
        }
    }
}