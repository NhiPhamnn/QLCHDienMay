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
    
    public partial class TinhNang
    {
        public string MaSanPham { get; set; }
        public string TenTinhNang { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; }
        public System.Guid rowguid { get; set; }
    
        public virtual SanPham SanPham { get; set; }
    }
}
