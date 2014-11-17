using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GrupoBioenergia.Startup))]
namespace GrupoBioenergia
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
