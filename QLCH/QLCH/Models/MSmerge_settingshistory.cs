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
    
    public partial class MSmerge_settingshistory
    {
        public Nullable<System.DateTime> eventtime { get; set; }
        public System.Guid pubid { get; set; }
        public Nullable<System.Guid> artid { get; set; }
        public byte eventtype { get; set; }
        public string propertyname { get; set; }
        public string previousvalue { get; set; }
        public string newvalue { get; set; }
        public string eventtext { get; set; }
    }
}
