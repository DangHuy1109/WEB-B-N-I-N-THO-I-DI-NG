using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;
using PagedList;
using PagedList.Mvc;


namespace WebsiteBanDienThoai.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        // GET: QuanLyDonHang
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public ActionResult Index(int? _Page)
        {
            int PageNumber = (_Page ?? 1);
            int PageSize = 10;
            return View(db.DonHangs.ToList().OrderBy(n => n.MaDonHang).ToPagedList(PageNumber, PageSize));
        }

        [HttpGet]
        public ActionResult ChinhSua(int _MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == _MaDonHang);
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(donhang);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChinhSua(DonHang _DonHang)
        {
            if (!ModelState.IsValid)
            {
                return View(_DonHang);
            }
            db.Entry(_DonHang).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Xoa(int _MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == _MaDonHang);
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(donhang);
        }

        [HttpPost, ActionName("Xoa")]
        [ValidateInput(false)]
        public ActionResult XacNhanXoa(int _MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == _MaDonHang);
            List<ChiTietDonHang> lstChiTietDonHang = db.ChiTietDonHangs.Where(n => n.MaDonHang == _MaDonHang).ToList();
            if ((donhang == null) || (lstChiTietDonHang.Count > 0))
            {
                if (donhang == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                if (lstChiTietDonHang.Count > 0)
                {
                    return View(donhang);
                }
            }
            db.DonHangs.Remove(donhang);
            db.SaveChanges();

            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            if (kh == null) return RedirectToAction("Index", "Home");
            using (var db = new QuanLyBanDienThoaiModel1())
            {
                db.Logs.Add(new Log
                {
                    Email = kh.Email,
                    Time = DateTime.Now,
                    Message = $"Người Dùng {kh.HoTen} đã vừa XÓA Đơn hàng  {donhang.MaDonHang} vào lúc {DateTime.Now}"
                });

                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }


        public ActionResult HienThi(int _MaDonHang)
        {
            DonHang donhang = db.DonHangs.SingleOrDefault(n => n.MaDonHang == _MaDonHang);
            if (donhang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(donhang);
        }

    }
}