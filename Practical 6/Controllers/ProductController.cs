using System.Linq;
using System.Web.Mvc;
using Practical_6.Models;

namespace Practical_6.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product  (also handles /Catalog/{category} route)
        public ActionResult Index(string category, string search)
        {
            var products = ProductRepository.GetAll().AsEnumerable();

            if (!string.IsNullOrEmpty(category))
            {
                products = products.Where(p => p.Category == category);
            }

            if (!string.IsNullOrEmpty(search))
            {
                products = products.Where(p => p.Name.ToLower().Contains(search.ToLower()));
            }

            ViewBag.Categories = ProductRepository.GetCategories();
            ViewBag.SelectedCategory = category;
            ViewBag.Search = search;

            return View(products.ToList());
        }

        // GET: Product/Details/5
        public ActionResult Details(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return HttpNotFound();
            return View(product);
        }

        // GET: Product/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Product/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                ProductRepository.Add(product);
                TempData["Success"] = "Product created successfully!";
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Product/Edit/5
        public ActionResult Edit(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return HttpNotFound();
            return View(product);
        }

        // POST: Product/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                ProductRepository.Update(product);
                TempData["Success"] = "Product updated successfully!";
                return RedirectToAction("Index");
            }
            return View(product);
        }

        // GET: Product/Delete/5
        public ActionResult Delete(int id)
        {
            var product = ProductRepository.GetById(id);
            if (product == null) return HttpNotFound();
            return View(product);
        }

        // POST: Product/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductRepository.Delete(id);
            TempData["Success"] = "Product deleted successfully!";
            return RedirectToAction("Index");
        }
    }
}
