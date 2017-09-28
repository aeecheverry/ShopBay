﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopBay.Models;

namespace ShopBay.Controllers

{
    public class ProductController : Controller
    {
        ShopBayEntities db = new ShopBayEntities();
        // GET: Product
        public ActionResult Product(int id)
        {
            var product = db.Products.Find(id);
            ViewBag.Seller = db.Users.Find(product.UserID);
            ViewBag.Onsale=true;
            if (false)
            {
                ViewBag.Onsale = false;
            }
            //ViewBag.Category = product.
            return View(product);
        }
    }
}