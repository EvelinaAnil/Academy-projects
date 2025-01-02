namespace ConsoleApp_ADO____CodeFirstFormDatabase.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class S_Cards
    {
        public int Id { get; set; }

        public int Id_Student { get; set; }

        public int Id_Book { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime DateOut { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? DateIn { get; set; }

        public int Id_Lib { get; set; }

        public virtual Book Book { get; set; }

        public virtual Lib Lib { get; set; }

        public virtual Student Student { get; set; }
    }
}
