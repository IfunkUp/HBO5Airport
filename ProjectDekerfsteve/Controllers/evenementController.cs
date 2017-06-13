using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using ProjectDekerfsteve;

namespace ProjectDekerfsteve.Controllers
{
    public class evenementController : Controller
    {
        private INFO_c1035462Entities db = new INFO_c1035462Entities();

        // GET: evenement
        public ActionResult Index()
        {
            //var proj_evenementen = db.Proj_evenementen.Include(e => e.gemeente);
            // var evenementen = db.Proj_evenementen.Where(x => x.datum >= DateTime.Now).GroupBy(x => x.datum.Month).ToList();
            ViewBag.locatie = new SelectList(db.Proj_gemeenten, "id", "naam");
            var evenementen = db.Proj_evenementen.Where(x => x.datum >= DateTime.Now).OrderBy(x => x.datum).ToList();
            return View(evenementen);
        }

        // GET: evenement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evenement evenement = db.Proj_evenementen.Find(id);
            if (evenement == null)
            {
                return HttpNotFound();
            }
            var test = db.proj_inschrijvingen.Where(x => x.evenement_id == evenement.id).Count();
            if (test <= 0)
            {
                ViewBag.aantalIngeschreven = 0;
            }
            else
            {
                ViewBag.aantalIngeschreven = db.proj_inschrijvingen.Where(x => x.evenement_id == evenement.id)
                    .Sum(x => x.aantal_personen);
            }
            
            return View(evenement);
        }

        [Authorize( Roles = "Admin, Organisator")]
        public ActionResult Create()
        {
            ViewBag.locatie = new SelectList(db.Proj_gemeenten, "id", "naam");
            return View();
        }

        // POST: evenement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Organisator")]
        public ActionResult Create([Bind(Include = "id,naam,beschrijving,locatie,datum,Max_inschrijvingen")] evenement evenement)
        {
            if (ModelState.IsValid)
            {
                db.Proj_evenementen.Add(evenement);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.locatie = new SelectList(db.Proj_gemeenten, "id", "naam", evenement.locatie);
            return View(evenement);
        }

        [Authorize(Roles = "Admin, Organisator")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evenement evenement = db.Proj_evenementen.Find(id);
            if (evenement == null)
            {
                return HttpNotFound();
            }
            ViewBag.locatie = new SelectList(db.Proj_gemeenten, "id", "naam", evenement.locatie);
            return View(evenement);
        }

        // POST: evenement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Organisator")]
        public ActionResult Edit([Bind(Include = "id,naam,beschrijving,locatie,datum")] evenement evenement)
        {
            if (ModelState.IsValid)
            {
                db.Entry(evenement).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.locatie = new SelectList(db.Proj_gemeenten, "id", "naam", evenement.locatie);
            return View(evenement);
        }

        // GET: evenement/Delete/5
        [Authorize(Roles = "Admin, Organisator")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            evenement evenement = db.Proj_evenementen.Find(id);
            if (evenement == null)
            {
                return HttpNotFound();
            }
            return View(evenement);
        }

        // POST: evenement/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Organisator")]
        public ActionResult DeleteConfirmed(int id)
        {
            evenement evenement = db.Proj_evenementen.Find(id);
            db.Proj_evenementen.Remove(evenement);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult Subscribe(evenement e)
        {
            ViewBag.evenement = e;

            return View();
        }
        [HttpPost]
        public ActionResult Subscribe(evenement e, int aantal)
        {
            int rest = db.Proj_evenementen.Where(x => x.id == e.id).First().Max_inschrijvingen - db.proj_inschrijvingen
                           .Where(x => x.evenement_id == e.id).Select(x => x.aantal_personen).Sum();
            if (rest >= aantal)
            {
                db.proj_inschrijvingen.Add(new inschrijving
                {
                    persoon_id = User.Identity.GetUserId(),
                    aantal_personen = aantal,
                    evenement_id = e.id,
                });
                db.SaveChanges();
            }
          

            return RedirectToAction("Index", "evenement");
        }

        public JsonResult Test(string boodschap)
        {
            JsonResult test = new JsonResult();
            test.Data = "dit is een test";
            return test;
        }
        [HttpPost]
        public ActionResult Zoek(string txtGemeente)
        {
            var lijst = db.Proj_evenementen.Where(x => x.gemeente.naam == txtGemeente).ToList();
            return View(lijst);
        }


        #region ajax

        public PartialViewResult AjaxResult(int AJaantal, int evene)
        {
            String res = "";
            int rest = db.Proj_evenementen.Where(x => x.id ==  evene).First().Max_inschrijvingen - db.proj_inschrijvingen
                           .Where(x => x.evenement_id == evene).Select(x => x.aantal_personen).Sum();

            if (rest < AJaantal)
            {
                res = "Sorry alles volboekt";
            }
            return PartialView("_Subscribe", res);
        }

        

        #endregion























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
