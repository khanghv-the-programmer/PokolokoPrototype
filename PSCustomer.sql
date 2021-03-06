USE [master]
GO
/****** Object:  Database [PokolokoShop]    Script Date: 04/08/2021 10:26:14 AM ******/
CREATE DATABASE [PokolokoShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PokolokoShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.KHANG\MSSQL\DATA\PokolokoShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PokolokoShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.KHANG\MSSQL\DATA\PokolokoShop_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PokolokoShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PokolokoShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PokolokoShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PokolokoShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PokolokoShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PokolokoShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PokolokoShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PokolokoShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PokolokoShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PokolokoShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PokolokoShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PokolokoShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PokolokoShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PokolokoShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PokolokoShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PokolokoShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PokolokoShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PokolokoShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PokolokoShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PokolokoShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PokolokoShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PokolokoShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PokolokoShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PokolokoShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PokolokoShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PokolokoShop] SET  MULTI_USER 
GO
ALTER DATABASE [PokolokoShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PokolokoShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PokolokoShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PokolokoShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PokolokoShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PokolokoShop', N'ON'
GO
USE [PokolokoShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 04/08/2021 10:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](30) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04/08/2021 10:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[CateName] [varchar](20) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 04/08/2021 10:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[IDImage] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](1000) NOT NULL,
	[ParentKey] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK__Image__365310E857A7C820] PRIMARY KEY CLUSTERED 
(
	[IDImage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04/08/2021 10:26:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Material] [varchar](20) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[BrandID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[DeleteDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brand] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF__Image__Image__2A4B4B5E]  DEFAULT ('/img/pikachu_thumb.png') FOR [Image]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF__Image__CreatedDa__2B3F6F97]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ('Available') FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK__Image__ProductID__2C3393D0] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK__Image__ProductID__2C3393D0]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
USE [master]
GO
ALTER DATABASE [PokolokoShop] SET  READ_WRITE 
GO
