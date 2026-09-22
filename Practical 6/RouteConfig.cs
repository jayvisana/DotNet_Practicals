using System.Web.Mvc;
using System.Web.Routing;

namespace Practical_6
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // /Product/Details/5
            routes.MapRoute(
                name: "ProductDetails",
                url: "Product/Details/{id}",
                defaults: new { controller = "Product", action = "Details" },
                constraints: new { id = @"\d+" }
            );

            // /Catalog/Electronics  -> Product/Index?category=Electronics
            routes.MapRoute(
                name: "CategoryFilter",
                url: "Catalog/{category}",
                defaults: new { controller = "Product", action = "Index", category = UrlParameter.Optional }
            );

            // Default fallback route -> Product/Index
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
