using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanDienThoai.Models;

namespace WebSiteBanSach.Controllers
{
    public class GioHangController : Controller
    {

        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();

        #region Gio hang
        //Lấy giỏ hàng
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                //Nếu giỏi hàng chưa tồn tại thì tiến hành khởi tạo list giỏ hàng (sessionGioHang) (session dùng để lưu đến khi tắt trang web)
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //Thêm giỏ hàng
        public ActionResult ThemGioHang(int __MaDienThoai, string strURL)
        {
            // kiểm tra mã sách có hay không
            DienThoai dienthoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == __MaDienThoai);
            if (dienthoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy ra session giỏ hàng
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra sản phẩm này tồn tại trong session[giohang] chưa
            GioHang _GioHang = lstGioHang.Find(n => n._MaDienThoai == __MaDienThoai);
            if (_GioHang == null)
            {
                _GioHang = new GioHang(__MaDienThoai);
                //Thêm sản phẩm vào list
                lstGioHang.Add(_GioHang);

                return RedirectToAction("Index", "Home");
            }
            else
            {
                if (_GioHang._SoLuong < dienthoai.SoLuongTon)
                {
                    _GioHang._SoLuong++;

                }
                else
                {

                    string err = "SẢN PHẨM BẠN VỪA CHỌN ĐÃ HẾT HÀNG :(";
                    return RedirectToAction("Index", "Home", new { @err = err });
                }


                return RedirectToAction("Index", "Home");
            }
        }
        //Cập nhật giỏ hàng
        public ActionResult CapNhatGioHang(int __MaDienThoai, FormCollection fc)
        {
            //Kiểm tra mã sp
            DienThoai dienthoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == __MaDienThoai);
            if (dienthoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            List<GioHang> lstGioHang = LayGioHang();// lấy giỏ hàng ra từ session
            //Kiểm tra sản phẩm có tồn tại trong session[GioHang]
            GioHang giohang = lstGioHang.SingleOrDefault(n => n._MaDienThoai == __MaDienThoai);
            //Nếu mà tồn tại, sửa số lượng
            if (giohang != null)
            {
                int SoLuong = Convert.ToInt32(fc["txtSoLuong"].ToString());
                if (SoLuong > 0)
                {
                    if (SoLuong >= dienthoai.SoLuongTon)
                    {
                        giohang._SoLuong = Convert.ToInt32(dienthoai.SoLuongTon);
                    }
                    else
                    {
                        giohang._SoLuong = SoLuong;
                    }
                }
                else
                {
                    lstGioHang.RemoveAll(n => n._MaDienThoai == __MaDienThoai);
                }
                if (lstGioHang.Count == 0)
                {
                    Session["GioHang"] = null;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return RedirectToAction("GioHang");
                }
            }
            return RedirectToAction("GioHang");
        }
        //Xóa giỏ hàng
        public ActionResult XoaGioHang(int __MaDienThoai)
        {
            // kiểm tra mã sp
            DienThoai dienthoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == __MaDienThoai);
            if (dienthoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // lấy giỏ hàng ra từ session
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra sản phẩm có tồn tại trong session[GioHang]
            GioHang giohang = lstGioHang.SingleOrDefault(n => n._MaDienThoai == __MaDienThoai);
            //NẾu tồn tại thì cho xóa
            if (giohang != null)
            {
                lstGioHang.RemoveAll(n => n._MaDienThoai == __MaDienThoai);
            }
            //Nếu giỏ hàng rỗng trả về home
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("GioHang");
        }
        //Xây dựng trang giỏ hàng
        public ActionResult GioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        //Tính tổng số lượng và tổng tiền
        private int TongSoLuong()
        {
            int _TongsoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                _TongsoLuong = lstGioHang.Sum(n => n._SoLuong);
            }
            return _TongsoLuong;
        }

        private double TongTien()
        {
            double _TongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                _TongTien = lstGioHang.Sum(n => n._ThanhTien);
            }
            return _TongTien;
        }
        // tạo partial giỏ hàng
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            return PartialView();
        }

        public ActionResult GioHangTongTien()
        {
            if (TongTien() <= 0)
            {
                return PartialView();
            }
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        //Xây dựng view cho người dùng chỉnh sửa giỏ hàng
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        #endregion

        #region Dat hang
        //Xây dựng chức năng đặt hàng
        [HttpPost]
        public ActionResult DatHang()
        {
            //Kiểm tra đăng nhập
            if ((Session["TaiKhoan"] == null) || (Session["TaiKhoan"].ToString() == ""))
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            //Kiểm tra giỏ hàng
            if (Session["GioHang"] == null)
            {
                RedirectToAction("Index", "Home");
            }
            //thêm đơn hàng
            DonHang dh = new DonHang();
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            List<GioHang> gh = LayGioHang();
            dh.MaKH = kh.MaKH;
            dh.DaThanhToan = Convert.ToInt32(TongTien());
            dh.TinhTrangGiaoHang = 0;
            dh.NgayDat = DateTime.Now;
            dh.NgayGiao = DateTime.Now;
            db.DonHangs.Add(dh);
            db.SaveChanges();
            //Thêm chi tiết đơn hàng 
            foreach (var item in gh)
            {
                ChiTietDonHang ctdh = new ChiTietDonHang();
                ctdh.MaDonHang = dh.MaDonHang;
                ctdh.MaDienThoai = item._MaDienThoai;
                ctdh.SoLuong = item._SoLuong;
                ctdh.DonGia = item._DonGia.ToString();
                db.ChiTietDonHangs.Add(ctdh);

                DienThoai dienthoai = db.DienThoais.SingleOrDefault(n => n.MaDienThoai == item._MaDienThoai);
                dienthoai.SoLuongTon -= item._SoLuong;
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("ThongBao", "GioHang");
        }

        public ActionResult HoaDon()
        {
            if ((Session["TaiKhoan"] == null) || (Session["TaiKhoan"].ToString() == ""))
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            if (Session["GioHang"] == null)
            {
                RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.KhachHang = (KhachHang)Session["TaiKhoan"];
            return View(lstGioHang);
        }
        public ActionResult ThongBao()
        {
            return View();
        }
        #endregion
    }
}