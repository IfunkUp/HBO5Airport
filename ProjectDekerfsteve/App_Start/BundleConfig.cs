using System.Web;
using System.Web.Optimization;

namespace ProjectDekerfsteve
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-1.10.2.min.js"));
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/bootstrap.min.js",
                "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/steves").Include(
                "~/Scripts/eigen/S*"

                ));
            bundles.Add(new ScriptBundle("~/bundles/datatables").Include(
                "~/Scripts/eigen/jquery.dataTables.min.js",
                "~/Scripts/eigen/dataTables.bootstrap.min.js",
                "~/Scripts/eigen/dataTables.colReorder.min.js"


            ));
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));
            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                "~/Scripts/jquery-ui.min.js"));
         
            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/bootstrap.min.css",
                "~/Content/jquery.dataTables.min.css",
                "~/Content/jquery.dataTables_themeroller.min.css",
                "~/Content/dataTables.bootstrap.min.css",
                "~/Content/colReorder.bootstrap.min.css",
                "~/Content/jquery-ui.min.css",
                       "~/Content/agency.css",
                       "~/Content/style.css",
                      
                      "~/Content/site.css"));

        }
    }
}
