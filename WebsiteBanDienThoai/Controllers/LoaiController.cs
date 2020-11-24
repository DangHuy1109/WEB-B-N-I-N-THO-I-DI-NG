using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;

namespace WebSiteBanDienThoai.Controllers
{
    public class LoaiController : Controller
    {
        // GET: Loại
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public ActionResult LoaiPartial()
        {
            return PartialView(db.Loais.Take(3).ToList());
        }
        //Tìm Loại theo Loại
        public ViewResult DienThoaiTheoLoai(int _MaLoai = 0)
        {

            Loai loai = db.Loais.SingleOrDefault(n => n.MaLoai == _MaLoai); // Loại trả về 1 chủ đề, nếu không có chủ đề đó nó sẽ báo null
            //Kiểm tra loại có tồn tại hay không
            if (loai == null)
            {
                Response.StatusCode = 404;
                return View();
            }
            //Truy xuất các danh Loại theo chủ đề
            List<DienThoai> lstDienThoai = db.DienThoais.Where(n => n.MaLoai == _MaLoai && n.SoLuongTon > 0).OrderBy(n => n.GiaBan).ToList();
            if (lstDienThoai.Count == 0)
            {
                ViewBag.DienThoai = "Không có DienThoai nào thuộc Chủ đề này!";
            }
            return View(lstDienThoai);
        }
        //Hiển thị các chủ đề khác
        public ViewResult DanhMucLoai()
        {
            return View(db.Loais.ToList());
        }
    }
}