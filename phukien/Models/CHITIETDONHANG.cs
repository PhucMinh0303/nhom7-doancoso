//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace phukien.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHITIETDONHANG
    {
        public int MACTDH { get; set; }
        public Nullable<int> MADH { get; set; }
        public Nullable<int> MASANPHAM { get; set; }
        public int SOLUONG { get; set; }
        public string TENSANPHAM { get; set; }
        public string DUONGDAN { get; set; }
        public Nullable<double> GIA { get; set; }
        public Nullable<double> THANHTIEN { get; set; }
    
        public virtual DONHANG DONHANG { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }

      
    }
}
