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
    public class HomeController : Controller
    {
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1(); // Khởi tạo database

        public ActionResult Index(int? _Page, string err)
        {
            if (err != null)
            {
                ViewBag.Thongbao = err;
            }
            else
            {
                ViewBag.Thongbao = null;
            }

            int PageSize = 9;
            int PageNumber = (_Page ?? 1);
            return View(db.DienThoais.Where(n => n.SoLuongTon > 0).OrderBy(n => n.MaDienThoai).ToPagedList(PageNumber, PageSize));
        }

        public PartialViewResult DienThoaiMoiPartial()
        {
            var lstDienThoaiMoi = db.DienThoais.Take(15).ToList(); //Câu truy vấn để lấy số lượng điện thoại mới
            return PartialView(lstDienThoaiMoi);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}