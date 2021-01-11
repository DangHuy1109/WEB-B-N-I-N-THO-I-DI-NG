use master
IF exists(select * from sysdatabases where name='test')
	drop database test
create database [QuanLyBanDienThoai]

go
USE [QuanLyBanDienThoai]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime] NULL,
	[Email] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Logs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [datetime] NULL,
	[Quyen] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
	[DuyetDonHang] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDienThoai] [int] IDENTITY(1,1) NOT NULL,
	[TenDienThoai] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaNCC] [int] NULL,
	[MaLoai] [int] NULL,
	[Moi] [int] NULL,
 CONSTRAINT [PK_DienThoai] PRIMARY KEY CLUSTERED 
(
	[MaDienThoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 12/29/2020 22:56:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaDienThoai] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
	[HoTen] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaDienThoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_ChiTietDonHang_DienThoai]    Script Date: 12/29/2020 22:56:30 ******/
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DienThoai] FOREIGN KEY([MaDienThoai])
REFERENCES [dbo].[DienThoai] ([MaDienThoai])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DienThoai]
GO
/****** Object:  ForeignKey [FK_ChiTietDonHang_DonHang]    Script Date: 12/29/2020 22:56:30 ******/
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
/****** Object:  ForeignKey [FK_DienThoai_Loai]    Script Date: 12/29/2020 22:56:30 ******/
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_Loai]
GO
/****** Object:  ForeignKey [FK_DienThoai_NhaCungCap]    Script Date: 12/29/2020 22:56:30 ******/
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_NhaCungCap]
GO
/****** Object:  ForeignKey [FK_DonHang_KhachHang]    Script Date: 12/29/2020 22:56:30 ******/
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO

create trigger tendienthoai
on DienThoai
for insert, update
as 
begin
	if (select count (*) from inserted, DienThoai where inserted.TenDienThoai = DienThoai.TenDienThoai)>1
	begin
		rollback
		raiserror ('Điện thoại này đã tồn tại',16,1)
		end
	end
select *from DienThoai
set identity_insert DienThoai ON
insert into DienThoai(MaDienThoai,TenDienThoai,GiaBan)
VALUES (2,'iPhoneX', 1.5)
SET IDENTITY_INSERT DienThoai OFF

create trigger tenkhachhang
on KhachHang
for insert, update
as 
begin
	if (select count (*) from inserted, KhachHang where inserted.HoTen = KhachHang.HoTen )>1
	begin
		rollback
		raiserror ('Tên khách hàng đã tồn tại',16,1)
		end
	end
select *from KhachHang
set identity_insert KhachHang ON
insert into KhachHang(MaKH,HoTen,TaiKhoan)
VALUES (5,'Lam Hoai Bao', 'vip')
SET IDENTITY_INSERT KhachHang OFF




create trigger email
on KhachHang
for insert, update
as 
begin
	if (select count (*) from inserted, KhachHang where inserted.Email = KhachHang.Email )>1
	begin
		rollback
		raiserror ('Email này đã tồn tại',16,1)
		end
	end
select *from KhachHang
set identity_insert KhachHang ON
insert into KhachHang(MaKH,Email)
VALUES (5,'Lamhoaibao@gmail.com')
SET IDENTITY_INSERT KhachHang OFF



create trigger sodienthoai
on KhachHang
for insert, update
as 
begin
	if (select count (*) from inserted, KhachHang where inserted.DienThoai = KhachHang.DienThoai )>1
	begin
		rollback
		raiserror ('Số điện thoại này đã tồn tại',16,1)
		end
	end
select *from KhachHang
set identity_insert KhachHang ON
insert into KhachHang(MaKH,DienThoai)
VALUES (2,'0779100159')
SET IDENTITY_INSERT KhachHang OFF





create trigger tennhacungcap
on NhaCungCap
for insert, update
as 
begin
	if (select count (*) from inserted, NhaCungCap where inserted.TenNCC = NhaCungCap.TenNCC)>1
	begin
		rollback
		raiserror ('Tên nhà cung cấp này đã tồn tại',16,1)
		end
	end
