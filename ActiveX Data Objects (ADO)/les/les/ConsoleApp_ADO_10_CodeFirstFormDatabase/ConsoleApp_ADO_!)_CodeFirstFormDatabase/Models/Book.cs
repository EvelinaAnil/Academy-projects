namespace ConsoleApp_ADO____CodeFirstFormDatabase.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            S_Cards = new HashSet<S_Cards>();
            T_Cards = new HashSet<T_Cards>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public int Pages { get; set; }

        public int YearPress { get; set; }

        public int Id_Themes { get; set; }

        public int Id_Category { get; set; }

        public int Id_Author { get; set; }

        public int Id_Press { get; set; }

        [StringLength(50)]
        public string Comment { get; set; }

        public int Quantity { get; set; }

        public virtual Author Author { get; set; }

        public virtual Category Category { get; set; }

        public virtual Press Press { get; set; }

        public virtual Theme Theme { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<S_Cards> S_Cards { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<T_Cards> T_Cards { get; set; }
    }
}
