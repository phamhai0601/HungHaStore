USE [master]
GO
/****** Object:  Database [dogo-hungha]    Script Date: 10/19/2021 9:20:45 PM ******/
CREATE DATABASE [dogo-hungha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dogo-hungha', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dogo-hungha.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dogo-hungha_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dogo-hungha_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dogo-hungha] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dogo-hungha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dogo-hungha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dogo-hungha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dogo-hungha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dogo-hungha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dogo-hungha] SET ARITHABORT OFF 
GO
ALTER DATABASE [dogo-hungha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dogo-hungha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dogo-hungha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dogo-hungha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dogo-hungha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dogo-hungha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dogo-hungha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dogo-hungha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dogo-hungha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dogo-hungha] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dogo-hungha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dogo-hungha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dogo-hungha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dogo-hungha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dogo-hungha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dogo-hungha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dogo-hungha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dogo-hungha] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dogo-hungha] SET  MULTI_USER 
GO
ALTER DATABASE [dogo-hungha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dogo-hungha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dogo-hungha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dogo-hungha] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dogo-hungha]
GO
/****** Object:  Table [dbo].[tblInfo]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[user_id] [int] NULL,
	[sex] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[date_of_bith] [int] NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tblInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[total] [int] NOT NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[description] [nvarchar](255) NULL,
	[price] [int] NULL,
	[created_at] [int] NULL,
	[img] [varchar](255) NULL,
	[views] [int] NULL,
	[sale] [int] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductCategory]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tblProductCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStores]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [int] NOT NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tblStores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[role] [int] NOT NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlbInvoiceDetail]    Script Date: 10/19/2021 9:20:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbInvoiceDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[invoice_id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [int] NOT NULL,
	[created_at] [int] NOT NULL,
 CONSTRAINT [PK_tlbInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (383, N'Kệ góc bằng gỗ MDF kết cấu chắc chắn GHS-2400', 1, N'hiện tại chưa có mô tả về sản phẩm', 1800000, 1633862094, N'ke-goc-bang-go-mdf-ket-cau-chac-chan-ghs-2400-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (384, N'Kệ để sách bằng gỗ MDF cao cấp GHS-2399', 1, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862094, N'ke-de-sach-bang-go-mdf-cao-cap-ghs-2399-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (385, N'Giá kệ sách gỗ thiết kế đơn giản GHS-2398', 1, N'hiện tại chưa có mô tả về sản phẩm', 1600000, 1633862094, N'gia-ke-sach-go-thiet-ke-don-gian-ghs-2398-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (386, N'Kệ để sách báo gỗ MDF phủ melamine GHS-2397', 1, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862094, N'ke-de-sach-bao-go-mdf-phu-melamine-ghs-2397-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (387, N'Kệ sách đa năng kiểu dáng độc đáo GHS-2395', 1, N'hiện tại chưa có mô tả về sản phẩm', 2900000, 1633862094, N'ke-sach-da-nang-kieu-dang-doc-dao-ghs-2395-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (388, N'Giá kệ sách bằng gỗ đa năng GHS-2394', 1, N'hiện tại chưa có mô tả về sản phẩm', 2400000, 1633862094, N'gia-ke-sach-bang-go-da-nang-ghs-2394-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (389, N'Kệ sách gỗ MDF phủ melamine GHS-2393', 1, N'hiện tại chưa có mô tả về sản phẩm', 2500000, 1633862094, N'ke-sach-go-mdf-phu-melamine-ghs-2393-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (390, N'Kệ giá để sách bằng gỗ tại nhà GHS-2389', 1, N'hiện tại chưa có mô tả về sản phẩm', 3200000, 1633862094, N'ke-gia-de-sach-bang-go-tai-nha-ghs-2388-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (391, N'Giá để sách gỗ nhỏ gọn GHS-2388', 1, N'hiện tại chưa có mô tả về sản phẩm', 1700000, 1633862094, N'gia-de-sach-go-nho-gon-ghs-2388-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (392, N'Giá để sách truyện cho bé bằng gỗ GHS-2385', 1, N'hiện tại chưa có mô tả về sản phẩm', 2500000, 1633862094, N'gia-de-sach-truyen-cho-be-bang-go-ghs-2385-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (393, N'Kệ giá sách gỗ đa năng kiểu dáng trẻ trung GHS-51598', 1, N'hiện tại chưa có mô tả về sản phẩm', 500000, 1633862094, N'ke-gia-sach-go-da-nang-kieu-dang-tre-trung-ghs-51598-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (394, N'Kệ sách cho bé gỗ công nghiệp cao cấp, tủ sách nhỏ GHC-1111', 1, N'hiện tại chưa có mô tả về sản phẩm', 1600000, 1633862094, N'ke-sach-cho-be-ghc-1111-3-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (395, N'Kệ sách nhỏ 5 tầng, tủ kệ sách gỗ công nghiệp GHC-1110', 1, N'hiện tại chưa có mô tả về sản phẩm', 1500000, 1633862094, N'ke-sach-nho-ghc-1110-9-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (396, N'Kể để truyện tranh, kệ giá sách gỗ MDF GHC-1108', 1, N'hiện tại chưa có mô tả về sản phẩm', 950000, 1633862094, N'ke-de-truyen-tranh-ke-gia-sach-go-mdf-ghc-1108-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (397, N'Kệ sách nhỏ gọn kết cấu chắc chắn GHC-1105', 1, N'hiện tại chưa có mô tả về sản phẩm', 1100000, 1633862094, N'ke-sach-nho-gon-ket-cau-chac-chan-ghc-1105-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (398, N'Kệ để đồ hình Robot bằng gỗ thiết kế mới GHC-1104', 1, N'hiện tại chưa có mô tả về sản phẩm', 1600000, 1633862094, N'ke-de-do-hinh-robot-bang-go-thiet-ke-moi-ghc-1104-ava2-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (399, N'Kệ sách hình robot, kệ để đồ gỗ kiểu dáng độc đáo GHC-1103', 1, N'hiện tại chưa có mô tả về sản phẩm', 1600000, 1633862094, N'ke-sach-hinh-robot-ke-de-do-go-kieu-dang-doc-dao-ghc-1103-2-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (400, N'Kệ để sách cho trẻ, kệ trang trí gỗ công nghiệp GHC-1101', 1, N'hiện tại chưa có mô tả về sản phẩm', 1400000, 1633862094, N'ke-de-sach-cho-tre-ke-trang-tri-go-cong-nghiep-ghc-1101-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (401, N'Kệ sách mái nhà độc đáo, kệ để đồ đẹp GHC-1100', 1, N'hiện tại chưa có mô tả về sản phẩm', 1100000, 1633862094, N'ke-sach-mai-nha-doc-dao-ke-de-do-dep-ghc-1100-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (402, N'Kệ truyện tranh cho bé, kệ trang trí gỗ MDF GHC-199', 1, N'hiện tại chưa có mô tả về sản phẩm', 750000, 1633862094, N'ke-truyen-tranh-cho-be-ke-trang-tri-go-mdf-ghc-199-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (403, N'Kệ sách gỗ MDF mini cho bé, kệ để đồ nhỏ gọn GHC-2425', 1, N'hiện tại chưa có mô tả về sản phẩm', 1100000, 1633862094, N'avar-2-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (404, N'Kệ trưng bày Tatami 120 cm bằng gỗ MDF GHC-2430', 1, N'hiện tại chưa có mô tả về sản phẩm', 1800000, 1633862094, N'ke-go-tatami-thiet-ke-thong-minh-tien-loi-ghc-2424-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (405, N'Kệ gỗ Tatami 90 cm thiết kế thông minh tiện lợi GHC-2424', 1, N'hiện tại chưa có mô tả về sản phẩm', 1500000, 1633862094, N'ke-go-tatami-thiet-ke-thong-minh-tien-loi-ghc-2424-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (406, N'Giá sách phòng bé, kệ giá sách gỗ MDF GHC-2423', 1, N'hiện tại chưa có mô tả về sản phẩm', 1200000, 1633862094, N'gia-sach-phong-be-ke-gia-sach-go-mdf-ghc-2423-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (407, N'Kệ gỗ Tatami kiểu dáng đơn giản phong cách Nhật GHC-2422', 1, N'hiện tại chưa có mô tả về sản phẩm', 1600000, 1633862094, N'ke-go-tatami-kieu-dang-don-gian-phong-cach-nhat-ghc-2422-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (408, N'Kệ Tatami thông minh, kệ giá để đồ bằng gỗ GHC-2421', 1, N'hiện tại chưa có mô tả về sản phẩm', 1400000, 1633862094, N'ke-tatami-thong-minh-ke-gia-de-do-bang-go-ghc-2421-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (409, N'Kệ sách đa năng, kệ giá sách bằng gỗ MDF chắc chắn GHC-2429', 1, N'hiện tại chưa có mô tả về sản phẩm', 1200000, 1633862095, N'ke-sach-da-nang-ke-gia-sach-bang-go-mdf-chac-chan-ghc-2429-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (410, N'Kệ sách bằng gỗ di động, giá sách cho bé GHC-2426', 1, N'hiện tại chưa có mô tả về sản phẩm', 1300000, 1633862095, N'ke-sach-bang-go-ghc-2426-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (411, N'Kệ sách Tatami, kệ giá sách gỗ công nghiệp GHC-2420', 1, N'hiện tại chưa có mô tả về sản phẩm', 1200000, 1633862095, N'ke-sach-tatami-ke-gia-sach-go-cong-nghiep-ghc-2420-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (412, N'Giá kệ sách Nhật, kệ sách gỗ 4 ngăn chứa tiện lợi GHC-2419', 1, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862095, N'gia-ke-sach-nhat-ke-sach-go-4-ngan-chua-tien-loi-ghc-2419-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (413, N'Giá sách gỗ nhỏ gọn thiết kế đa năng GHC-2418', 1, N'hiện tại chưa có mô tả về sản phẩm', 950000, 1633862095, N'gia-sach-go-nho-gon-thiet-ke-da-nang-ghc-2418-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (414, N'Kệ sách gỗ, kệ trưng bày đa năng GHC-2417', 1, N'hiện tại chưa có mô tả về sản phẩm', 699000, 1633862095, N'ke-sach-go-ke-trung-bay-da-nang-ghc-2417-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (415, N'Kệ sách nhỏ, kệ giá sách gỗ công nghiệp GHC-2416', 1, N'hiện tại chưa có mô tả về sản phẩm', 399000, 1633862095, N'ke-sach-nho-ke-gia-sach-go-cong-nghiep-ghc-2416-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (416, N'Kệ giá sách gỗ, kệ để sách nhỏ gọn đẹp GHC-2413', 1, N'hiện tại chưa có mô tả về sản phẩm', 399000, 1633862095, N'ke-gia-sach-go-ke-de-sach-nho-gon-dep-ghc-2413-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (417, N'Kệ sách đứng, kệ để đồ trang trí chân gỗ tự nhiên GHC-191', 1, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633862095, N'ke-sach-dung-ke-de-do-trang-tri-chan-go-tu-nhien-ghc-191-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (418, N'Kệ sách gỗ hiện đại, kệ sách thông minh GHC-2414', 1, N'hiện tại chưa có mô tả về sản phẩm', 699000, 1633862095, N'avar-k?-sách-g?-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (419, N'Giá kệ vuông, tủ đồ xếp hình tùy biến không gian GHC-2407', 1, N'hiện tại chưa có mô tả về sản phẩm', 199000, 1633862095, N'Giá-k?-vuông-t?-d?-x?p-hình-tùy-bi?n-không-gian-GHC-2407-7-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (420, N'Giá kệ để đồ xếp hình lắp ráp đa năng size 36cm GHC-2406', 1, N'hiện tại chưa có mô tả về sản phẩm', 399000, 1633862095, N'Giá-k?-sách-t?-d?-d?-x?p-hình-l?p-ráp-da-nang-8-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (421, N'Kệ sách đa năng bằng gỗ công nghiệp MDF cao cấp GHC-2405', 1, N'hiện tại chưa có mô tả về sản phẩm', 1190000, 1633862095, N'gia-sach-gia-dinh-thiet-ke-da-nang-ghc-2405-9-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (422, N'Kệ sách đứng đẹp thiết kế nhỏ gọn GHS-2384', 1, N'hiện tại chưa có mô tả về sản phẩm', 1500000, 1633862095, N'ke-sach-dung-dep-thiet-ke-nho-gon-ghs-2384-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (423, N'Kệ sách hiện đại thiết kế sang trọng GHS-2383', 1, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633862095, N'ke-sach-hien-dai-thiet-ke-sang-trong-ghs-2383-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (424, N'Giá sách cao cấp bằng gỗ GHS-2382', 1, N'hiện tại chưa có mô tả về sản phẩm', 8600000, 1633862095, N'gia-sach-cao-cap-bang-go-ghs-2382-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (425, N'Giá sách đa năng thiết kế sang trọng GHS-2381', 1, N'hiện tại chưa có mô tả về sản phẩm', 5800000, 1633862095, N'gia-sach-da-nang-thiet-ke-sang-trong-ghs-2381-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (426, N'Giá sách hiện đại thiết kế thông minh GHS-2380', 1, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633862095, N'gia-sach-hien-dai-thiet-ke-thong-minh-ghs-2380-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (427, N'Giá sách gia đình kiểu dáng nhỏ gọn GHS-2379', 1, N'hiện tại chưa có mô tả về sản phẩm', 1700000, 1633862095, N'gia-sach-gia-dinh-kieu-dang-nho-gon-ghs-2379-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (428, N'Giá sách bằng gỗ kiểu dáng tiện dụng GHS-2378', 1, N'hiện tại chưa có mô tả về sản phẩm', 2300000, 1633862095, N'gia-sach-bang-go-kieu-dang-tien-dung-ghs-2378-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (429, N'Giá sách hiện đại thiết kế đơn giản GHS-2377', 1, N'hiện tại chưa có mô tả về sản phẩm', 4200000, 1633862095, N'gia-sach-hien-dai-thiet-ke-don-gian-ghs-2377-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (430, N'Bàn ăn thông minh, bàn ăn gấp gọn đa năng GHC-41223', 2, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633862590, N'avar-7-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (431, N'Bàn ăn gấp gọn, bàn ăn gỗ thiết kế thông minh GHC-41222', 2, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633862590, N'ban-an-gap-gon-ban-an-go-thiet-ke-thong-minh-ghc-41222-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (432, N'Bàn ăn bằng gỗ 4 chỗ thiết kế đẹp GHS-41221', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862591, N'Ban-an-bang-go-4-cho-thiet-ke-dep-GHS-41221-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (433, N'Bàn ăn gia đình phong cách hiện đại GHS-41220', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862591, N'Ban-an-gia-dinh-phong-cach-hien-dai-GHS-41220-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (434, N'Bàn ăn bằng gỗ đẹp cho gia đình GHS-41219', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862591, N'ban-an-bang-go-dep-cho-gia-dinh-GHS-41219-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (435, N'Bàn ăn gỗ sồi kiểu dáng nhỏ gọn cho gia đình GHS-41218', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862591, N'Ban-an-go-soi-kieu-dang-nho-gon-cho-gia-dinh-GHS-41218-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (436, N'Bộ bàn ăn hiện đại gỗ sồi kiểu dáng nhỏ gọn GHS-41217', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862591, N'Bo-ban-an-hien-dai-go-soi-kieu-dang-nho-gon-GHS-41217-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (437, N'Bàn ăn gia đình 4 chỗ bằng gỗ tự nhiên GHS-41216', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862591, N'Ban-an-gia-dinh-4-cho-bang-go-tu-nhien-GHS-41216-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (438, N'Bàn ăn gỗ sồi thiết kế đẹp thanh lịch GHS-41215', 2, N'hiện tại chưa có mô tả về sản phẩm', 14000000, 1633862591, N'Ban-an-go-soi-thiet-ke-dep-thanh-lich-GHS-41215-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (439, N'Bộ bàn ghế ăn gỗ chất lượng cao cho gia đình GHS-41214', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862591, N'Bo-ban-ghe-an-go-chat-luong-cao-cho-gia-dinh-GHS-41214-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (440, N'Bàn ăn bằng gỗ kiểu dáng thanh lịch GHS-41213', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862591, N'ban-an-bang-go-kieu-dang-tahnh-lich-GHS-41213-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (441, N'Bàn ăn gia đình thiết kế đẹp bằng gỗ sồi GHS-41212', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862591, N'Ban-an-gia-dinh-thiet-ke-dep-bang-go-soi-GHS-41212-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (442, N'Bộ bàn ăn gia đình kiểu dáng nhỏ gọn GHS-41155', 2, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633862591, N'Bo-ban-an-gia-dinh-kieu-dang-nho-gon-GHS-41155-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (443, N'Bàn ăn bằng gỗ chất lượng cao GHS-41154', 2, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633862591, N'Ban-an-bang-go-chat-luong-cao-GHS-41154-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (444, N'Bộ bàn ăn gia đình đẹp thanh lịch GHS-41153', 2, N'hiện tại chưa có mô tả về sản phẩm', 14000000, 1633862591, N'Bo-ban-an-gia-dinh-dep-thanh-lich-GHS-41153-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (445, N'Bàn ăn hiện đại bằng gỗ cho gia đình GHS-41152', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862591, N'Ban-an-hien-dai-bang-go-cho-gia-dinh-GHS-41152-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (446, N'Bộ bàn ghế ăn bằng gỗ tự nhiên GHS-41151', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862591, N'Bo-ban-ghe-an-bang-go-tu-nhien-GHS-41151-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (447, N'Bộ bàn ăn gỗ thiết kế ấn tượng GHS-41150', 2, N'hiện tại chưa có mô tả về sản phẩm', 13500000, 1633862591, N'Bo-ban-an-go-thiet-ke-an-tuong-GHS-41150-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (448, N'Bộ bàn ăn tròn phong cách hiện đại GHS-41149', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Bo-ban-an-tron-phong-cach-hien-dai-GHS-41149-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (449, N'Bàn ăn hiện đại cho gia đình GHS-41148', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Ban-an-hien-dai-cho-gia-dinh-GHS-41148-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (450, N'Bàn ăn gia đình bằng gỗ thiết kế đẹp GHS-41147', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Ban-an-gia-dinh-bang-go-thiet-ke-dep-GHS-41147-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (451, N'Bộ bàn ghế ăn phong cách hiện đại GHS-41146', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Bo-ban-ghe-an-phong-cach-hien-dai-GHS-41146-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (452, N'Bàn ăn hiện đại bằng gỗ cao cấp GHS-41145', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'ban-an-hien-dai-bang-go-cao-cap-GHS-41145-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (453, N'Bàn ăn đẹp bằng gỗ tự nhiên GHS-41093', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Ban-an-dep-bang-go-tu-nhien-GHS-41093-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (454, N'Bàn ăn hình vuông bằng gỗ tự nhiên GHS-41092', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Ban-an-hinh-vuong-bang-go-tu-nhien-GHS-41092-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (455, N'Bộ bàn ăn chất lượng cao thiết kế đẹp GHS-41091', 2, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633862592, N'Bo-ban-an-chat-luong-cao-thiet-ke-dep-GHS-41091-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (456, N'Bàn ăn hiện đại 4 ghế cho gia đình GHS-41090', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Ban-an-hien-dai-4-ghe-cho-gia-dinh-GHS-41090-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (457, N'Bàn ăn hiện đại thiết kế ấn tượng GHS-41089', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Ban-an-hien-dai-thiet-ke-an-tuong-GHS-41089-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (458, N'Bàn ăn gỗ tự nhiên cao cấp GHS-41088', 2, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633862592, N'Ban-an-go-tu-nhien-cao-cap-GHS-41088-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (459, N'Bộ bàn ăn gỗ đẹp cho gia đình GHS-41087', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Bo-ban-an-go-dep-cho-gia-dinh-GHS-41087-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (460, N'Bàn ăn gia đình bằng gỗ tự nhiên GHS-41086', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Ban-an-gia-dinh-bang-go-tu-nhien-GHS-41086-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (461, N'Bàn ăn bằng gỗ thiết kế đẹp GHS-41085', 2, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633862592, N'Ban-an-bang-go-thiet-ke-dep-GHS-41085-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (462, N'Bộ bàn ăn hiện đại cho gia đình GHS-41084', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Bo-ban-an-hien-dai-cho-gia-dinh-GHS-41084-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (463, N'Bộ bàn ăn gia đình thiết kế đẹp GHS-41083', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Bo-ban-an-gia-dinh-thiet-ke-dep-GHS-41083-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (464, N'Bộ bàn ăn gỗ kiểu dáng nhỏ gọn GHS-41082', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862592, N'Bo-ban-an-gi-kieu-dang-nho-gon-GHS-41082-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (465, N'Bàn ăn bằng gỗ chất lượng cao GHS-41081', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Ban-an-bang-go-chat-luong-cao-GHS-41081-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (466, N'Bộ bàn ăn gỗ 4 ghế hiện đại GHS-41080', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Bo-ban-an-go-4-ghe-hien-dai-GHS-41080-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (467, N'Bàn ăn gia đình hiện đại đẹp GHS-41079', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'Ban-an-gia-dinh-hien-dai-dep-GHS-41079-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (468, N'Bàn ăn gỗ gia đình ghế bọc nỉ cao cấp GHS-4909', 2, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633862592, N'ban-an-go-gia-dinh-ghe-boc-ni-cao-cap-ghs-4909-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (469, N'Bàn ăn gỗ hiện đại thiết kế nhỏ gọn sang trọng GHS-4908', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862592, N'ban-an-go-hien-dai-thiet-ke-nho-gon-sang-trong-ghs-4908-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (470, N'Bàn ăn gỗ gia đình đẹp sang trọng hiện đại GHS-4905', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862592, N'ban-an-go-gia-dinh-dep-sang-trong-hien-dai-ghs-4905-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (471, N'Bàn ăn gỗ sồi gia đình thiết kế đẹp hiện đại GHS-4902', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862592, N'ban-an-go-soi-gia-dinh-thiet-ke-dep-hien-dai-ghs-4902-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (472, N'Bàn ăn hiện đại bằng gỗ sồi tự nhiên sang trọng GHS-4900', 2, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633862593, N'ban-an-hien-dai-bang-go-soi-tu-nhien-sang-trong-ghs-4900-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (473, N'Bàn ăn gỗ gia đình thiết kế sang trọng hiện đại GHS-4899', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862593, N'ban-an-go-gia-dinh-thiet-ke-sang-trong-hien-dai-ghs-4899-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (474, N'Bàn ăn gỗ công nghiệp nhỏ gọn tiện lợi GHS-4854', 2, N'hiện tại chưa có mô tả về sản phẩm', 7000000, 1633862593, N'ban-an-go-cong-nghiep-nho-gon-tien-loi-ghs-4854-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (475, N'Bàn ăn gỗ gia đình thiết kế đẹp hiện đại GHS-4853', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862593, N'ban-an-go-gia-dinh-thiet-ke-dep-hien-dai-ghs-4853-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (476, N'Bàn ăn gỗ hiện đại sang trọng tiện dụng GHS-4852', 2, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633862593, N'ban-an-go-hien-dai-sang-trong-tien-dung-ghs-4852-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (477, N'Tủ quần áo đơn giản nhỏ gọn, tủ áo gỗ hiện đại GHC-5724', 3, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862756, N'tu-quan-ao-don-gian-ghc-5724-3-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (478, N'Tủ treo quần áo 2 suốt tiện lợi, tủ áo kích thước nhỏ gọn GHC-5723', 3, N'hiện tại chưa có mô tả về sản phẩm', 1400000, 1633862756, N'tu-treo-quan-ao-ghc-5723-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (479, N'Tủ áo nhỏ gọn, tủ đồ gỗ công nghiệp GHC-5722', 3, N'hiện tại chưa có mô tả về sản phẩm', 1400000, 1633862756, N'tu-ao-nho-gon-ghc-5722-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (480, N'Tủ treo quần áo đa năng, tủ đồ tiện dụng GHC-5720', 3, N'hiện tại chưa có mô tả về sản phẩm', 1700000, 1633862756, N'tu-treo-quan-ao-ghc-5720-2-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (481, N'Kệ đồ quần áo, tủ kệ treo áo kiểu dáng nhỏ gọn GHS-51522', 3, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633862756, N'ke-do-quan-ao-tu-ke-treo-ao-kieu-dang-nho-gon-ghs-51480-ava-300x300.jpg', NULL, NULL)
GO
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (482, N'Tủ quần áo cho bé, tủ đừng đồ bằng gỗ công nghiệp GHC-5725', 3, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862756, N'tu-quan-ao-cho-be-tu-dung-do-bang-go-cong-nghiep-ghc-5725-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (483, N'Tủ quần áo gỗ kiểu nhật, tủ lưu trữ đồ đa năng GHC-51479', 3, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862756, N'tu-quan-ao-go-kieu-nhat-tu-luu-tru-do-da-nang-ghc-51479-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (484, N'Tủ để đồ Tatami, tủ áo kiểu Nhật bằng gỗ GHC-51478', 3, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862756, N'tu-de-do-tatami-tu-ao-kieu-nhat-bang-go-ghc-51471-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (485, N'Tủ áo Tatami gỗ thiết kế tiện dụng GHC-51469', 3, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633862756, N'tu-ao-tatami-go-thiet-ke-tien-dung-ghc-51469-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (486, N'Tủ lưu trữ đồ, tủ quần áo gỗ công nghiệp GHC-51476', 3, N'hiện tại chưa có mô tả về sản phẩm', 2500000, 1633862756, N'tu-luu-tru-do-tu-quan-ao-go-cong-nghiep-ghc-51476-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (487, N'Tủ áo cho bé cánh mở hiện đại, tủ để đồ bằng gỗ GHC-2432', 3, N'hiện tại chưa có mô tả về sản phẩm', 1500000, 1633862756, N'tu-ao-cho-be-ghc-2432-10-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (488, N'Tủ quần áo cho bé, tủ quần áo trẻ em đẹp GHC-51467', 3, N'hiện tại chưa có mô tả về sản phẩm', 1999000, 1633862756, N'tu-quan-ao-cho-be-GHC-51467-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (489, N'Tủ quần áo gỗ MDF, tủ quần áo kiểu dáng đơn giản GHC-51466', 3, N'hiện tại chưa có mô tả về sản phẩm', 1699000, 1633862756, N'tu-quan-ao-go-ghc-51466-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (490, N'Tủ áo nhỏ gọn, tủ áo bằng gỗ 3 tầng GHC-51465', 3, N'hiện tại chưa có mô tả về sản phẩm', 999000, 1633862756, N'avar-8-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (491, N'Tủ áo gỗ nhỏ gọn thiết kế phong cách hiện đại GHC-51473', 3, N'hiện tại chưa có mô tả về sản phẩm', 699000, 1633862756, N'tu-ao-go-nho-gon-thiet-ke-phong-cach-hien-dai-ghc-51473-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (492, N'Tủ áo gỗ MDF kết cấu chắc chắn phủ melamine GHC-51472', 3, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633862756, N'tu-ao-go-mdf-ket-cau-chac-chan-phu-melamine-ghc-51472-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (493, N'Tủ áo gia đình, tủ để quần áo bằng gỗ tiện lợi GHC-51464', 3, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633862756, N'tu-ao-gia-dinh-tu-de-quan-ao-bang-go-tien-loi-ghc-51464-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (494, N'Tủ quần áo gỗ MDF, tủ quần áo đơn giản đẹp GHC-51471', 3, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633862756, N'tu-quan-ao-GHC-51471-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (495, N'Tủ quần áo gỗ nhỏ, tủ quần áo đơn 6 tầng GHC-51470', 3, N'hiện tại chưa có mô tả về sản phẩm', 999000, 1633862756, N'tu-quan-ao-GHC-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (496, N'Tủ quần áo gỗ MDF, tủ áo cho phòng nhỏ GHC-51460', 3, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633862756, N'avar-tu-quan-ao-GHC-51460--300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (497, N'Tủ áo nhỏ gọn, tủ để quần áo bằng gỗ MDF GHC-51463', 3, N'hiện tại chưa có mô tả về sản phẩm', 1699000, 1633862756, N'tu-ao-nho-gon-tu-de-quan-ao-bang-go-mdf-ghc-51463-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (498, N'Tủ áo di động, tủ quần áo thiết kế hiện đại thông minh GHC-51462', 3, N'hiện tại chưa có mô tả về sản phẩm', 1699000, 1633862756, N'tu-ao-di-dong-tu-quan-ao-thiet-ke-hien-dai-thong-minh-ghc-51462-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (499, N'Tủ áo gỗ hiện đại thiết kế cánh mở GHS-51444', 3, N'hiện tại chưa có mô tả về sản phẩm', 6400000, 1633862756, N'tu-ao-go-hien-dai-thiet-ke-canh-mo-ghs-51444-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (500, N'Tủ áo cánh lùa bằng gỗ sồi tự nhiên GHS-51443', 3, N'hiện tại chưa có mô tả về sản phẩm', 15000000, 1633862756, N'tu-ao-canh-lua-bang-go-soi-tu-nhien-ghs-51143-ava1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (501, N'Tủ áo cánh chớp bằng gỗ sồi tự nhiên cao cấp GHS-51442', 3, N'hiện tại chưa có mô tả về sản phẩm', 15900000, 1633862756, N'tu-ao-canh-chop-bang-go-soi-tu-nhien-cao-cap-ghs-51442-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (502, N'Tủ áo cánh lùa thiết kế chớp giả GHS-51441', 3, N'hiện tại chưa có mô tả về sản phẩm', 15200000, 1633862756, N'tu-ao-canh-lua-thiet-ke-chop-gia-ghs-51441-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (503, N'Tủ để quần áo gỗ cánh chớp giả cao cấp GHS-51440', 3, N'hiện tại chưa có mô tả về sản phẩm', 22000000, 1633862757, N'tu-quan-ao-go-canh-chop-gia-cao-cap-ghs-51440-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (504, N'Tủ quần áo cánh trượt bằng gỗ cao cấp GHS-51439', 3, N'hiện tại chưa có mô tả về sản phẩm', 8900000, 1633862757, N'tu-quan-ao-canh-truot-bang-go-cao-cap-ghs-51439-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (505, N'Tủ áo gỗ MDF cho bé gái kiểu dáng dễ thương GHS-51438', 3, N'hiện tại chưa có mô tả về sản phẩm', 8900000, 1633862757, N'tu-ao-go-mdf-cho-be-gai-kieu-dang-de-thuong-ghs-51438-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (506, N'Tủ quần áo cho bé bằng gỗ công nghiệp GHS-51437', 3, N'hiện tại chưa có mô tả về sản phẩm', 4900000, 1633862757, N'tu-quan-ao-cho-be-bang-go-cong-nghiep-ghs-51437-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (507, N'Tủ áo bằng gỗ thiết kế cánh mở tiện dụng GHS-51436', 3, N'hiện tại chưa có mô tả về sản phẩm', 13500000, 1633862757, N'tu-ao-bang-go-thiet-ke-canh-mo-tien-dung-ghs-51436-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (508, N'Tủ áo cánh mở gia đình bằng gỗ cao cấp GHS-51435', 3, N'hiện tại chưa có mô tả về sản phẩm', 9500000, 1633862757, N'tu-ao-canh-mo-gia-dinh-bang-go-cao-cap-ghs-51435-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (509, N'Tủ áo gia đình bằng gỗ thiết kế đẹp GHS-51434', 3, N'hiện tại chưa có mô tả về sản phẩm', 7900000, 1633862757, N'tu-ao-gia-dinh-bang-go-thiet-ke-dep-ghs-51434-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (510, N'Tủ để quần áo bằng gỗ MDF phun sơn GHS-51433', 3, N'hiện tại chưa có mô tả về sản phẩm', 7500000, 1633862757, N'tu-de-quan-ao-bang-go-mdf-phun-son-ghs-51433-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (511, N'Tủ đựng quần áo gỗ sồi sang trọng GHS-51432', 3, N'hiện tại chưa có mô tả về sản phẩm', 18500000, 1633862757, N'tu-dung-quan-ao-go-soi-sang-trong-ghs-51432-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (512, N'Tủ quần áo đẹp thiết kế cánh mở GHS-51431', 3, N'hiện tại chưa có mô tả về sản phẩm', 4200000, 1633862757, N'tu-quan-ao-dep-thiet-ke-canh-mo-ghs-51431-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (513, N'Tủ để quần áo bằng gỗ thiết kế tiện lợi GHS-51430', 3, N'hiện tại chưa có mô tả về sản phẩm', 4200000, 1633862757, N'tu-de-quan-ao-bang-go-thiet-ke-tien-loi-ghs-51430-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (514, N'Tủ quần áo cánh lùa thiết kế hiện đại GHS-51429', 3, N'hiện tại chưa có mô tả về sản phẩm', 13200000, 1633862757, N'tu-quan-ao-canh-lua-thiet-ke-hien-dai-ghs-51429-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (515, N'Tủ đựng quần áo cánh mở kích thước nhỏ gọn GHS-51428', 3, N'hiện tại chưa có mô tả về sản phẩm', 4600000, 1633862757, N'tu-dung-quan-ao-canh-mo-kich-thuoc-nho-gon-ghs-51428-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (516, N'Tủ áo cánh mở bằng gỗ kiểu dáng nhỏ gọn GHS-51345', 3, N'hiện tại chưa có mô tả về sản phẩm', 7600000, 1633862757, N'tu-ao-canh-mo-bang-go-kieu-dang-nho-gon-ghs-51345-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (517, N'Tủ để quần áo gỗ công nghiệp kết cấu chắc chắn GHS-51344', 3, N'hiện tại chưa có mô tả về sản phẩm', 5700000, 1633862757, N'tu-de-quan-ao-go-cong-nghiep-ket-cau-chac-chan-ghs-51344-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (518, N'Tủ gỗ đựng quần áo gia đình thiết kế hiện đại GHS-51343', 3, N'hiện tại chưa có mô tả về sản phẩm', 8900000, 1633862757, N'tu-go-dung-quan-ao-gia-dinh-thiet-ke-hien-dai-ghs-51343-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (519, N'Tủ để quần áo cánh trượt gỗ MDF cốt lõi xanh GHS-51342', 3, N'hiện tại chưa có mô tả về sản phẩm', 8900000, 1633862757, N'tu-de-quan-ao-canh-truot-go-mdf-cot-loi-xanh-ghs-51342-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (520, N'Tủ quần áo cánh mở gỗ MDF thiết kế hiện đại GHS-51341', 3, N'hiện tại chưa có mô tả về sản phẩm', 6900000, 1633862757, N'tu-quan-ao-canh-mo-go-mdf-thiet-ke-hien-dai-ghs-51341-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (521, N'Tủ đựng quần áo thiết kế cánh trượt triện dụng GHS-51340', 3, N'hiện tại chưa có mô tả về sản phẩm', 12900000, 1633862757, N'tu-dung-quan-ao-thiet-ke-canh-truot-trien-dung-ghs-51340-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (522, N'Tủ quần áo cánh lùa bằng gỗ kết cấu chắc chắn GHS-51339', 3, N'hiện tại chưa có mô tả về sản phẩm', 9300000, 1633862757, N'tu-quan-ao-canh-lua-bang-go-ket-cau-chac-chan-ghs-51339-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (523, N'Tủ áo bằng gỗ cánh trượt thiết kế tiện lợi GHS-51338', 3, N'hiện tại chưa có mô tả về sản phẩm', 8900000, 1633862757, N'tu-ao-bang-go-canh-truot-thiet-ke-tien-loi-ghs-51338-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (524, N'Bàn ăn thông minh, bàn ăn gấp gọn đa năng GHC-41223', 4, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633863561, N'avar-7-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (525, N'Bàn ăn gấp gọn, bàn ăn gỗ thiết kế thông minh GHC-41222', 4, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633863561, N'ban-an-gap-gon-ban-an-go-thiet-ke-thong-minh-ghc-41222-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (526, N'Bàn ăn bằng gỗ 4 chỗ thiết kế đẹp GHS-41221', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863561, N'Ban-an-bang-go-4-cho-thiet-ke-dep-GHS-41221-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (527, N'Bàn ăn gia đình phong cách hiện đại GHS-41220', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863561, N'Ban-an-gia-dinh-phong-cach-hien-dai-GHS-41220-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (528, N'Bàn ăn bằng gỗ đẹp cho gia đình GHS-41219', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863561, N'ban-an-bang-go-dep-cho-gia-dinh-GHS-41219-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (529, N'Bàn ăn gỗ sồi kiểu dáng nhỏ gọn cho gia đình GHS-41218', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863561, N'Ban-an-go-soi-kieu-dang-nho-gon-cho-gia-dinh-GHS-41218-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (530, N'Bộ bàn ăn hiện đại gỗ sồi kiểu dáng nhỏ gọn GHS-41217', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863561, N'Bo-ban-an-hien-dai-go-soi-kieu-dang-nho-gon-GHS-41217-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (531, N'Bàn ăn gia đình 4 chỗ bằng gỗ tự nhiên GHS-41216', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863561, N'Ban-an-gia-dinh-4-cho-bang-go-tu-nhien-GHS-41216-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (532, N'Bàn ăn gỗ sồi thiết kế đẹp thanh lịch GHS-41215', 4, N'hiện tại chưa có mô tả về sản phẩm', 14000000, 1633863561, N'Ban-an-go-soi-thiet-ke-dep-thanh-lich-GHS-41215-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (533, N'Bộ bàn ghế ăn gỗ chất lượng cao cho gia đình GHS-41214', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863561, N'Bo-ban-ghe-an-go-chat-luong-cao-cho-gia-dinh-GHS-41214-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (534, N'Bàn ăn bằng gỗ kiểu dáng thanh lịch GHS-41213', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863561, N'ban-an-bang-go-kieu-dang-tahnh-lich-GHS-41213-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (535, N'Bàn ăn gia đình thiết kế đẹp bằng gỗ sồi GHS-41212', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863561, N'Ban-an-gia-dinh-thiet-ke-dep-bang-go-soi-GHS-41212-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (536, N'Bộ bàn ăn gia đình kiểu dáng nhỏ gọn GHS-41155', 4, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633863562, N'Bo-ban-an-gia-dinh-kieu-dang-nho-gon-GHS-41155-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (537, N'Bàn ăn bằng gỗ chất lượng cao GHS-41154', 4, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633863562, N'Ban-an-bang-go-chat-luong-cao-GHS-41154-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (538, N'Bộ bàn ăn gia đình đẹp thanh lịch GHS-41153', 4, N'hiện tại chưa có mô tả về sản phẩm', 14000000, 1633863562, N'Bo-ban-an-gia-dinh-dep-thanh-lich-GHS-41153-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (539, N'Bàn ăn hiện đại bằng gỗ cho gia đình GHS-41152', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Ban-an-hien-dai-bang-go-cho-gia-dinh-GHS-41152-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (540, N'Bộ bàn ghế ăn bằng gỗ tự nhiên GHS-41151', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Bo-ban-ghe-an-bang-go-tu-nhien-GHS-41151-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (541, N'Bộ bàn ăn gỗ thiết kế ấn tượng GHS-41150', 4, N'hiện tại chưa có mô tả về sản phẩm', 13500000, 1633863562, N'Bo-ban-an-go-thiet-ke-an-tuong-GHS-41150-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (542, N'Bộ bàn ăn tròn phong cách hiện đại GHS-41149', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Bo-ban-an-tron-phong-cach-hien-dai-GHS-41149-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (543, N'Bàn ăn hiện đại cho gia đình GHS-41148', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Ban-an-hien-dai-cho-gia-dinh-GHS-41148-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (544, N'Bàn ăn gia đình bằng gỗ thiết kế đẹp GHS-41147', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Ban-an-gia-dinh-bang-go-thiet-ke-dep-GHS-41147-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (545, N'Bộ bàn ghế ăn phong cách hiện đại GHS-41146', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Bo-ban-ghe-an-phong-cach-hien-dai-GHS-41146-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (546, N'Bàn ăn hiện đại bằng gỗ cao cấp GHS-41145', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'ban-an-hien-dai-bang-go-cao-cap-GHS-41145-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (547, N'Bàn ăn đẹp bằng gỗ tự nhiên GHS-41093', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Ban-an-dep-bang-go-tu-nhien-GHS-41093-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (548, N'Bàn ăn hình vuông bằng gỗ tự nhiên GHS-41092', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Ban-an-hinh-vuong-bang-go-tu-nhien-GHS-41092-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (549, N'Bộ bàn ăn chất lượng cao thiết kế đẹp GHS-41091', 4, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633863562, N'Bo-ban-an-chat-luong-cao-thiet-ke-dep-GHS-41091-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (550, N'Bàn ăn hiện đại 4 ghế cho gia đình GHS-41090', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Ban-an-hien-dai-4-ghe-cho-gia-dinh-GHS-41090-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (551, N'Bàn ăn hiện đại thiết kế ấn tượng GHS-41089', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Ban-an-hien-dai-thiet-ke-an-tuong-GHS-41089-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (552, N'Bàn ăn gỗ tự nhiên cao cấp GHS-41088', 4, N'hiện tại chưa có mô tả về sản phẩm', 14500000, 1633863562, N'Ban-an-go-tu-nhien-cao-cap-GHS-41088-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (553, N'Bộ bàn ăn gỗ đẹp cho gia đình GHS-41087', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Bo-ban-an-go-dep-cho-gia-dinh-GHS-41087-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (554, N'Bàn ăn gia đình bằng gỗ tự nhiên GHS-41086', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Ban-an-gia-dinh-bang-go-tu-nhien-GHS-41086-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (555, N'Bàn ăn bằng gỗ thiết kế đẹp GHS-41085', 4, N'hiện tại chưa có mô tả về sản phẩm', 13000000, 1633863562, N'Ban-an-bang-go-thiet-ke-dep-GHS-41085-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (556, N'Bộ bàn ăn hiện đại cho gia đình GHS-41084', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863562, N'Bo-ban-an-hien-dai-cho-gia-dinh-GHS-41084-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (557, N'Bộ bàn ăn gia đình thiết kế đẹp GHS-41083', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'Bo-ban-an-gia-dinh-thiet-ke-dep-GHS-41083-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (558, N'Bộ bàn ăn gỗ kiểu dáng nhỏ gọn GHS-41082', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'Bo-ban-an-gi-kieu-dang-nho-gon-GHS-41082-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (559, N'Bàn ăn bằng gỗ chất lượng cao GHS-41081', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'Ban-an-bang-go-chat-luong-cao-GHS-41081-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (560, N'Bộ bàn ăn gỗ 4 ghế hiện đại GHS-41080', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'Bo-ban-an-go-4-ghe-hien-dai-GHS-41080-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (561, N'Bàn ăn gia đình hiện đại đẹp GHS-41079', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'Ban-an-gia-dinh-hien-dai-dep-GHS-41079-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (562, N'Bàn ăn gỗ gia đình ghế bọc nỉ cao cấp GHS-4909', 4, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633863563, N'ban-an-go-gia-dinh-ghe-boc-ni-cao-cap-ghs-4909-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (563, N'Bàn ăn gỗ hiện đại thiết kế nhỏ gọn sang trọng GHS-4908', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'ban-an-go-hien-dai-thiet-ke-nho-gon-sang-trong-ghs-4908-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (564, N'Bàn ăn gỗ gia đình đẹp sang trọng hiện đại GHS-4905', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'ban-an-go-gia-dinh-dep-sang-trong-hien-dai-ghs-4905-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (565, N'Bàn ăn gỗ sồi gia đình thiết kế đẹp hiện đại GHS-4902', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'ban-an-go-soi-gia-dinh-thiet-ke-dep-hien-dai-ghs-4902-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (566, N'Bàn ăn hiện đại bằng gỗ sồi tự nhiên sang trọng GHS-4900', 4, N'hiện tại chưa có mô tả về sản phẩm', 12500000, 1633863563, N'ban-an-hien-dai-bang-go-soi-tu-nhien-sang-trong-ghs-4900-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (567, N'Bàn ăn gỗ gia đình thiết kế sang trọng hiện đại GHS-4899', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'ban-an-go-gia-dinh-thiet-ke-sang-trong-hien-dai-ghs-4899-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (568, N'Bàn ăn gỗ công nghiệp nhỏ gọn tiện lợi GHS-4854', 4, N'hiện tại chưa có mô tả về sản phẩm', 7000000, 1633863563, N'ban-an-go-cong-nghiep-nho-gon-tien-loi-ghs-4854-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (569, N'Bàn ăn gỗ gia đình thiết kế đẹp hiện đại GHS-4853', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'ban-an-go-gia-dinh-thiet-ke-dep-hien-dai-ghs-4853-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (570, N'Bàn ăn gỗ hiện đại sang trọng tiện dụng GHS-4852', 4, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863563, N'ban-an-go-hien-dai-sang-trong-tien-dung-ghs-4852-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (571, N'Bàm làm việc thông minh tiết kiệm diện tích GHC-4624', 5, N'hiện tại chưa có mô tả về sản phẩm', 1400000, 1633863702, N'ban-lam-viec-thong-minh-GHC-4624-11-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (572, N'Bàn làm việc gỗ, bàn học đa năng thiết kế hiện đại GHC-4623', 5, N'hiện tại chưa có mô tả về sản phẩm', 1300000, 1633863702, N'ban-lam-viec-go-ban-hoc-da-nang-thiet-ke-hien-dai-ghc-4623-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (573, N'Bàn làm việc Tatami, bàn học bằng gỗ MDF GHC-4622', 5, N'hiện tại chưa có mô tả về sản phẩm', 1800000, 1633863702, N'ban-lam-viec-tatami-ban-hoc-bang-go-mdf-ghc-4622-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (574, N'Bàn học đôi, bàn làm việc đôi gỗ MDF GHC-4612', 5, N'hiện tại chưa có mô tả về sản phẩm', 1999000, 1633863702, N'ban-hoc-doi-ban-lam-viec-doi-go-mdf-ghc-4612-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (575, N'Bàn làm việc tại nhà, bàn làm việc nhỏ gọn GHC-4609', 5, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633863702, N'avar-2-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (576, N'Bàn làm việc ngồi bệt, bàn học bệt tiết kiệm diện tích GHC-4601', 5, N'hiện tại chưa có mô tả về sản phẩm', 699000, 1633863702, N'avar-ban-lam-viec-ngoi-bet-ghc-4601-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (577, N'Bàn làm việc gỗ di động, bàn gỗ liền kệ nhỏ gọn GHC-4604', 5, N'hiện tại chưa có mô tả về sản phẩm', 999000, 1633863702, N'ban-lam-viec-go-di-dong-ban-go-lien-ke-nho-gon-ghc-4604-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (578, N'Bàn làm việc di động, bàn gỗ làm việc chắc chắn GHC-4603', 5, N'hiện tại chưa có mô tả về sản phẩm', 999000, 1633863702, N'ban-lam-viec-di-dong-ban-go-lam-viec-chac-chan-ghc-4603-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (579, N'Bàn máy tính, bàn học sinh viên, bàn làm việc tại nhà GHC-41416', 5, N'hiện tại chưa có mô tả về sản phẩm', 999000, 1633863702, N'Bàn-máy-tính-bàn-h?c-sinh-viên-bàn-làm-vi?c-t?i-nhà-GHC-41416-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (580, N'Bàn Nhật đa năng bằng gỗ sồi cao cấp GHC-41414', 5, N'hiện tại chưa có mô tả về sản phẩm', 2200000, 1633863702, N'ban-nhat-da-nang-bang-go-soi-cao-cap-ghc-41414-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (581, N'Bàn làm việc thông minh bằng gỗ công nghiệp GHS-4155-2', 5, N'hiện tại chưa có mô tả về sản phẩm', 2800000, 1633863702, N'ban-lam-viec-thong-minh-bang-go-cong-nghiep-ghs-4155-2-ava-300x300.jpg', NULL, NULL)
GO
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (582, N'Bàn xoay 360 độ &#8211; Bàn học, bàn làm việc GHC-4155-2', 5, N'hiện tại chưa có mô tả về sản phẩm', 1299000, 1633863702, N'ban-lam-viec-thong-minh-4155-2-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (583, N'Bàn làm việc hiện đại liền giá sách bằng gỗ GHS-41413', 5, N'hiện tại chưa có mô tả về sản phẩm', 4800000, 1633863702, N'ban-lam-viec-hien-dai-lien-gia-sach-bang-go-ghs-41413-15-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (584, N'Bàn làm việc gỗ liền giá sách bền đẹp GHS-41411', 5, N'hiện tại chưa có mô tả về sản phẩm', 4600000, 1633863702, N'ban-lam-viec-go-lien-gia-sach-ben-dep-ghs-41411-ava-3-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (585, N'Bàn làm việc liền giá kết cấu chắc chắn GHS-41410', 5, N'hiện tại chưa có mô tả về sản phẩm', 4800000, 1633863703, N'ban-lam-viec-lien-gia-ket-cau-chac-chan-ghs-41410-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (586, N'Bàn làm việc tại nhà liền tủ chứa tài liệu GHS-41408', 5, N'hiện tại chưa có mô tả về sản phẩm', 3600000, 1633863703, N'ban-lam-viec-tai-nha-lien-tu-chua-tai-lieu-ghs-41408-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (587, N'Bàn làm việc đơn giản kiểu dáng hiện đại GHS-41407', 5, N'hiện tại chưa có mô tả về sản phẩm', 2900000, 1633863703, N'ban-lam-viec-don-gian-kieu-dang-hien-dai-ghs-41407-9-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (588, N'Bàn làm việc gỗ MDF liền tủ tài liệu GHS-41406', 5, N'hiện tại chưa có mô tả về sản phẩm', 3600000, 1633863703, N'ban-lam-viec-go-mdf-lien-tu-tai-lieu-ghs-41406-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (589, N'Bàn làm việc tại nhà bằng gỗ công nghiệp GHS-41405', 5, N'hiện tại chưa có mô tả về sản phẩm', 3600000, 1633863703, N'ban-lam-viec-tai-nha-bang-go-cong-nghiep-ghs-41405-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (590, N'Bàn làm việc nhỏ gọn bằng gỗ MDF cốt lõi xanh GHS-41404', 5, N'hiện tại chưa có mô tả về sản phẩm', 3500000, 1633863703, N'ban-lam-viec-nho-gon-bang-go-mdf-cot-loi-xanh-ghs-41404-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (591, N'Bàn làm việc cá nhân thiết kế đơn giản GHS-41403', 5, N'hiện tại chưa có mô tả về sản phẩm', 3600000, 1633863703, N'ban-lam-viec-ca-nhan-thiet-ke-don-gian-ghs-41403-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (592, N'Bàn làm việc bằng gỗ thiết kế đa năng GHS-41401', 5, N'hiện tại chưa có mô tả về sản phẩm', 2900000, 1633863703, N'ban-lam-viec-bang-go-thiet-ke-da-nang-ghs-41401-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (593, N'Bàn làm việc gỗ kiểu dáng nhỏ gọn GHS-41396', 5, N'hiện tại chưa có mô tả về sản phẩm', 5300000, 1633863703, N'ban-lam-viec-go-kieu-dang-nho-gon-ghs-41396-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (594, N'Bàn làm việc gỗ công nghiệp cao cấp GHS-41400', 5, N'hiện tại chưa có mô tả về sản phẩm', 3200000, 1633863703, N'ban-lam-viec-go-cong-nghiep-cao-cap-ghs-41400-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (595, N'Bàn làm việc hiện đại kích thước nhỏ gọn GHS-41399', 5, N'hiện tại chưa có mô tả về sản phẩm', 3200000, 1633863703, N'ban-lam-viec-hien-dai-go-GHS-41399-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (596, N'Bàn làm việc liền giá kiểu dáng đơn giản GHS-41398', 5, N'hiện tại chưa có mô tả về sản phẩm', 3000000, 1633863703, N'ban-lam-viec-lien-gia-kieu-dang-don-gian-ghs-41398-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (597, N'Bàn làm việc bằng gỗ MDF phủ melamine GHS-41397', 5, N'hiện tại chưa có mô tả về sản phẩm', 5300000, 1633863703, N'ban-lam-viec-bang-go-mdf-phu-melamine-ghs-41397-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (598, N'Bàn làm việc đẹp bằng gỗ phong cách hiện đại GHS-41373', 5, N'hiện tại chưa có mô tả về sản phẩm', 7800000, 1633863703, N'Ban-lam-viec-dep-bang-go-phong-cach-hien-dai-GHS-41373-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (599, N'Bàn làm việc gỗ sồi tự nhiên thiết kế đẹp GHS-41372', 5, N'hiện tại chưa có mô tả về sản phẩm', 7000000, 1633863703, N'Ban-lam-viec-go-soi-tu-nhien-thiet-ke-dep-GHS-41372-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (600, N'Bàn làm việc cá nhân bằng gỗ công nghiệp nhỏ gọn GHS-41371', 5, N'hiện tại chưa có mô tả về sản phẩm', 3300000, 1633863703, N'Ban-lam-viec-ca-nhan-bang-go-cong-nghiep-nho-gon-GHS-41371-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (601, N'Bàn làm việc gỗ công nghiệp khung sắt chất lượng cao GHS-41370', 5, N'hiện tại chưa có mô tả về sản phẩm', 3400000, 1633863703, N'Ban-lam-viec-go-cong-nghiep-khung-sat-chat-luong-cao-GHS-41370-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (602, N'Bàn làm việc tại nhà bằng gỗ thiết kế tiện lợi GHS-41369', 5, N'hiện tại chưa có mô tả về sản phẩm', 3600000, 1633863703, N'Ban-lam-viec-tai-nha-bang-go-thiet-ke-tien-loi-GHS-41369-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (603, N'Bàn làm việc đẹp kiểu dáng nhỏ gọn gỗ công nghiệp GHS-41368', 5, N'hiện tại chưa có mô tả về sản phẩm', 3300000, 1633863703, N'Ban-lam-viec-dep-kieu-dang-nho-gon-go-cong-nghiep-GHS-41368-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (604, N'Bàn làm việc gỗ tự nhiên thiết kế tiện dụng GHS-41366', 5, N'hiện tại chưa có mô tả về sản phẩm', 4900000, 1633863703, N'Ban-lam-viec-go-tu-nhien-thiet-ke-tien-dung-GHS-41366-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (605, N'Bàn làm việc hiện đại thiết kế đẹp thông minh GHS-41365', 5, N'hiện tại chưa có mô tả về sản phẩm', 3900000, 1633863704, N'Ban-lam-viec-hien-dai-thiet-ke-dep-thong-minh-GHS-41365-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (606, N'Bàn làm việc tại nhà nhỏ gọn thiết kế đẹp GHS-41364', 5, N'hiện tại chưa có mô tả về sản phẩm', 4500000, 1633863704, N'Ban-lam-viec-tai-nha-nho-gon-thiet-ke-dep-GHS-41364-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (607, N'Bàn làm việc gỗ công nghiệp phun sơn cao cấp GHS-41363', 5, N'hiện tại chưa có mô tả về sản phẩm', 4200000, 1633863704, N'Ban-lam-viec-go-cong-nghiep-phun-son-cao-cap-GHS-41363-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (608, N'Bàn làm việc hiện đại bằng gỗ công nghiệp cho cá nhân GHS-41362', 5, N'hiện tại chưa có mô tả về sản phẩm', 3500000, 1633863704, N'Ban-lam-viec-hien-dai-bang-go-cong-nghiep-cho-ca-nhan-GHS-41362-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (609, N'Bàn làm việc tại nhà bằng gỗ kiểu dáng nhỏ gọn GHS-41361', 5, N'hiện tại chưa có mô tả về sản phẩm', 3200000, 1633863704, N'Ban-lam-viec-tai-nha-bang-go-kieu-dang-nho-gon-GHS-41361-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (610, N'Bàn làm việc gỗ công nghiệp tiện lợi kèm giá sách GHS-41360', 5, N'hiện tại chưa có mô tả về sản phẩm', 4100000, 1633863704, N'Ban-lam-viec-go-cong-nghiep-tien-loi-kem-gia-sach-GHS-41360-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (611, N'Bàn làm việc cá nhân tại nhà kiểu dáng nhỏ gọn GHS-41359', 5, N'hiện tại chưa có mô tả về sản phẩm', 3500000, 1633863704, N'Ban-lam-viec-ca-nhan-tai-nha-kieu-dang-nho-gon-GHS-41359-ava-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (612, N'Bàn làm việc gỗ công nghiệp phun sơn hiện đại GHS-41358', 5, N'hiện tại chưa có mô tả về sản phẩm', 3800000, 1633863704, N'Ban-lam-viec-go-cong-nghiep-phun-son-hien-dai-GHS-41358-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (613, N'Bàn làm việc tại nhà khung sắt chất lượng cao GHS-41357', 5, N'hiện tại chưa có mô tả về sản phẩm', 3500000, 1633863704, N'Ban-lam-viec-tai-nha-khung-sat-chat-luong-cao-GHS-41357-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (614, N'Bàn làm việc cá nhân bằng gỗ kiểu dáng nhỏ gọn GHS-41356', 5, N'hiện tại chưa có mô tả về sản phẩm', 3300000, 1633863704, N'Ban-lam-viec-ca-nhan-bang-go-kieu-dang-nho-gon-GHS-41356-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (615, N'Bàn làm việc gỗ công nghiệp khung sắt tĩnh điện GHS-41355', 5, N'hiện tại chưa có mô tả về sản phẩm', 3700000, 1633863704, N'Ban-lam-viec-go-cong-nghiep-khung-sat-phun-son-tinh-dien-GHS-41355-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (616, N'Bàn làm việc tại nhà thiết kế hiện đại GHS-41315', 5, N'hiện tại chưa có mô tả về sản phẩm', 4700000, 1633863704, N'Ban-lam-viec-tai-nha-thiet-ke-hien-dai-bang-go-GHS-41315-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (617, N'Bàn làm việc tiện dụng bằng gỗ công nghiệp GHS-41314', 5, N'hiện tại chưa có mô tả về sản phẩm', 6500000, 1633863704, N'Ban-lam-viec-tien-dung-bang-go-cong-nghiep-GHS-41314-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (618, N'Giường ngủ Nhật Tatami 1m8 x 2m bằng gỗ công nghiệp GHC-9230', 6, N'hiện tại chưa có mô tả về sản phẩm', 2500000, 1633863862, N'giuong-ngu-nhat-tatami-bang-go-cong-nghiep-ghc-9230-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (619, N'Giường ngủ cho trẻ em 1m4 thiết kế ấn tượng GHC-9226', 6, N'hiện tại chưa có mô tả về sản phẩm', 3500000, 1633863862, N'giuong-ngu-cho-tre-em-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (620, N'Giường gỗ cho bé 1m2 kết hợp giá sách hiện đại GHC-9225', 6, N'hiện tại chưa có mô tả về sản phẩm', 3300000, 1633863862, N'giuong-go-cho-be-ghc-9226-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (621, N'Giường ngủ gỗ cho bé, giường ngủ mái nhà bằng gỗ GHS-9228', 6, N'hiện tại chưa có mô tả về sản phẩm', 5500000, 1633863862, N'giuong-ngu-cho-be-giuong-ngu-mai-nha-bang-go-ghc-9228-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (622, N'Giường ngủ cho bé, giường gỗ công nghiệp MDF đẹp GHS-9227', 6, N'hiện tại chưa có mô tả về sản phẩm', 5500000, 1633863862, N'giuong-ngu-cho-be-giuong-go-cong-nghiep-mdf-dep-ghc-9227-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (623, N'Giường Nhật bằng gỗ MDF chất lượng rộng 1m6 GHC-9224', 6, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633863862, N'giuong-nhat-bang-go-GHC-9224-10-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (624, N'Giường gỗ MDF phong cách Tatami rộng 1m4 GHC-9223', 6, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633863862, N'giuong-go-MDF-ghc-9223-11-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (625, N'Giường Tatami bằng gỗ công nghiệp cao cấp rộng 1m2 GHC-9222', 6, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633863863, N'giuong-tatami-bang-go-ghc-9222-11-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (626, N'Giường ngủ bệt kiểu Nhật gỗ công nghiệp rộng 1m GHC-9221', 6, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633863863, N'giuong-ngu-bet-GHC-9221-11-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (627, N'Giường ngủ Nhật Tatami rộng 1m6 bằng gỗ công nghiệp GHC-9220', 6, N'hiện tại chưa có mô tả về sản phẩm', 2400000, 1633863863, N'giuong-ngu-nhat-tatami-rong-1m6-bang-go-cong-nghiep-ghc-9220-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (628, N'Giường ngủ gỗ MDF Tatami rộng 1m4 thiết kế mới GHC-9219', 6, N'hiện tại chưa có mô tả về sản phẩm', 2200000, 1633863863, N'giuong-ngu-go-mdf-tatami-rong-1m4-thiet-ke-moi-ghc-9219-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (629, N'Giường ngủ hiện đại Tatami rộng 1m2 kết cấu chắc chắn GHC-9218', 6, N'hiện tại chưa có mô tả về sản phẩm', 2000000, 1633863863, N'giuong-ngu-hien-dai-tatami-rong-1m2-ket-cau-chac-chan-ghc-9218-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (630, N'Giường ngủ gia đình rộng 1m phong cách Nhật GHC-9217', 6, N'hiện tại chưa có mô tả về sản phẩm', 1900000, 1633863863, N'giuong-ngu-gia-dinh-phong-cach-nhat-ghc-9217-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (631, N'Giường ngủ gỗ công nghiệp MDF thiết kế mới GHC-9216', 6, N'hiện tại chưa có mô tả về sản phẩm', 2500000, 1633863863, N'giuong-ngu-go-cong-nghiep-mdf-thiet-ke-moi-ghc-9216-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (632, N'Giường Nhật bằng gỗ rộng 1m4 kiểu dáng hiện đại GHC-9215', 6, N'hiện tại chưa có mô tả về sản phẩm', 2300000, 1633863863, N'giuong-nhat-bang-go-rong-1m4-kieu-dang-hien-dai-ghc-9215-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (633, N'Giường gỗ MDF rộng 1m2 phong cách Nhật GHC-9214', 6, N'hiện tại chưa có mô tả về sản phẩm', 2200000, 1633863863, N'giuong-go-mdf-rong-1m2-phong-cach-nhat-ghc-9214-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (634, N'Giường ngủ Tatami rộng 1m thiết kế đơn giản GHC-9213', 6, N'hiện tại chưa có mô tả về sản phẩm', 2100000, 1633863863, N'giuong-ngu-tatami-rong-1m-thiet-ke-don-gian-ghc-9213-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (635, N'Giường ngủ Tatami thiết kế trẻ trung GHC-9209', 6, N'hiện tại chưa có mô tả về sản phẩm', 2400000, 1633863863, N'giuong-ngu-tatami-thiet-ke-tre-trung-ghc-9209-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (636, N'Set giường bệt tab đầu giường kiểu Nhật GHC-9208', 6, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633863863, N'set-giuong-bet-tab-dau-giuong-kieu-nhat-ghc-9208-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (637, N'Giường Nhật Tatami bằng gỗ công nghiệp GHC-9207', 6, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633863863, N'giuong-nhat-tatami-bang-go-cong-nghiep-ghc-9207-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (638, N'Giường gỗ MDF, giường ngủ kết cấu chắc chắn GHC-9206', 6, N'hiện tại chưa có mô tả về sản phẩm', 2999000, 1633863863, N'giuong-go-mdf-giuong-ngu-ket-cau-chac-chan-ghc-9206-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (639, N'Giường gia đình gỗ cao cấp thiết kế đa năng GHS-9205', 6, N'hiện tại chưa có mô tả về sản phẩm', 8200000, 1633863863, N'giuong-gia-dinh-go-cao-cap-thiet-ke-da-nang-ghs-9205-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (640, N'Giường đơn bằng gỗ công nghiệp thiết kế đơn giản GHS-9204', 6, N'hiện tại chưa có mô tả về sản phẩm', 4900000, 1633863863, N'giuong-don-bang-go-cong-nghiep-thiet-ke-don-gian-ghs-9204-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (641, N'Giường ngủ gỗ gia đình thiết kế đơn giản GHS-9203', 6, N'hiện tại chưa có mô tả về sản phẩm', 5600000, 1633863863, N'giuong-ngu-go-gia-dinh-thiet-ke-don-gian-ghs-9203-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (642, N'Giường ngủ Nhật bằng gỗ thiết kế tiện lợi GHS-9202', 6, N'hiện tại chưa có mô tả về sản phẩm', 6900000, 1633863863, N'giuong-ngu-nhat-bang-go-thiet-ke-tien-loi-ghs-9202-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (643, N'Giường ngủ gỗ MDF thiết kế kiểu dáng đơn giản GHS-9201', 6, N'hiện tại chưa có mô tả về sản phẩm', 7900000, 1633863863, N'giuong-ngu-go-mdf-thiet-ke-kieu-dang-don-gian-ghs-9201-ava-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (644, N'Giường gỗ gia đình kiểu dáng sang trọng GHS-9200', 6, N'hiện tại chưa có mô tả về sản phẩm', 7900000, 1633863864, N'giuong-go-gia-dinh-kieu-dang-sang-trong-ghs-9200-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (645, N'Giường ngủ đẹp hiện đại thiết kế đa năng GHS-9199', 6, N'hiện tại chưa có mô tả về sản phẩm', 7800000, 1633863864, N'giuong-ngu-dep-hien-dai-thiet-ke-da-nang-ghs-9199-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (646, N'Giường ngủ gia đình cao cấp làm bằng gỗ MDF GHS-9198', 6, N'hiện tại chưa có mô tả về sản phẩm', 8300000, 1633863864, N'giuong-ngu-gia-dinh-cao-cap-lam-bang-go-mdf-ghs-9198-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (647, N'Giường ngủ hiện đại bằng gỗ thiết kế liền giá trưng bày GHS-9196', 6, N'hiện tại chưa có mô tả về sản phẩm', 7500000, 1633863864, N'giuong-ngu-hien-dai-bang-go-thiet-ke-lien-gia-trung-bay-ghs-9196-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (648, N'Giường ngủ gia đình hiện đại thiết kế trẻ trung GHS-9195', 6, N'hiện tại chưa có mô tả về sản phẩm', 6500000, 1633863864, N'giuong-ngu-gia-dinh-hien-dai-thiet-ke-tre-trung-ghs-9195-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (649, N'Giường gỗ công nghiệp MDF thiết kế đa năng GHS-9192', 6, N'hiện tại chưa có mô tả về sản phẩm', 5900000, 1633863864, N'giuong-go-cong-nghiep-mdf-thiet-ke-da-nang-ghs-9192-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (650, N'Giường hộp, giường ngủ gỗ hiện đại thiết kế tiện lợi GHC-9194', 6, N'hiện tại chưa có mô tả về sản phẩm', 3200000, 1633863864, N'giuong-hop-hien-dai-thiet-ke-tien-loi-ghc-9194-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (651, N'Giường ngủ, giường gỗ MDF thiết kế sang trọng GHC-9193', 6, N'hiện tại chưa có mô tả về sản phẩm', 4500000, 1633863864, N'giuong-queen-bang-go-mdf-thiet-ke-sang-trong-ghc-9193-1-1-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (652, N'Giường Bệt – Giường ngủ, giường gỗ, giường sập gỗ GHC-9192', 6, N'hiện tại chưa có mô tả về sản phẩm', 2800000, 1633863864, N'ghc-9192-tk-300x300.png', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (653, N'Giường ngủ bằng gỗ thiết kế sang trọng GHC-9093', 6, N'hiện tại chưa có mô tả về sản phẩm', 10000000, 1633863864, N'giuong-ngu-bang-go-thiet-ke-sang-trong-ghc-9093-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (654, N'Giường gỗ tự nhiên cao cấp thiết kế đơn giản GHS-9191', 6, N'hiện tại chưa có mô tả về sản phẩm', 10500000, 1633863864, N'giuong-go-tu-nhien-cao-cap-thiet-ke-don-gian-ghs-9191-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (655, N'Giường ngủ bằng gỗ hiện đại kiểu dáng sang trọng GHS-9190', 6, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863864, N'giuong-ngu-bang-go-hien-dai-kieu-dang-sang-trong-ghs-9190-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (656, N'Giường gỗ sồi tự nhiên kết cấu chắc chắn GHS-9189', 6, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863864, N'giuong-go-soi-tu-nhien-ket-cau-chac-chan-ghs-9189-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (657, N'Giường ngủ hiện đại bằng gỗ sồi GHS-9188', 6, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633863864, N'giuong-ngu-hien-dai-bang-go-soi-ghs-9188-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (658, N'Giường ngủ gỗ sồi thiết kế đơn giản GHS-9187', 6, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863864, N'giuong-ngu-go-soi-thiet-ke-don-gian-ghs-9187-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (659, N'Giường ngủ gia đình bằng gỗ thiết kế sang trọng GHS-9186', 6, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633863864, N'giuong-ngu-gia-dinh-bang-go-thiet-ke-sang-trong-ghs-9186-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (660, N'Giường ngủ hiện đại kiểu dáng sang trọng GHS-9185', 6, N'hiện tại chưa có mô tả về sản phẩm', 11000000, 1633863864, N'giuong-ngu-hien-dai-kieu-dang-sang-trong-ghs-9185-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (661, N'Giường ngủ gỗ sồi thiết kế sang trọng GHS-9184', 6, N'hiện tại chưa có mô tả về sản phẩm', 11000000, 1633863864, N'giuong-ngu-go-soi-thiet-ke-sang-trong-ghs-9184-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (662, N'Giường ngủ gỗ sồi đa năng tiện dụng GHS-9183', 6, N'hiện tại chưa có mô tả về sản phẩm', 11500000, 1633863864, N'giuong-ngu-go-soi-da-nang-tien-dung-ghs-9183-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (663, N'Giường ngủ gỗ đẹp kết cấu chắc chắn GHS-9182', 6, N'hiện tại chưa có mô tả về sản phẩm', 11000000, 1633863864, N'giuong-ngu-go-dep-ket-cau-chac-chan-ghs-9182-ava-300x300.jpg', NULL, NULL)
INSERT [dbo].[tblProduct] ([id], [name], [category_id], [description], [price], [created_at], [img], [views], [sale]) VALUES (664, N'Giường ngủ bằng gỗ thiết kế phong cách hiện đại GHS-9181', 6, N'hiện tại chưa có mô tả về sản phẩm', 12000000, 1633863864, N'giuong-ngu-bang-go-thiet-ke-phong-cach-hien-dai-ghs-9181-ava-300x300.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductCategory] ON 

INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (1, N'Giá sách gỗ', 1223131)
INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (2, N'Kệ ti vi', 1231123)
INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (3, N'Tủ quần áo', 323232)
INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (4, N'Bàn ghế ăn', 1123123123)
INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (5, N'Bàn làm việc', 23232323)
INSERT [dbo].[tblProductCategory] ([id], [name], [created_at]) VALUES (6, N'Giường', 32322)
SET IDENTITY_INSERT [dbo].[tblProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (1, N'hai123456', N'asdasdasdasd', N'mitt@gmail.com', 1, 123123213)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (2, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (3, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (4, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (5, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (6, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (7, N'@username', N'@password', N'@email', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (8, N'hai', N'112344545', N'hai@gmail.com', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (9, N'admin', N'dsfsdfsdfds', N'hai@gmail.com', 0, 0)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (10, N'hai', N'sdfsdfsdfsd', N'hai@gmail.com', 0, 1633978899)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (11, N'hai', N'123456789', N'hai@gmail.com', 0, 1633979219)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (12, N'hai', N'2b070a650a92129c2462deae7707b0c5', N'hai@gmail.com', 0, 1633979438)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (13, N'hai_test', N'e6db1baa29d3df1eb307ff6a12c778da', N'hai@gmail.com', 0, 1633983501)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (14, N'testlogin', N'25d55ad283aa400af464c76d713c07ad', N'testlogin@gmail.com', 0, 1633997585)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (15, N'testlogin1', N'e10adc3949ba59abbe56e057f20f883e', N'testlogin1@gmail.com', 0, 1633997674)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (16, N'testlogin1', N'e10adc3949ba59abbe56e057f20f883e', N'testlogin1@gmail.com', 0, 1633998096)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (17, N'testlogin2', N'fcea920f7412b5da7be0cf42b8c93759', N'testlogin2@gmail.com', 0, 1633999119)
INSERT [dbo].[tblUsers] ([id], [username], [password], [email], [role], [created_at]) VALUES (18, N'hai1234', N'fcea920f7412b5da7be0cf42b8c93759', N'hai@gmail.com', 0, 1634051940)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_views]  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[tblInfo]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblInfo] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD  CONSTRAINT [fk_user_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsers] ([id])
GO
ALTER TABLE [dbo].[tblInvoice] CHECK CONSTRAINT [fk_user_1]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [fk_product_product_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tblProductCategory] ([id])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [fk_product_product_category]
GO
ALTER TABLE [dbo].[tblStores]  WITH CHECK ADD  CONSTRAINT [fk_store_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tblProduct] ([id])
GO
ALTER TABLE [dbo].[tblStores] CHECK CONSTRAINT [fk_store_product]
GO
ALTER TABLE [dbo].[tlbInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[tblInvoice] ([id])
GO
ALTER TABLE [dbo].[tlbInvoiceDetail] CHECK CONSTRAINT [fk_invoice]
GO
ALTER TABLE [dbo].[tlbInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [fk_invoice_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tblProduct] ([id])
GO
ALTER TABLE [dbo].[tlbInvoiceDetail] CHECK CONSTRAINT [fk_invoice_product]
GO
USE [master]
GO
ALTER DATABASE [dogo-hungha] SET  READ_WRITE 
GO
