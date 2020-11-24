using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebsiteBanDienThoai.Models
{
    public class GioHang
    {
        QuanLyBanDienThoaiModel1 db = new QuanLyBanDienThoaiModel1();
        public int _MaDienThoai { get; set; }
        public string _TenDienThoai { get; set; }
        public string _AnhBia { get; set; }
        public double _DonGia { get; set; }
        public int _SoLuong { get; set; }
        public double _ThanhTien
        {
            get { return _SoLuong * _DonGia; }
        }
        //Hàm tạo giỏ hàng
        public GioHang(int __MaDienThoai)
        {
            _MaDienThoai = __MaDienThoai;
            DienThoai dienthoai = db.DienThoais.Single(n => n.MaDienThoai == _MaDienThoai);//Ở đây chỉ cần dùng single, nếu sai đường dẫn thì bắt ở ctler
            _TenDienThoai = dienthoai.TenDienThoai;
            _AnhBia = dienthoai.AnhBia;
            _DonGia = Convert.ToDouble(dienthoai.GiaBan);
            _SoLuong = 1;
        }
    }
}