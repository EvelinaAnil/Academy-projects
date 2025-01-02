using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebMVC_5.Models
{
    public class Role
    {
        public int Id { get; set; }

        [StringLength(20)]
        [Index(IsUnique = true)]
        public string RoleName { get; set; }

        public virtual ICollection<ApplicationUser> ApplicationUsers { get; set; }

        public Role()
        {
            ApplicationUsers = new List<ApplicationUser>();
        }
    }
}