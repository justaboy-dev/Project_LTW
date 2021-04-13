namespace Project_CCS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Product")]
    public partial class Product
    {
        public int id { get; set; }

        [Required]
        public string name { get; set; }

        [Required]
        public string image { get; set; }

        [Required]
        [StringLength(10)]
        public string descriptions { get; set; }

        public int categoryId { get; set; }

        public long? price { get; set; }

        public IEnumerable<Categories> Categories { get; set; }
    }
}
