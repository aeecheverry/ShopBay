/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [ShopBay]    Script Date: 30/09/2017 5:26:50 p. m. ******/
CREATE DATABASE [ShopBay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ShopBay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ShopBay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopBay] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBay] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopBay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopBay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopBay] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopBay] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopBay', N'ON'
GO
ALTER DATABASE [ShopBay] SET QUERY_STORE = OFF
GO
USE [ShopBay]
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
USE [ShopBay]
GO
/****** Object:  Table [dbo].[AdminUsers]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUsers](
	[AdminID] [int] NOT NULL,
	[Username] [varchar](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AdminUsers] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auction]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auction](
	[AuctionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[EndDate] [date] NULL,
	[CurrentBid] [int] NULL,
 CONSTRAINT [PK_Auction] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BidList]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BidList](
	[AuctionID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Bid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryTitle] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CategoryImage] [image] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageCatalog]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageCatalog](
	[ProductID] [int] NOT NULL,
	[ProductImage] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movements]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movements](
	[MovementsID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[Ammount] [int] NULL,
 CONSTRAINT [PK_Movements] PRIMARY KEY CLUSTERED 
(
	[MovementsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnSaleProducts]    Script Date: 30/09/2017 5:26:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnSaleProducts](
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_OnSaleProducts] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCommentary]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCommentary](
	[ProductCommentaryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Rate] [float] NULL,
	[Comment] [varchar](200) NULL,
 CONSTRAINT [PK_ProductCommentary] PRIMARY KEY CLUSTERED 
(
	[ProductCommentaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [int] NULL,
	[UserID] [int] NOT NULL,
	[ShippingID] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[Existencies] [int] NULL,
	[Rate] [float] NULL,
	[isAuction] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsSold]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsSold](
	[SalesID] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
	[SellerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[BuyDate] [date] NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[ShippingID] [int] NOT NULL,
 CONSTRAINT [PK_ProductsSold] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileCommentary]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileCommentary](
	[ProfileCommentaryID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RatedUserID] [int] NOT NULL,
	[Rate] [float] NULL,
	[Commentary] [varchar](200) NULL,
 CONSTRAINT [PK_ProfileCommentary] PRIMARY KEY CLUSTERED 
(
	[ProfileCommentaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingOptions]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingOptions](
	[ShippingID] [int] NOT NULL,
	[ArrivalTime] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[ShippingTitle] [varchar](50) NULL,
 CONSTRAINT [PK_ShippingOptions] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/09/2017 5:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Information] [varchar](50) NULL,
	[Telephone] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Rate] [float] NULL,
	[AccMoney] [int] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Auction]  WITH CHECK ADD  CONSTRAINT [FK_Auction_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Auction] CHECK CONSTRAINT [FK_Auction_Products]
GO
ALTER TABLE [dbo].[BidList]  WITH CHECK ADD  CONSTRAINT [FK_BidList_Auction] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auction] ([AuctionID])
GO
ALTER TABLE [dbo].[BidList] CHECK CONSTRAINT [FK_BidList_Auction]
GO
ALTER TABLE [dbo].[BidList]  WITH CHECK ADD  CONSTRAINT [FK_BidList_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BidList] CHECK CONSTRAINT [FK_BidList_Users]
GO
ALTER TABLE [dbo].[ImageCatalog]  WITH CHECK ADD  CONSTRAINT [FK_ImageCatalog_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ImageCatalog] CHECK CONSTRAINT [FK_ImageCatalog_Products]
GO
ALTER TABLE [dbo].[Movements]  WITH CHECK ADD  CONSTRAINT [FK_Movements_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Movements] CHECK CONSTRAINT [FK_Movements_Users]
GO
ALTER TABLE [dbo].[OnSaleProducts]  WITH CHECK ADD  CONSTRAINT [FK_OnSaleProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OnSaleProducts] CHECK CONSTRAINT [FK_OnSaleProducts_Products]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Products]
GO
ALTER TABLE [dbo].[ProductCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProductCommentary_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCommentary] CHECK CONSTRAINT [FK_ProductCommentary_Products]
GO
ALTER TABLE [dbo].[ProductCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProductCommentary_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductCommentary] CHECK CONSTRAINT [FK_ProductCommentary_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ShippingOptions] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingOptions] ([ShippingID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ShippingOptions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Users]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Products]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_ShippingOptions] FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingOptions] ([ShippingID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_ShippingOptions]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Users] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Users]
GO
ALTER TABLE [dbo].[ProductsSold]  WITH CHECK ADD  CONSTRAINT [FK_ProductsSold_Users1] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProductsSold] CHECK CONSTRAINT [FK_ProductsSold_Users1]
GO
ALTER TABLE [dbo].[ProfileCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProfileCommentary_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProfileCommentary] CHECK CONSTRAINT [FK_ProfileCommentary_Users]
GO
ALTER TABLE [dbo].[ProfileCommentary]  WITH CHECK ADD  CONSTRAINT [FK_ProfileCommentary_Users1] FOREIGN KEY([RatedUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ProfileCommentary] CHECK CONSTRAINT [FK_ProfileCommentary_Users1]
GO
USE [master]
GO
ALTER DATABASE [ShopBay] SET  READ_WRITE 
GO