select *from NhaCungCap
set identity_insert NhaCungCap ON
insert into NhaCungCap(MaNCC,TenNCC)
VALUES (2,'Hoa sen')
SET IDENTITY_INSERT NhaCungCap OFF




create trigger SDTNCC
on NhaCungCap
for insert, update
as 
begin
	if (select count (*) from inserted, NhaCungCap where inserted.DienThoai = NhaCungCap.DienThoai)>1
	begin
		rollback
		raiserror ('Số điện thoại nhà cung cấp này đã tồn tại',16,1)
		end
	end
select *from NhaCungCap
set identity_insert NhaCungCap ON
insert into NhaCungCap(MaNCC,DienThoai)
VALUES (23,'0779100159')
SET IDENTITY_INSERT NhaCungCap OFF
select * from DienThoai

create proc sp_themsanphammoi @tendienthoai nvarchar(50), @giaban decimal, @mota nvarchar(max), @anhbia nvarchar(50), @ngaycapnhat date, @soluongton int, @mancc int, @maloai int, @moi int, @madienthoai int
as
begin
	declare @stt int
	set	@stt = 1
	while (exists (select * from DienThoai Where MaDienThoai = @stt ))
	set @stt = @stt + 1
	if exists (select * from DienThoai where MaDienThoai = @madienthoai and TenDienThoai = @tendienthoai and @giaban = GiaBan and @mota = MoTa and AnhBia = @anhbia and NgayCapNhat = @ngaycapnhat and SoLuongTon = @soluongton and MaNCC = @mancc and MaLoai = @maloai and Moi = @moi) 
		raiserror ('Đã tồn tại điện thoại này',16,1)
	else
		insert into DienThoai(MaDienThoai, TenDienThoai, GiaBan, MoTa, AnhBia, NgayCapNhat, SoLuongTon, MaNCC, MaLoai, Moi)
		values ( @madienthoai, @tendienthoai, @giaban, @mota, @anhbia, @ngaycapnhat, @soluongton, @mancc, @maloai, @moi)
	end
select * from DienThoai
SET IDENTITY_INSERT DienThoai ON
SET IDENTITY_INSERT DienThoai OFF

exec sp_themsanphammoi 'iphone3', 1.500, 'khong', 'anh bia', '1/1/2021', 10, 1, 1, 3, 4

SET IDENTITY_INSERT NhaCungCap OFF
SET IDENTITY_INSERT NhaCungCap ON

select * from NhaCungCap
insert into NhaCungCap (MaNCC,TenNCC,DiaChi,DienThoai)
values (2,'Hoa', '42phandinhphung', '0903857349')

select * from Loai
insert into Loai (MaLoai, TenLoai)
values (1, 'iphone')





create proc sp_themloai @maloai int, @tenloai nvarchar(50)
as
begin
	declare @stt int
	set	@stt = 1
	while (exists (select * from Loai Where MaLoai = @stt ))
	set @stt = @stt + 1
	if exists (select * from Loai where MaLoai = @maloai and TenLoai = @tenloai) 
		raiserror ('Loại sản phẩm này đã tồn tại',16,1)
	else
		insert into Loai(MaLoai, TenLoai)
		values ( @maloai, @tenloai)
	end


SET IDENTITY_INSERT Loai OFF
SET IDENTITY_INSERT Loai ON
exec sp_themloai 2, 'samsung'

select * from Loai
insert into Loai (MaLoai, TenLoai)
values (1, 'iphone')

create proc sp_themnhacungcap @manhacc int, @tennhacc nvarchar(50) ,@diachi nvarchar(200) 
as
begin
	declare @stt int
	set	@stt = 1
	while (exists (select * from NhaCungCap Where MaNCC = @stt ))
	set @stt = @stt + 1
	if exists (select * from NhaCungCap where MaNCC = @manhacc and TenNCC = @tennhacc) 
		raiserror ('Nhà Cung Cấp sản phẩm này đã tồn tại',16,1)
	else
		insert into NhaCungCap(MaNCC, TenNCC)
		values ( @manhacc, @tennhacc)
	end



