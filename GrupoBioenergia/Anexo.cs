//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GrupoBioenergia
{
    using System;
    using System.Collections.Generic;
    
    public partial class Anexo
    {
        public int IDAnexo { get; set; }
        public byte[] Anexo1 { get; set; }
        public int IDNoticia { get; set; }
        public int IDTFicheiro { get; set; }
    
        public virtual TipoFicheiro TipoFicheiro { get; set; }
    }
}