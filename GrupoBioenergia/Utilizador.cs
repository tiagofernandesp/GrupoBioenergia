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
    
    public partial class Utilizador
    {
        public Utilizador()
        {
            this.Comentario = new HashSet<Comentario>();
            this.Mensagem = new HashSet<Mensagem>();
            this.Publicacao = new HashSet<Publicacao>();
        }
    
        public int IDUtilizador { get; set; }
        public string Password { get; set; }
        public string PNome { get; set; }
        public string UNome { get; set; }
        public Nullable<System.DateTime> DataNasc { get; set; }
        public string ContactoTele { get; set; }
        public string ContactoMail { get; set; }
        public byte[] Foto { get; set; }
        public byte[] Curriculum { get; set; }
        public int IDAcesso { get; set; }
    
        public virtual ICollection<Comentario> Comentario { get; set; }
        public virtual ICollection<Mensagem> Mensagem { get; set; }
        public virtual Online Online { get; set; }
        public virtual ICollection<Publicacao> Publicacao { get; set; }
        public virtual TipoAcesso TipoAcesso { get; set; }
    }
}
