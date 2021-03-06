﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;
using PagedList;
using PagedList.Mvc;

namespace WebSiteBanSach.Controllers
{
    public class QuanLyNCCController : Controller
    {
        // GET: QuanLyNXB
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public ActionResult Index(int? _Page)
        {
            int PageNumber = (_Page ?? 1);
            int PageSize = 10;
            return View(db.NhaCungCaps.ToList().OrderBy(n => n.MaNCC).ToPagedList(PageNumber, PageSize));
        }

        public ActionResult ThemMoi()
        {
            return View();
        }

        [HttpPost]
        //[ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(NhaCungCap _NhaCungCap)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            NhaCungCap ncc = db.NhaCungCaps.SingleOrDefault(n => n.TenNCC == _NhaCungCap.TenNCC);
            if (ncc != null)
            {
                ViewBag.ThongBao = "Tên NCC đã tồn tại";
                return View();
            }
            db.NhaCungCaps.Add(_NhaCungCap);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult ChinhSua(int _MaNCC)
        {
            NhaCungCap nhacungcap = db.NhaCungCaps.SingleOrDefault(n => n.MaNCC == _MaNCC);
            if (nhacungcap == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nhacungcap);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChinhSua(NhaCungCap _NhaCungCap)
        {
            if (!ModelState.IsValid)
            {
                return View(_NhaCungCap);
            }
            db.Entry(_NhaCungCap).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Xoa(int _MaNCC)
        {
            NhaCungCap nhacungcap = db.NhaCungCaps.SingleOrDefault(n => n.MaNCC == _MaNCC);
            if (nhacungcap == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nhacungcap);
        }

        [HttpPost, ActionName("Xoa")]
        [ValidateInput(false)]
        public ActionResult XacNhanXoa(int _MaNCC)
        {
            NhaCungCap nhacungcap = db.NhaCungCaps.SingleOrDefault(n => n.MaNCC == _MaNCC);
            List<DienThoai> lstDienThoai = db.DienThoais.Where(n => n.MaNCC == _MaNCC).ToList();
            if ((nhacungcap == null) || (lstDienThoai.Count > 0))
            {
                if (nhacungcap == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                if (lstDienThoai.Count > 0)
                {
                    return View(nhacungcap);
                }
            }
            db.NhaCungCaps.Remove(nhacungcap);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult HienThi(int _MaNCC)
        {
            NhaCungCap nhacungcap = db.NhaCungCaps.SingleOrDefault(n => n.MaNCC == _MaNCC);
            if (nhacungcap == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nhacungcap);
        }
    }
}