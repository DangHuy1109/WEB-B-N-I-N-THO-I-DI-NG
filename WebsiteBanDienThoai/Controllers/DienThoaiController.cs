using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;

namespace WebsiteBanDienThoai.Controllers
{
    public class DienThoaiController : Controller
    {
        // GET: DienThoai
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public PartialViewResult DienThoaiMoiPartial()
        {
            var lstDienThoaiMoi = db.DienThoais.Where(n => n.SoLuongTon > 0).Take(3).ToList();
            return PartialView(lstDienThoaiMoi);
        }

        public ViewResult XemChitiet(int _MaDienThoai = 0)
        {
            DienThoai dienThoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == _MaDienThoai);
            if (dienThoai == null)
            {
                //trả về trang báo lỗi
                Response.StatusCode = 404;
                return null;
            }

            return View(dienThoai);
        }
    }
}