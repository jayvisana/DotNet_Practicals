using System.Collections.Generic;
using System.Linq;

namespace Practical_6.Models
{
    // Simple in-memory "database". Swap this out for Entity Framework
    // later (DbContext + SQL Server) without touching the Controller much.
    public static class ProductRepository
    {
        private static readonly List<Product> _products;
        private static int _nextId = 1;

        static ProductRepository()
        {
            _products = new List<Product>();
            Seed();
        }

        private static void Seed()
        {
            Add(new Product { Name = "Wireless Mouse", Description = "Ergonomic wireless mouse with USB receiver.", Price = 599.00m, Category = "Electronics", StockQuantity = 120, ImageUrl = "https://placehold.co/400x300?text=Wireless+Mouse" });
            Add(new Product { Name = "Mechanical Keyboard", Description = "RGB backlit mechanical keyboard, blue switches.", Price = 2499.00m, Category = "Electronics", StockQuantity = 45, ImageUrl = "https://placehold.co/400x300?text=Keyboard" });
            Add(new Product { Name = "Running Shoes", Description = "Lightweight breathable running shoes for daily training.", Price = 1899.00m, Category = "Footwear", StockQuantity = 60, ImageUrl = "https://placehold.co/400x300?text=Running+Shoes" });
            Add(new Product { Name = "Ceramic Coffee Mug", Description = "350ml ceramic mug, microwave and dishwasher safe.", Price = 249.00m, Category = "Home & Kitchen", StockQuantity = 200, ImageUrl = "https://placehold.co/400x300?text=Coffee+Mug" });
            Add(new Product { Name = "Yoga Mat", Description = "Non-slip yoga mat, 6mm thickness, includes carry strap.", Price = 799.00m, Category = "Fitness", StockQuantity = 0, ImageUrl = "https://placehold.co/400x300?text=Yoga+Mat" });
        }

        public static List<Product> GetAll()
        {
            return _products;
        }

        public static Product GetById(int id)
        {
            return _products.FirstOrDefault(p => p.Id == id);
        }

        public static void Add(Product product)
        {
            product.Id = _nextId++;
            _products.Add(product);
        }

        public static void Update(Product product)
        {
            var existing = GetById(product.Id);
            if (existing == null) return;

            existing.Name = product.Name;
            existing.Description = product.Description;
            existing.Price = product.Price;
            existing.Category = product.Category;
            existing.StockQuantity = product.StockQuantity;
            existing.ImageUrl = product.ImageUrl;
        }

        public static void Delete(int id)
        {
            var existing = GetById(id);
            if (existing != null)
            {
                _products.Remove(existing);
            }
        }

        public static List<string> GetCategories()
        {
            return _products.Select(p => p.Category).Distinct().OrderBy(c => c).ToList();
        }
    }
}
