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
    
    public partial class MSmerge_conflict_QLDienMay_CN1_PhieuBaoHanh
    {
        public string MaPhieuBH { get; set; }
        public string MaSanPham { get; set; }
        public string MaKhachHang { get; set; }
        public string MaDonHang { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public Nullable<System.DateTime> NgayHetHan { get; set; }
        public System.Guid rowguid { get; set; }
        public Nullable<bool> TrangThai { get; set; }
        public Nullable<System.Guid> origin_datasource_id { get; set; }
    }
}