create proc sp_themkhachhang @makh int, @hoten nvarchar(50), @taikhoan nvarchar(50), @matkhau nvarchar(50), @email nvarchar(50), @diachi nvarchar(50), @dienthoai nvarchar(50), @gioitinh nvarchar(50), @ngaysinh datetime, @quyen int
as
begin
	declare @stt int
	set	@stt = 1
	while (exists (select * from KhachHang Where MaKH = @stt ))
	set @stt = @stt + 1
	if exists (select * from KhachHang where MaKH = @makh and HoTen = @hoten and TaiKhoan = @taikhoan and MatKhau = @matkhau and Email = @email and DiaChi = @diachi and DienThoai = @dienthoai and GioiTinh = @gioitinh and NgaySinh = @ngaysinh and Quyen = @quyen)
		raiserror ('Khách hàng này đã tồn tại',16,1)
	else
		insert into KhachHang(MaKH,HoTen,TaiKhoan,MatKhau,Email,DiaChi,DienThoai,GioiTinh,NgaySinh,Quyen)
		values ( @makh, @hoten, @taikhoan,@matkhau,@email,@diachi,@dienthoai, @gioitinh, @ngaysinh, @quyen)
	end

SET IDENTITY_INSERT KhachHang OFF
SET IDENTITY_INSERT KhachHang ON
select * from KhachHang
exec sp_themkhachhang 3,'le van luyen', 'lamhoaibao', 'u7270051', 'mrsimplevn@gmail.com', '42phandinhphung', '0908836358', 'nam', '1/1/2021', 1


delete Loai

create proc sp_xoakhachhang
							@ma_khachhang smallint
as
begin
	begin tran
				declare @result int
				exec @result = run_xoakhachhang @ma_khachhang
				if @result = 1
				begin
					raiserror ('khách hàng không tồn tại',16,1)
					rollback tran
					return 1
				end
			commit tran
		end
create proc run_xoakhachhang 
				@ma_khachhang smallint
as
begin
	if not exists ( select * from KhachHang where MaKH = @ma_khachhang )
		return 1
		begin
			delete from KhachHang where MaKH = @ma_khachhang
		end	
end
select * from KhachHang


exec sp_xoakhachhang 3 


select * from DienThoai
select * from Loai
select * from NhaCungCap




create proc sp_xoadienthoai
							@ma_dienthoai smallint
as
begin
	begin tran
				declare @result int
				exec @result = run_xoadienthoai @ma_dienthoai
				if @result = 1
				begin
					raiserror ('điện thoại không tồn tai',16,1)
					rollback tran
					return 1
				end
			commit tran
		end

create proc run_xoadienthoai 
				@ma_dienthoai smallint
as
begin
	if not exists ( select * from DienThoai where MaDienThoai = @ma_dienthoai )
		return 1
		begin
			delete from DienThoai where MaDienThoai = @ma_dienthoai
		end	
end
select * from DienThoai

exec sp_xoadienthoai 4

select *from NhaCungCap

create proc sp_XoaNCC
							@ma_ncc smallint
as
begin
	begin tran
				declare @result int
				exec @result = run_XoaNCC @ma_ncc
				if @result = 1
				begin
					raiserror ('Nhà cung cấp không tồn tai',16,1)
					rollback tran
					return 1
				end
			commit tran
		end

create proc run_XoaNCC 
				@ma_ncc smallint
as
begin
	if not exists ( select * from NhaCungCap where MaNCC = @ma_ncc )
		return 1
		begin
			delete from NhaCungCap where MaNCC = @ma_ncc
		end	
end
select * from NhaCungCap

exec sp_XoaNCC 2





create proc sp_XoaLoai
							@ma_loai smallint
as
begin
	begin tran
				declare @result int
				exec @result = run_XoaLoai @ma_loai
				if @result = 1
				begin
					raiserror ('Loại này không tồn tai',16,1)
					rollback tran
					return 1
				end
			commit tran
		end

create proc run_XoaLoai
				@ma_loai smallint
as
begin
	if not exists ( select * from Loai where MaLoai = @ma_loai )
		return 1
		begin
			delete from Loai where MaLoai = @ma_loai
		end	
end
select * from Loai
exec sp_XoaLoai 2

