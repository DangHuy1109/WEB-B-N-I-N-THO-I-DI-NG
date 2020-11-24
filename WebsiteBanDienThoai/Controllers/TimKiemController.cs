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
    public class TimKiemController : Controller
    {
        // GET: TimKiem
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        [HttpPost]
        public ActionResult KetQuaTimKiem(FormCollection fc, int? _Page)
        {
            string TuKhoa = fc["txtTimKiem"].ToString().Trim();
            ViewBag.TuKhoa = TuKhoa;
            List<DienThoai> lstSach = db.DienThoais.Where(n => n.TenDienThoai.Contains(TuKhoa) && n.SoLuongTon > 0).ToList();
            int pageNumber = (_Page ?? 1);
            int pageSize = 9;
            if (lstSach.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy Điện thoại bạn yêu cầu !";
                return View(db.DienThoais.OrderBy(n => n.TenDienThoai).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstSach.Count.ToString() + " điện thoại :";
            return View(lstSach.OrderBy(n => n.TenDienThoai).ToPagedList(pageNumber, pageSize));
        }

        [HttpGet]
        public ActionResult KetQuaTimKiem(string _TuKhoa, int? _Page)
        {
            ViewBag.TuKhoa = _TuKhoa;
            List<DienThoai> lstSach = db.DienThoais.Where(n => n.TenDienThoai.Contains(_TuKhoa) && n.SoLuongTon > 0).ToList();
            int pageNumber = (_Page ?? 1);
            int pageSize = 9;
            if (lstSach.Count == 0)
            {
                ViewBag.ThongBao = "Không tìm thấy điện thoại bạn yêu cầu !";
                return View(db.DienThoais.OrderBy(n => n.TenDienThoai).ToPagedList(pageNumber, pageSize));
            }
            ViewBag.ThongBao = "Đã tìm thấy " + lstSach.Count.ToString() + " điện thoại :";
            return View(lstSach.OrderBy(n => n.TenDienThoai).ToPagedList(pageNumber, pageSize));
        }
    }
}