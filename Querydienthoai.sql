/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [QuanLyBanDienThoai]
GO
/****** Object:  Database [QuanLyBanDienThoai]    Script Date: 6/3/2020 11:17:41 PM ******/
CREATE DATABASE [QuanLyBanDienThoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanDienThoai', FILENAME = N'F:\WebSiteBanDienThoai\CSDL\QuanLyBanDienThoai.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyBanDienThoai_log', FILENAME = N'F:\WebSiteBanDienThoai\CSDL\QuanLyBanDienThoai_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyBanDienThoai] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyBanDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyBanDienThoai', N'ON'
GO
ALTER DATABASE [QuanLyBanDienThoai] SET QUERY_STORE = OFF
GO
USE [QuanLyBanDienThoai]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QuanLyBanDienThoai]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 6/3/2020 11:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaDienThoai] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 6/3/2020 11:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 6/3/2020 11:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/3/2020 11:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 6/3/2020 11:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/3/2020 11:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 6/3/2020 11:17:41 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaDienThoai], [SoLuong], [DonGia]) VALUES (51, 26, 2, N'12000     ')
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaDienThoai], [SoLuong], [DonGia]) VALUES (51, 27, 1, N'145000    ')
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaDienThoai], [SoLuong], [DonGia]) VALUES (52, 26, 2, N'12000     ')
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaDienThoai], [SoLuong], [DonGia]) VALUES (52, 27, 1, N'145000    ')
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaDienThoai], [SoLuong], [DonGia]) VALUES (1051, 5, 1, N'340000    ')
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (1, N'Công nghệ thông tin')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (2, N'Ngoại ngữ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (3, N'Phật Giáo và Thiên chúa giáo')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (4, N'Sách học làm người và Hơn thế nữa')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (5, N'Tiếng Bồ Đào Nha và Tiếng Hi Lạp')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (8, N'Tình yêu và Thù Hận')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (9, N'Chủ đề nào cũng được')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (10, N'Nhảm nhí nhưng vui lắm cơ')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (12, N'Lãng mạn là chết Chết là Lãng mạn')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (13, N'Đã thi xong rồi !')
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (51, 169000, 1, CAST(N'2020-05-08T16:47:18.000' AS DateTime), CAST(N'2020-05-08T16:47:18.000' AS DateTime), 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (52, 169000, 0, CAST(N'2020-05-08T16:53:34.410' AS DateTime), CAST(N'2020-05-08T16:53:34.410' AS DateTime), 1)
INSERT [dbo].[DonHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1051, 340000, 0, CAST(N'2020-05-16T11:45:32.977' AS DateTime), CAST(N'2020-05-16T11:45:32.977' AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (1, N'Nguyễn Quốc Tuấn', N'tuan123', N'123', N'tunganh0025492@gmail.com', N'Số 51 ngõ 211 Khương Trung, Thanh Xuân, Hà Nội', N'09654765432', N'Nam', CAST(N'1992-04-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (4, N'Cao Trí', N'tri123', N'123', N'taquangbuu@gmail.com', N'So 51 ngo 211', N'01665853332', N'Nam', CAST(N'1998-04-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (5, N'Thanh Lan', N'lan123', N'123', N'thangbui@gmail.com', N'So 51 ngo 211', N'01665853332', N'Nữ', CAST(N'1993-06-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (6, N'Yên Chi', N'chi123', N'123', N'tunganh0025492@gmail.com', N'So 51 ngo 211', N'01665853332', N'Nam', CAST(N'1992-04-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (7, N'Minh Quang', N'minh123', N'123', N'tunganh0025492@gmail.com', N'So 51 ngo 211', N'01665853332', N'Nam', CAST(N'1992-04-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (8, N'Quỳnh', N'quynh123', N'123', N'hoangthianh@gmail.com', N'So 51 ngo 211 Xuan Thuy Cau Giay', N'09875432134', N'Nữ', CAST(N'1993-02-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [Quyen]) VALUES (9, N'client', N'client123', N'123', N'bichngoc@gmail.com', N'So 51 ngo 211 Khương Thượng', N'01667854325', N'Nữ', CAST(N'1998-04-12T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([ID], [Time], [Email], [Message]) VALUES (66, CAST(N'2020-06-03T22:58:10.547' AS DateTime), N'tunganh0025492@gmail.com', N'Quản Trị Viên Nguyễn Quốc Tuấn đã vừa đăng nhập vào lúc 6/3/2020 10:58:10 PM')
INSERT [dbo].[Logs] ([ID], [Time], [Email], [Message]) VALUES (67, CAST(N'2020-06-03T22:58:30.610' AS DateTime), N'tunganh0025492@gmail.com', N'Quản Trị Viên Nguyễn Quốc Tuấn đã vừa đăng nhập vào lúc 6/3/2020 10:58:30 PM')
INSERT [dbo].[Logs] ([ID], [Time], [Email], [Message]) VALUES (68, CAST(N'2020-06-03T22:59:31.810' AS DateTime), N'tunganh0025492@gmail.com', N'Quản Trị Viên Nguyễn Quốc Tuấn đã vừa đăng nhập vào lúc 6/3/2020 10:59:31 PM')
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (1, N'Nhà xuất bản Trẻ Trung', N'Ngã Tư Sở', N'1900156045')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (2, N'Nhà xuất bản Thống Kê', N'Trường Chinh', N'1900190089')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (3, N'Nhà xuất bản Kim Đồng', N'Khương Trung', N'1900123456')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (4, N'Nhà xuất bản Lao Động', N'Thanh Xuân', N'1900678904')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (6, N'Nhà xuất bản Vì Công Lý', N'so 100 ngo Truong Chinh Thanh Xuan', N'01238115330')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (8, N'Nhà xuất bản Pháp Luật', N'Học viện kĩ thuật quân sự', N'0991892389348')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (9, N'Cứ làm thế đi rồi sẽ chết', N'Ở đâu chẳng được', N'01238556798')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (10, N'Nhà xuất bản đệp để chết', N'so 45 ngo 324 khương trung', N'02345768346')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (11, N'Nhà xuất bản Đã Xong !', N'Hoàng Quốc Việt Hà Nội', N'017768594832')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (12, N'Nhà xuất bản Chỉ biết Tiền', N'Số 51 ngõ 544 Hải phòng', N'01769564732')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (13, N'Đã thi xong rồi!', N'Số nhà Đã thi xong', N'098675432')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[DienThoai] ON 

INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (5, N'Ngôn ngữ Python', CAST(340000 AS Decimal(18, 0)), N'<p>Kiến thức cơ bản về ng&ocirc;n ngữ lập tr&igrave;nh Python</p>', N'5.jpg', NULL, 1, 1, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (6, N'Truyện Kiều của Nguyễn Du', CAST(123000 AS Decimal(18, 0)), N'<p>V&otilde; Nguy&ecirc;n Gi&aacute;p</p>', N'1.jpg', NULL, 0, 10, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (10, N'Từ điển Anh - Việt', CAST(1209000 AS Decimal(18, 0)), N'Vua moi them vao SQL', N'6.jpg', CAST(N'2020-07-08T00:00:00.000' AS DateTime), 0, 2, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (11, N'Bí mật hành tinh Tím', CAST(134000 AS Decimal(18, 0)), N'thì đã lấm sao nà, tinh yêu đâu co stoiij', N'7.jpg', CAST(N'2013-04-05T00:00:00.000' AS DateTime), 0, 4, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (14, N'Hậu duệ mặt trời', CAST(13000 AS Decimal(18, 0)), N'Em chưa bao giwof xem Hậu duệ mặt tròi', N'8.jpg', CAST(N'2016-05-26T00:00:00.000' AS DateTime), 0, 4, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (22, N'abc là xề bánh đúc', CAST(123000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'41.jpg', CAST(N'2016-07-07T00:00:00.000' AS DateTime), 0, 2, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (23, N'Vien keo ngot', CAST(123000 AS Decimal(18, 0)), N'<p>Hello, World!Thich the nao cung duoc</p>', N'Vien_Keo.jpg', CAST(N'2018-06-08T00:00:00.000' AS DateTime), 0, 2, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (24, N'abc', CAST(123000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'Tiffany_SNSD.jpg', CAST(N'2011-02-03T00:00:00.000' AS DateTime), 0, 2, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (26, N'Buc tuong', CAST(12000 AS Decimal(18, 0)), N'<p>Hello, World! Vừa sưR XONG !</p>', N'66.jpg', CAST(N'2011-02-02T00:00:00.000' AS DateTime), 2895, 1, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (27, N'Moi tinh luon', CAST(145000 AS Decimal(18, 0)), N'<p>Hello, World! Vua moi tai ve xong</p>', N'10.jpg', CAST(N'2018-04-05T00:00:00.000' AS DateTime), 141, 1, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (28, N'Nhung ki uc kinmh hoang', CAST(134000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'11.jpg', CAST(N'2014-03-02T00:00:00.000' AS DateTime), 133999, 4, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (29, N'Em la ba noi cua anh', CAST(109000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'12.jpg', CAST(N'2014-03-04T00:00:00.000' AS DateTime), 120, 4, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (30, N'Huyen thoai ve Dai tuong Vo nguyen Giap', CAST(1000000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'1.jpg', CAST(N'2013-04-05T00:00:00.000' AS DateTime), 0, 2, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (31, N'Tao la ba noi cua may', CAST(12300000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'19.jpg', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 143679, 1, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (32, N'anh la nguoi tunh cua em', CAST(132000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'15.JPG', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 1321, 2, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (33, N'Bup be ma la anh day', CAST(143000 AS Decimal(18, 0)), N'<p>Hello, World! cai quai gi the nay</p>', N'18.jpg', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 145000, 2, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (34, N'Cu the xem sao moi biet duoc chu', CAST(134000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'17.jpg', CAST(N'2011-02-03T00:00:00.000' AS DateTime), 134000, 1, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (35, N'Thu voi Project cu', CAST(1320000 AS Decimal(18, 0)), N'<p>Hello, World! oh yeah</p>', N'21.jpg', CAST(N'2011-02-03T00:00:00.000' AS DateTime), 134900, 1, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (37, N'Trà sữa cho Tâm hồn', CAST(234098 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'4.jpg', CAST(N'2016-04-05T00:00:00.000' AS DateTime), 123098, 2, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (38, N'abc la cba', CAST(123098 AS Decimal(18, 0)), N'<p>Hello, World! dang them quan ly nha xuat ban</p>', N'2.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 12904, 1, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (39, N'Vì Công Lý ta chiến đấu', CAST(1320000 AS Decimal(18, 0)), N'<p>Hello, World! Da xong tuong doi roi</p>', N'16.jpg', CAST(N'2020-02-03T00:00:00.000' AS DateTime), 130293, 6, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (40, N'Anh là Siêu Nhân đây !', CAST(123390 AS Decimal(18, 0)), N'<p>Hello, World! minh la ai va ai la minh</p>', N'20.jpg', CAST(N'2020-06-07T00:00:00.000' AS DateTime), 12789, 6, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (41, N'Ai la chông của em', CAST(129348 AS Decimal(18, 0)), N'<p>Hello, World! &aacute; &agrave; ! &agrave; &aacute;</p>', N'22.jpg', CAST(N'2018-04-05T00:00:00.000' AS DateTime), 12567, 3, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (43, N'Hãy làm vowja nh nhé', CAST(90120 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'23.JPG', CAST(N'2020-06-05T00:00:00.000' AS DateTime), 123000, 6, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (44, N'Hãy là kẻ thù của Anh hé em!', CAST(129000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'24.JPG', CAST(N'2020-06-07T00:00:00.000' AS DateTime), 14500, 8, 8, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (45, N'Mà sao em biết tên anh', CAST(789065 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'25.JPG', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 345609, 8, 8, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (46, N'Em là tình yêu muôn  thưở cua anh', CAST(2390 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'26.png', CAST(N'2020-04-06T00:00:00.000' AS DateTime), 1234, 2, 8, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (47, N'Thế nào cũng được em yêu à !', CAST(349032 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'27.jpg', CAST(N'2013-03-03T00:00:00.000' AS DateTime), 134789, 1, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (48, N'Ông già và Biển cả', CAST(3849320 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'28.jpg', CAST(N'2012-05-06T00:00:00.000' AS DateTime), 1256, 3, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (49, N'Truyện nghìn lẻ một đêm', CAST(348920 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'29.jpg', CAST(N'2020-06-07T00:00:00.000' AS DateTime), 345678, 6, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (50, N'Cậu bé cưỡi rồng ERAGON và Mụ phù thủy già', CAST(348390 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'30.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 456767, 1, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (51, N'Tấm cám và người nào đó', CAST(12670 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'31.jpg', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 10293, 8, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (52, N'Hãy làm sạch biển', CAST(29329 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'32.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 12343, 3, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (53, N'Hãy hành động vì thế giưới không thực phẩm bẩn', CAST(22344 AS Decimal(18, 0)), N'<p>Hello, World! hahahahahah</p>', N'33.jpg', CAST(N'2039-04-05T00:00:00.000' AS DateTime), 39493, 3, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (55, N'Ai làm người đấy chịu !', CAST(23456 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'34.jpg', CAST(N'2009-04-05T00:00:00.000' AS DateTime), 1235, 2, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (56, N'Thì đã làm sao, đây cứ làm đây !', CAST(28390 AS Decimal(18, 0)), N'<p>Hello, World! hahahahhahah</p>', N'35.jpg', CAST(N'2020-09-03T00:00:00.000' AS DateTime), 23456, 1, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (57, N'Tao thich mày ! Mày thích tao !', CAST(128900 AS Decimal(18, 0)), N'<p>Hello, World! xin ch&agrave;o thế giới</p>', N'38.jpg', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 124506, 10, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (58, N'Lại thêm sách nữa rồi', CAST(124667 AS Decimal(18, 0)), N'<p>Hello, World! tao l&agrave; nguyen tung anh day</p>', N'37.jpg', CAST(N'2016-06-01T00:00:00.000' AS DateTime), 2356, 10, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (59, N'Tôi cùng học với bạn !', CAST(237990 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'39.jpg', CAST(N'2014-03-07T00:00:00.000' AS DateTime), 2904, 1, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (60, N'Ai làm gid cũng mặc', CAST(23909 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'40.jpg', CAST(N'2020-04-15T00:00:00.000' AS DateTime), 23550, 8, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (61, N'Con cóc là cậu ông trới', CAST(2378200 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'41.jpg', CAST(N'2020-05-16T00:00:00.000' AS DateTime), 34675, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (62, N'Hậu duệ mặt trời', CAST(271800 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'42.jpg', CAST(N'2016-04-06T00:00:00.000' AS DateTime), 28290, 10, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (63, N'Xuân về bên em', CAST(3747800 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'43.jpg', CAST(N'2016-06-02T00:00:00.000' AS DateTime), 38291, 10, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (64, N'Tối nay không ngủ Ngày mai ngủ bù', CAST(22900 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'44.jpg', CAST(N'2020-06-07T00:00:00.000' AS DateTime), 132450, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (65, N'Không ngủ cũng chả sao đâu', CAST(34839 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'45.jpg', CAST(N'2020-05-16T00:00:00.000' AS DateTime), 3467, 1, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (66, N'Adobe Photoshop bị Block', CAST(23670 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'46.jpg', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 145657, 3, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (67, N'Website quản lý bán sách', CAST(4754 AS Decimal(18, 0)), N'<p>Hello, World! ghi lại kỉ lục</p>', N'47.jpg', CAST(N'2020-02-23T00:00:00.000' AS DateTime), 23209, 4, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (68, N'Này chớ có làm loan tronh nhà tao', CAST(4758 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'48.jpg', CAST(N'2014-12-04T00:00:00.000' AS DateTime), 34334, 2, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (69, N'Bán bia hơi HÁ NỘI GIÁ RẺ', CAST(4893430 AS Decimal(18, 0)), N'<p>Hello, World! ghghghghghgh</p>', N'49.jpg', CAST(N'2020-12-23T00:00:00.000' AS DateTime), 2434, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (70, N'Truyện cười về Thần chết', CAST(34399 AS Decimal(18, 0)), N'<p>Hello, World! ai l&agrave;m ta đau</p>', N'50.jpg', CAST(N'2014-12-31T00:00:00.000' AS DateTime), 633434, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (71, N'Da xong dang nhap roi', CAST(237109 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'51.jpg', CAST(N'2017-04-05T00:00:00.000' AS DateTime), 2345, 4, 1, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (72, N'Chua xong Dropdown List', CAST(28190 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'52.jpg', CAST(N'2020-04-05T00:00:00.000' AS DateTime), 2334, 8, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (73, N'Ai là bạn và ai là thù ?', CAST(34657 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'53.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 455667, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (74, N'Xong dang nhap dang xuat dang Ky', CAST(23299 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'54.jpg', CAST(N'2020-07-06T00:00:00.000' AS DateTime), 0, 8, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (75, N'Đã xong ! Mai ôn 25 câu', CAST(237891 AS Decimal(18, 0)), N'<p>Hello, World! Thế l&agrave; đ&atilde; xong rồi đ&acirc;y !</p>', N'56.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 12356, 11, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (76, N'Ổn của Ổn', CAST(23801 AS Decimal(18, 0)), N'<p>Hello, World! Ổn rrooif !</p>', N'57.jpg', CAST(N'2020-05-06T00:00:00.000' AS DateTime), 2345, 11, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (77, N'Thêm ảnh mới', CAST(2380 AS Decimal(18, 0)), N'<p>Hello, World! xong của xong</p>', N'58.jpg', CAST(N'2016-06-04T04:49:24.413' AS DateTime), 28329, 2, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (78, N'abc là xề bánh đúc', CAST(874954 AS Decimal(18, 0)), N'<p>Hello, World! abc l&agrave; xeeffb &aacute;nh đ&uacute;c</p>', N'59.jpg', CAST(N'2016-06-04T04:50:54.493' AS DateTime), 2837, 3, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (79, N'A đây rồi !', CAST(6680 AS Decimal(18, 0)), N'<p>Hello, World! addaay rồi !</p>', N'60.jpg', CAST(N'2016-06-04T22:19:08.440' AS DateTime), 13345, 4, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (80, N'Mai di thi roi !', CAST(578482 AS Decimal(18, 0)), N'<p>Hello, World! e hem</p>', N'61.jpg', CAST(N'2016-06-07T01:41:00.437' AS DateTime), 4567, 3, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (82, N'Ai bao the !', CAST(75765 AS Decimal(18, 0)), N'<p>Hello, World! Hang xom cua toi la Totoro</p>', N'63.png', CAST(N'2016-06-07T01:43:48.553' AS DateTime), 13245, 1, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (83, N'Test lại trước khi đi thi', CAST(859000 AS Decimal(18, 0)), N'<p>Hello, World! Test xong th&igrave; học l&yacute; thuyết</p>', N'64.jpg', CAST(N'2016-06-07T01:49:30.187' AS DateTime), 337388, 12, 12, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (84, N'Ai là Ai ?', CAST(219998 AS Decimal(18, 0)), N'<p>Hello, World! Xin k&iacute;nh ch&agrave;o Thế Giới !</p>', N'65.jpg', CAST(N'2016-06-07T01:56:58.840' AS DateTime), 789, 12, 12, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (85, N'cÂU CHUYỆN VỀ bIỂN đẢO vn', CAST(90889 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'67.JPG', CAST(N'2016-06-07T01:58:34.963' AS DateTime), 9089, 9, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (86, N'Bác Hồ yêu thiếu nhi', CAST(8490303 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'68.jpg', CAST(N'2016-06-07T01:59:31.233' AS DateTime), 977, 4, 3, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (87, N'Vâng thị Dạ', CAST(89000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'69.jpg', CAST(N'2016-06-07T02:02:29.570' AS DateTime), 8900, 4, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (88, N'Vang văn Văng Dạ thị Dạ', CAST(890787 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'70.jpg', CAST(N'2016-06-07T02:03:46.367' AS DateTime), 897, 11, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (89, N'Ai làm thì làm sao mà biets được !', CAST(78890 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'71.jpg', CAST(N'2016-06-07T02:05:10.433' AS DateTime), 2345, 2, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (90, N'Chuyện tào lao qua ngày', CAST(237899 AS Decimal(18, 0)), N'<p>Hello, World! Best l&agrave; Nhất</p>', N'72.jpg', CAST(N'2016-06-07T02:06:17.097' AS DateTime), 28920, 12, 5, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (91, N'Và thế là em đã biết', CAST(12890 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'73.jpg', CAST(N'2016-06-07T02:07:02.100' AS DateTime), 45767, 9, 9, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (92, N'Và thế là anh đã biết', CAST(89000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'74.jpg', CAST(N'2016-06-07T02:07:47.460' AS DateTime), 4567, 4, 2, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (93, N'Xong Mat Kahua', CAST(89088 AS Decimal(18, 0)), N'<p>Hello, World! hay</p>', N'75.jpg', CAST(N'2016-06-07T02:50:01.860' AS DateTime), 99798, 3, 12, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (94, N'Da hieu', CAST(9087 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'76.jpg', CAST(N'2016-06-07T03:55:40.153' AS DateTime), 78676, 8, 4, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (95, N'Nhanh len nao', CAST(7880 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'77.jpg', CAST(N'2016-06-07T05:58:24.850' AS DateTime), 887, 8, 12, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (96, N'Chuan bi thi', CAST(57689 AS Decimal(18, 0)), N'<p>Hello, World! Chuan bi thi roi nhe !</p>', N'78.jpg', CAST(N'2016-06-07T07:12:25.413' AS DateTime), 4567, 8, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (97, N'Đã thi xong, nghỉ ngơi thôi!', CAST(90878 AS Decimal(18, 0)), N'<p>Hello, World! Đ&atilde; xong !</p>', N'79.jpg', CAST(N'2016-06-07T17:51:52.527' AS DateTime), 8987, 11, 10, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (98, N'Thêm vào xem nào', CAST(12345 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'HoangYen_Chibi.jpg', CAST(N'2016-06-07T17:58:34.440' AS DateTime), 0, 13, 13, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (100, N'Sách hay quá', CAST(785990 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'13.jpg', CAST(N'2020-06-06T00:00:00.000' AS DateTime), 100, 10, 12, 1)
INSERT [dbo].[DienThoai] ([MaDienThoai], [TenDienThoai], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNCC], [MaLoai], [Moi]) VALUES (101, N'Sách hay', CAST(50000 AS Decimal(18, 0)), N'<p>Hello, World!</p>', N'52.jpg', CAST(N'2020-06-03T21:36:12.990' AS DateTime), 5, 11, 13, 1)
SET IDENTITY_INSERT [dbo].[DienThoai] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DienThoai] FOREIGN KEY([MaDienThoai])
REFERENCES [dbo].[DienThoai] ([MaDienThoai])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DienThoai]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_Loai]
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD  CONSTRAINT [FK_DienThoai_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[DienThoai] CHECK CONSTRAINT [FK_DienThoai_NhaCungCap]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanDienThoai] SET  READ_WRITE 
GO
