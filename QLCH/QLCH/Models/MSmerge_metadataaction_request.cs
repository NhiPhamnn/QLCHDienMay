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
    
    public partial class MSmerge_metadataaction_request
    {
        public int tablenick { get; set; }
        public System.Guid rowguid { get; set; }
        public byte action { get; set; }
        public Nullable<long> generation { get; set; }
        public Nullable<int> changed { get; set; }
    }
}
