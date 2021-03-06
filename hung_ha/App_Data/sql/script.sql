USE [master]
GO
/****** Object:  Database [dogo-hungha]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tblInfo]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tblProduct]    Script Date: 10/14/2021 11:54:40 PM ******/
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
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductCategory]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tblStores]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/14/2021 11:54:40 PM ******/
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
/****** Object:  Table [dbo].[tlbInvoiceDetail]    Script Date: 10/14/2021 11:54:40 PM ******/
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
