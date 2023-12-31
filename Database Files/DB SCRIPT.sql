USE [master]
GO
/****** Object:  Database [ES.Models.DB]    Script Date: 6/17/2023 8:23:18 PM ******/
CREATE DATABASE [ES.Models.DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ES.Models.DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ES.Models.DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ES.Models.DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ES.Models.DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ES.Models.DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ES.Models.DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ES.Models.DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ES.Models.DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ES.Models.DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ES.Models.DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ES.Models.DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ES.Models.DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ES.Models.DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ES.Models.DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ES.Models.DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ES.Models.DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ES.Models.DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ES.Models.DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ES.Models.DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ES.Models.DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ES.Models.DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ES.Models.DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ES.Models.DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ES.Models.DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ES.Models.DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ES.Models.DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ES.Models.DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ES.Models.DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ES.Models.DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ES.Models.DB] SET  MULTI_USER 
GO
ALTER DATABASE [ES.Models.DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ES.Models.DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ES.Models.DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ES.Models.DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ES.Models.DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ES.Models.DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ES.Models.DB] SET QUERY_STORE = OFF
GO
USE [ES.Models.DB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6/17/2023 8:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone No] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 6/17/2023 8:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[User Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2023 8:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[OrderDate] [datetime] NULL,
	[OrderTotal] [decimal](18, 2) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2023 8:23:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Productname] [nvarchar](max) NULL,
	[Qty] [int] NULL,
	[UnitPrice] [float] NULL,
	[Productname2] [nvarchar](max) NULL,
	[Qty2] [int] NULL,
	[UnitPrice2] [float] NULL,
	[Productname3] [nvarchar](max) NULL,
	[Qty3] [int] NULL,
	[UnitPrice3] [float] NULL,
	[Productname4] [nvarchar](max) NULL,
	[Qty4] [int] NULL,
	[UnitPrice4] [float] NULL,
	[Productname5] [nvarchar](max) NULL,
	[Qty5] [int] NULL,
	[UnitPrice5] [float] NULL,
	[Productname6] [nvarchar](max) NULL,
	[Qty6] [int] NULL,
	[UnitPrice6] [float] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Customer Name], [Address], [Phone No], [Email]) VALUES (6, N'Test ', N'Test ', N'xxxxx', N'xxxxx')
INSERT [dbo].[Customers] ([Id], [Customer Name], [Address], [Phone No], [Email]) VALUES (7, N'Test 2', N'Test 2', N'xxxxx', N'xxxxx')
INSERT [dbo].[Customers] ([Id], [Customer Name], [Address], [Phone No], [Email]) VALUES (8, N'Test 3', N'Test 3', N'xxxxx', N'xxxxx')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [Name], [User Name], [Password]) VALUES (7, N'Saruna', N'Admin', N'admin123')
INSERT [dbo].[Login] ([Id], [Name], [User Name], [Password]) VALUES (8, N'test', N'test', N'test')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CustomerName], [CustomerAddress], [Phone], [OrderDate], [OrderTotal], [ProductId]) VALUES (58, N'Test 5', N'Test 5', N'0763045215', CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(4600.00 AS Decimal(18, 2)), 58)
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [CustomerAddress], [Phone], [OrderDate], [OrderTotal], [ProductId]) VALUES (59, N'Test 4', N'Test 4', N'0763045215', CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(575.00 AS Decimal(18, 2)), 59)
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [CustomerAddress], [Phone], [OrderDate], [OrderTotal], [ProductId]) VALUES (60, N'test test test1', N'100', N'0763045215', CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(51750.00 AS Decimal(18, 2)), 60)
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [CustomerAddress], [Phone], [OrderDate], [OrderTotal], [ProductId]) VALUES (61, N'Test 3', N'Test 3', N'0763045215', CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(52900.00 AS Decimal(18, 2)), 61)
INSERT [dbo].[Orders] ([OrderId], [CustomerName], [CustomerAddress], [Phone], [OrderDate], [OrderTotal], [ProductId]) VALUES (62, N'Test 2d', N'Test 2d', N'0763045215', CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(9407.00 AS Decimal(18, 2)), 62)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Productname], [Qty], [UnitPrice], [Productname2], [Qty2], [UnitPrice2], [Productname3], [Qty3], [UnitPrice3], [Productname4], [Qty4], [UnitPrice4], [Productname5], [Qty5], [UnitPrice5], [Productname6], [Qty6], [UnitPrice6]) VALUES (58, N'Roasted Currry Powder', 10, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Productname], [Qty], [UnitPrice], [Productname2], [Qty2], [UnitPrice2], [Productname3], [Qty3], [UnitPrice3], [Productname4], [Qty4], [UnitPrice4], [Productname5], [Qty5], [UnitPrice5], [Productname6], [Qty6], [UnitPrice6]) VALUES (59, NULL, NULL, NULL, N'Pepper Powder', 10, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Productname], [Qty], [UnitPrice], [Productname2], [Qty2], [UnitPrice2], [Productname3], [Qty3], [UnitPrice3], [Productname4], [Qty4], [UnitPrice4], [Productname5], [Qty5], [UnitPrice5], [Productname6], [Qty6], [UnitPrice6]) VALUES (60, N'Roasted Currry Powder', 100, 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Productname], [Qty], [UnitPrice], [Productname2], [Qty2], [UnitPrice2], [Productname3], [Qty3], [UnitPrice3], [Productname4], [Qty4], [UnitPrice4], [Productname5], [Qty5], [UnitPrice5], [Productname6], [Qty6], [UnitPrice6]) VALUES (61, N'Roasted Currry Powder', 100, 450, N'Pepper Powder', 10, 50, N'Curry Powder', 50, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Productname], [Qty], [UnitPrice], [Productname2], [Qty2], [UnitPrice2], [Productname3], [Qty3], [UnitPrice3], [Productname4], [Qty4], [UnitPrice4], [Productname5], [Qty5], [UnitPrice5], [Productname6], [Qty6], [UnitPrice6]) VALUES (62, N'Roasted Currry Powder', 10, 450, N'Pepper Powder', 10, 50, N'Curry Powder', 10, 78, N'Chilli Pieces', 10, 80, N'Chilli Powder', 10, 70, N'Turmeric Powder', 10, 90)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_ProductId]    Script Date: 6/17/2023 8:23:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[Orders]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [ES.Models.DB] SET  READ_WRITE 
GO
