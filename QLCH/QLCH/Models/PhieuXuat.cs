//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLCH.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PhieuXuat
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuXuat()
        {
            this.ChiTietPhieuXuats = new HashSet<ChiTietPhieuXuat>();
        }
    
        public string MaPhieuXuat { get; set; }
        public string NhanVienTaoPhieu { get; set; }
        public string NhanVienTruongKho { get; set; }
        public string MaKho { get; set; }
        public string MaDonHang { get; set; }
        public Nullable<System.DateTime> ThoiGianTao { get; set; }
        public Nullable<decimal> TongGiaTri { get; set; }
        public System.Guid rowguid { get; set; }
        public Nullable<bool> TrangThai { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuXuat> ChiTietPhieuXuats { get; set; }
        public virtual DonHang DonHang { get; set; }
        public virtual Kho Kho { get; set; }
        public virtual NhanVien NhanVien { get; set; }
        public virtual NhanVien NhanVien1 { get; set; }
    }
}
