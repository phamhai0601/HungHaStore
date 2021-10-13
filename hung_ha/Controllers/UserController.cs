﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hung_ha.Models.DbSet;
using hung_ha.Models.DAO;
using hung_ha.Models.Form;
using System.Web.Helpers;
using hung_ha.helpers;
using System.Web.Security;

namespace hung_ha.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterForm model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var user = new tblUser();
                    user.username = model.username;
                    user.email = model.email;
                    user.password = PasswordHelper.MD5(model.password);
                    user.role = tblUser.ROLE_CLIENT;
                    user.created_at = TimeHelper.getTimeUnix();
                    if ((user = model.register(user)) != null)
                    {
                        return RedirectToAction("Login", "User");
                    }
                }
                return View(model);
            }
            catch(Exception e)
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginForm model)
        {     
            try
            {
                if (ModelState.IsValid)
                {
                    if (model.login())
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                return View(model);
            }
            catch(Exception e)
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult Logout()
        {
            AuthorHelper.removeIdentity();
            return RedirectToAction("Index", "Home");
        }
    }
}