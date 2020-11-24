using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace WebsiteBanDienThoai.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        // GET: QuanLySanPham
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        //Trang hiển thi
        public ActionResult Index(int? _Page)
        {
            int PageNumber = (_Page ?? 1);
            int PageSize = 5;
            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            if (kh == null) return RedirectToAction("Index", "Home");
            ViewBag.Logs = db.Logs.OrderByDescending(log => log.Time).ToList();
            return View(db.DienThoais.ToList().OrderByDescending(n => n.MaDienThoai).ToPagedList(PageNumber, PageSize));
        }

        [HttpGet]
        public ActionResult ThemMoi()
        {
            //Đưa chủ đề vào dropdownList
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        //Thêm mới
        public ActionResult ThemMoi(DienThoai _DienThoai, HttpPostedFileBase FileUpload)
        {

            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList().OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            if (FileUpload == null)
            {
                ViewBag.ThongBao = "Chưa chọn Ảnh bìa";
                return View();
            }
            if (!ModelState.IsValid)
            {
                return View(_DienThoai);
            }
            //Lưu tên và đường dẫn của file
            var FileName = Path.GetFileName(FileUpload.FileName);
            var DuongDan = Path.Combine(Server.MapPath("~/HinhAnhSP"), FileName);
            //Kiểm tra hình ảnh đã tồn tại chưa           
            if (!System.IO.File.Exists(DuongDan))
            {
                FileUpload.SaveAs(DuongDan);
            }
            _DienThoai.AnhBia = FileUpload.FileName;
            _DienThoai.NgayCapNhat = DateTime.Now;
            db.DienThoais.Add(_DienThoai);
            db.SaveChanges();

            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            if (kh == null) return RedirectToAction("Index", "Home");
            using (var db = new QuanLyBanDienThoaiModel1())
            {
                db.Logs.Add(new Log
                {
                    Email = kh.Email,
                    Time = DateTime.Now,
                    Message = $"Quản Trị Viên {kh.HoTen} đã vừa THÊM điện thoại: {_DienThoai.TenDienThoai} vào lúc {DateTime.Now}"
                });
                ViewBag.Logs = db.Logs.OrderByDescending(log => log.Time).ToList();
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        //Chỉnh sửa
        [HttpGet]
        public ActionResult ChinhSua(int _MaDienThoai)
        {
            // lấy ra đối tượng điện thoại theo mã
            DienThoai dienThoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == _MaDienThoai);
            if (dienThoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai", dienThoai.MaLoai);
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList().OrderBy(n => n.TenNCC), "NhaCC", "TenNCC", dienThoai.MaNCC);
            return View(dienThoai);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ChinhSua(DienThoai _DienThoai, HttpPostedFileBase FileUpload)
        {
            //đưa dữ liệu vào dropdownlist
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai", _DienThoai.MaLoai);
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.ToList().OrderBy(n => n.TenNCC), "NhaCC", "TenNCC", _DienThoai.MaNCC);
            //kiểm tra ảnh bìa
            if (FileUpload == null)
            {
                ViewBag.ThongBao = "Chưa chọn Ảnh bìa";
                return View(_DienThoai);
            }
            //đưa vào csdl
            if (!ModelState.IsValid)
            {
                return View(_DienThoai);
            }
            var FileName = Path.GetFileName(FileUpload.FileName);
            var DuongDan = Path.Combine(Server.MapPath("~/HinhAnhSP"), FileName);
            if (!System.IO.File.Exists(DuongDan))
            {
                FileUpload.SaveAs(DuongDan);
            }
            _DienThoai.AnhBia = FileUpload.FileName;
            // thực hiện cập nhật model 
            db.Entry(_DienThoai).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            if (kh == null) return RedirectToAction("Index", "Home");
            using (var db = new QuanLyBanDienThoaiModel1())
            {
                db.Logs.Add(new Log
                {
                    Email = kh.Email,
                    Time = DateTime.Now,
                    Message = $"Quản Trị Viên {kh.HoTen} đã vừa CHỈNH SỬA điện thoại {_DienThoai.TenDienThoai} vào lúc {DateTime.Now}"
                });
                ViewBag.Logs = db.Logs.OrderByDescending(log => log.Time).ToList();
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult HienThi(int _MaDienThoai)
        {
            //Lấy danh điện thoại theo mã
            DienThoai dienThoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == _MaDienThoai);
            if (dienThoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dienThoai);
        }

        [HttpGet]
        //Xóa
        public ActionResult Xoa(int _MaDienThoai)
        {
            DienThoai dienThoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == _MaDienThoai);
            if (dienThoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(dienThoai);
        }

        [HttpPost, ActionName("Xoa")]
        [ValidateInput(false)]
        public ActionResult XacNhanXoa(int _MaDienThoai)
        {
            DienThoai dienThoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == _MaDienThoai);
            db.DienThoais.Remove(dienThoai);
            db.SaveChanges();

            KhachHang kh = Session["TaiKhoan"] as KhachHang;
            if (kh == null) return RedirectToAction("Index", "Home");
            using (var db = new QuanLyBanDienThoaiModel1())
            {
                db.Logs.Add(new Log
                {
                    Email = kh.Email,
                    Time = DateTime.Now,
                    Message = $"Quản Trị Viên {kh.HoTen} đã vừa XÓA điện thoại  {dienThoai.TenDienThoai } vào lúc {DateTime.Now}"
                });

                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}
