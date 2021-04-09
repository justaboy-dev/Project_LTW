using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Project_CCS.Startup))]
namespace Project_CCS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
