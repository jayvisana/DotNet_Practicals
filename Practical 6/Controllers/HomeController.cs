using System.Web.Mvc;

namespace Practical_6.Controllers
{
    public class HomeController : Controller
    {
        // Root of the site ("/") sends visitors straight into the catalog
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Product");
        }
    }
}
