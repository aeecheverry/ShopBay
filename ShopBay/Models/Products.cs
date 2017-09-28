//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopBay.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.Auction = new HashSet<Auction>();
            this.OnSaleProducts = new HashSet<OnSaleProducts>();
            this.ProductCommentary = new HashSet<ProductCommentary>();
            this.ProductsSold = new HashSet<ProductsSold>();
            this.Category = new HashSet<Category>();
        }
    
        public int ProductID { get; set; }
        public string Name { get; set; }
        public Nullable<int> Price { get; set; }
        public int UserID { get; set; }
        public int ShippingID { get; set; }
        public string Description { get; set; }
        public Nullable<int> Existencies { get; set; }
        public Nullable<double> Rate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Auction> Auction { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OnSaleProducts> OnSaleProducts { get; set; }
        public virtual ImageCatalog ImageCatalog { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductCommentary> ProductCommentary { get; set; }
        public virtual ShippingOptions ShippingOptions { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsSold> ProductsSold { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Category> Category { get; set; }
    }
}