create trigger trg_pass
on KhachHang
for insert, update
as
begin
	IF EXISTS(SELECT * FROM inserted WHERE MatKhau IS NULL OR MatKhau = '')
	BEGIN
		RAISERROR('Mật khẩu không được để trống', 16, 1)
		ROLLBACK
	END
END
GO

create trigger trg_dienthoai
on KhachHang
for insert, update
as
begin
	IF EXISTS(SELECT * FROM inserted WHERE DienThoai IS NULL OR DienThoai = '')
	BEGIN
		RAISERROR('Điện thoại không được để trống', 16, 1)
		ROLLBACK
	END
END
GO



CREATE TRIGGER trg_Soluong
ON DienThoai
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted WHERE SoLuongTon > 40)
	BEGIN
		RAISERROR('Không được nhập quá 40', 16, 1)
		ROLLBACK
	END
END
GO
select * from DienThoai

CREATE TRIGGER trg_giaban
ON DienThoai
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted WHERE GiaBan < 0)
	BEGIN
		RAISERROR('Gía tiền không hợp lệ', 16, 1)
		ROLLBACK
	END
END
GO



----- đăng nhập
CREATE PROC sp_DangNhap
				@email varchar(10),
				@matkhau nvarchar(20)
AS
BEGIN	
	SELECT * FROM KhachHang WHERE Email=@email AND MatKhau=@matkhau
END
GO

--- xem danh sách tài khoản
CREATE PROC sp_LietKeTaiKhoan
AS
BEGIN
	SELECT * FROM KhachHang
END
GO




exec sp_LietKeTaiKhoan
select * from KhachHang



--- quyen tai khoan 1: admin 2 la khach hang
CREATE TRIGGER trg_quyenkhachhang
ON KhachHang
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted WHERE Quyen != 1 AND Quyen != 2)
	BEGIN
		RAISERROR('Loại tài khoản không hợp lệ', 16, 1)
		ROLLBACK
	END
END
GO




CREATE PROC sp_TaoTaiKhoan
				@taikhoan nvarchar(100),
				@matkhau nvarchar(50),
				@quyen int
AS
BEGIN	
	DECLARE @makh smallint
	SET @makh = 1
	BEGIN TRY
		BEGIN TRAN
			SELECT * FROM KhachHang with (updlock)
			WHILE EXISTS( SELECT * FROM KhachHang WHERE MaKH=@makh)
				SET @makh = @makh + 1
			INSERT INTO KhachHang(MaKH, TaiKhoan, MatKhau, Quyen) VALUES(@makh, @taikhoan, @matkhau, @quyen)
			EXEC('CREATE USER [' + @taikhoan + '] WITHOUT LOGIN')			
			IF @quyen=1
			BEGIN
				EXEC('sp_AddRoleMember QuanLy, [' + @taikhoan + ']')
			END
			ELSE IF @quyen =2 
			BEGIN
				EXEC('sp_AddRoleMember KhachHang, [' + @taikhoan + ']')
			END
			
			EXEC('GRANT IMPERSONATE ON USER::[' + @taikhoan +']  to Client')
		COMMIT
	END TRY		
	BEGIN CATCH
		ROLLBACK
		DECLARE @msg nvarchar(200)
		SET @msg = ERROR_MESSAGE()
		RAISERROR(@msg, 16, 1)
	END CATCH
END
GO



-- xoá tài khoản

CREATE PROC sp_xoataikhoan
				@makh smallint
AS
BEGIN
	DECLARE @taikhoan nvarchar(20)
	SELECT @taikhoan = TaiKhoan FROM KhachHang WHERE MaKH=@makh
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM KhachHang WHERE MaKH=@makh
			EXEC('REVOKE IMPERSONATE ON USER::[' + @taikhoan +'] FROM Client')
			EXEC('DROP USER [' + @taikhoan + ']')
		COMMIT
	END TRY		
	BEGIN CATCH
		ROLLBACK
		DECLARE @msg nvarchar(200)
		SET @msg = ERROR_MESSAGE()
		RAISERROR(@msg, 16, 1)
	END CATCH
END
GO
