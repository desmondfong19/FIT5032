using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_32SA2.Startup))]
namespace _32SA2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
