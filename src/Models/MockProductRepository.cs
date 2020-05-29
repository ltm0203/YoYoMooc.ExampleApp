using System.Linq;

namespace YoYoMooc.ExampleApp.Models
{
    public class MockProductRepository : IProductRepository
    {

        private static readonly Product[] DummyData = new Product[] {
new Product { Name = "产品1", Category = "分类1", Price = 100 },
new Product { Name = "产品2", Category = "分类1", Price = 100 },
new Product { Name = "产品3", Category = "分类2", Price = 100 },
new Product { Name = "产品4", Category = "分类2", Price = 100 },
};
        public IQueryable<Product> Products => DummyData.AsQueryable();

    }

}

