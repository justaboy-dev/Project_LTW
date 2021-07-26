namespace ProjectCCS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int id { get; set; }

        [Required]
        public string name { get; set; }

        [Required]
        public string image { get; set; }

        [Required]
        public string descriptions { get; set; }

        [Required]
        public int categoryId { get; set; }

        [Required]
        public long? price { get; set; }
    }
}
