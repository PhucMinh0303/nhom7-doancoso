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
    
    public partial class SANPHAM
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SANPHAM()
        {
            this.CHITIETDONHANGs = new HashSet<CHITIETDONHANG>();
            this.DOANHTHUs = new HashSet<DOANHTHU>();
        }
    
        public int MASANPHAM { get; set; }
        public string TENSANPHAM { get; set; }
        public Nullable<double> GIA { get; set; }
        public string DUONGDAN { get; set; }
        public string MOTA { get; set; }
        public Nullable<int> MALOAIPHUKIEN { get; set; }
        public Nullable<int> MAHANGSANXUAT { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CHITIETDONHANG> CHITIETDONHANGs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DOANHTHU> DOANHTHUs { get; set; }
        public virtual HANGSANXUAT HANGSANXUAT { get; set; }
        public virtual LOAIPHUKIEN LOAIPHUKIEN { get; set; }
    }
}
