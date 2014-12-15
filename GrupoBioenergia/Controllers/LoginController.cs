using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace GrupoBioenergia.Controllers
{
    public class LoginController : Controller
    {
        private readonly Utilizador utilizador;

        private CienerEntities db = new CienerEntities();
             
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Index(Utilizador user)
        {

            if (ModelState.IsValid)
            {
                var valida = new Utilizador();
                valida = db.Utilizador.FirstOrDefault(x => x.ContactoMail == user.ContactoMail && x.Password.Equals(user.Password));
                if (valida != null)
                {
                    //Session["admin"] = valida.IDUtilizador;

                    FormsAuthentication.SetAuthCookie(user.PNome, false);
                 
                    return Redirect("/Home");
                }

                ModelState.AddModelError("", "Utilizador ou Password errados!");


            }
            return View(user);
        }

        //contexto.Utilizadores.FirstOrDefault(x => x.Username == user.Username && x.Password.Equals(user.Password));
    }
}