using System.Web.Mvc;
using System.Web.Routing;

namespace WebMVC_5
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "AddFileRoute",
                url: "Student/AddStudentPhoto/{group}/{lastName}/{firstName}",
                defaults: new { controller = "Student", action = "AddStudentPhoto", group = "", lastName = "", firstName = "" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "University", action = "Home", id = UrlParameter.Optional }
            );
        }
    }
}
