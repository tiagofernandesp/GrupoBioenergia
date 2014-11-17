using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GrupoBioenergia;

namespace GrupoBioenergia.Controllers
{
    public class UtilizadorsController : Controller
    {
        private CienerEntities db = new CienerEntities();

        // GET: Utilizadors
        public ActionResult Index()
        {
            var utilizador = db.Utilizador.Include(u => u.Online).Include(u => u.TipoAcesso);
            return View(utilizador.ToList());
        }

        // GET: Utilizadors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilizador utilizador = db.Utilizador.Find(id);
            if (utilizador == null)
            {
                return HttpNotFound();
            }
            return View(utilizador);
        }

        // GET: Utilizadors/Create
        public ActionResult Create()
        {
            ViewBag.IDUtilizador = new SelectList(db.Online, "IDUtilizador", "IP");
            ViewBag.IDAcesso = new SelectList(db.TipoAcesso, "IDTAcesso", "Tipo");
            return View();
        }

        // POST: Utilizadors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDUtilizador,Password,PNome,UNome,DataNasc,ContactoTele,ContactoMail,Foto,Curriculum,IDAcesso")] Utilizador utilizador)
        {
            if (ModelState.IsValid)
            {
                db.Utilizador.Add(utilizador);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDUtilizador = new SelectList(db.Online, "IDUtilizador", "IP", utilizador.IDUtilizador);
            ViewBag.IDAcesso = new SelectList(db.TipoAcesso, "IDTAcesso", "Tipo", utilizador.IDAcesso);
            return View(utilizador);
        }

        // GET: Utilizadors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilizador utilizador = db.Utilizador.Find(id);
            if (utilizador == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDUtilizador = new SelectList(db.Online, "IDUtilizador", "IP", utilizador.IDUtilizador);
            ViewBag.IDAcesso = new SelectList(db.TipoAcesso, "IDTAcesso", "Tipo", utilizador.IDAcesso);
            return View(utilizador);
        }

        // POST: Utilizadors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDUtilizador,Password,PNome,UNome,DataNasc,ContactoTele,ContactoMail,Foto,Curriculum,IDAcesso")] Utilizador utilizador)
        {
            if (ModelState.IsValid)
            {
                db.Entry(utilizador).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDUtilizador = new SelectList(db.Online, "IDUtilizador", "IP", utilizador.IDUtilizador);
            ViewBag.IDAcesso = new SelectList(db.TipoAcesso, "IDTAcesso", "Tipo", utilizador.IDAcesso);
            return View(utilizador);
        }

        // GET: Utilizadors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilizador utilizador = db.Utilizador.Find(id);
            if (utilizador == null)
            {
                return HttpNotFound();
            }
            return View(utilizador);
        }

        // POST: Utilizadors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Utilizador utilizador = db.Utilizador.Find(id);
            db.Utilizador.Remove(utilizador);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
