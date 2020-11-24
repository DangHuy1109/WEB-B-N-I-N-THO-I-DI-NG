using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;

namespace WebsiteBanDienThoai.Controllers
{
    public class NhaCungCapController : Controller
    {
        // GET: NhaCungCao
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public PartialViewResult NhaCungCapPartial()
        {
            return PartialView(db.NhaCungCaps.Take(6).OrderBy(ncc => ncc.MaNCC).ToList());
        }
        //Hiển thị sách theo nhà cung cấp
        public ViewResult DienThoaiTheoNCC(int _MaNCC)
        {
            //Kiểm tra NXB có tồn tại không
            NhaCungCap ncc = db.NhaCungCaps.SingleOrDefault(n => n.MaNCC == _MaNCC);
            if (ncc == null)
            {
                Response.StatusCode = 404;
                return View();
            }
            //Truy  Xuất danh sách các sách NXB
            List<DienThoai> lstDienThoai = db.DienThoais.Where(n => n.MaNCC == _MaNCC && n.SoLuongTon > 0).OrderBy(n => n.GiaBan).ToList();
            //Xem thử có NXB nào đó không
            if (lstDienThoai.Count == 0)
            {
                ViewBag.DienThoai = "Không có Điện Thoại của Nhà cung cấp này!";
            }
            return View(lstDienThoai);
        }
        //Hiển thị các NXB
        public ViewResult DanhMucNCC()
        {
            return View(db.NhaCungCaps.ToList());
        }
    }
}