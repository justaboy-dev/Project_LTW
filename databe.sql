USE [master]
GO
/****** Object:  Database [CCS]    Script Date: 13/04/2021 6:35:01 CH ******/
CREATE DATABASE [CCS]
GO
ALTER DATABASE [CCS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CCS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CCS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CCS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CCS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CCS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CCS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CCS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CCS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CCS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CCS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CCS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CCS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CCS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CCS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CCS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CCS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CCS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CCS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CCS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CCS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CCS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CCS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CCS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CCS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CCS] SET  MULTI_USER 
GO
ALTER DATABASE [CCS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CCS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CCS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CCS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CCS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CCS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CCS] SET QUERY_STORE = OFF
GO
USE [CCS]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 13/04/2021 6:35:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13/04/2021 6:35:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[descriptions] [nchar](10) NOT NULL,
	[categoryId] [int] NOT NULL,
	[price] [bigint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Bánh kem')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Bánh ngọt')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (4, N'Capuccino23123', N'/app/img/coffee/capuccino.jpg', N'sadsad    ', 1, 900000000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (5, N'Bfcake', N'/app/img/coffee/bfcake.jpg', N'sadsad    ', 2, 80000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (6, N'Chessecake', N'/app/img/coffee/chessecake.jpeg', N'asdasd    ', 2, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (7, N'Macchiato', N'/app/img/coffee/macchiato.jpg', N'asdsadsa  ', 1, 120000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (8, N'Espresso', N'/app/img/coffee/espresso.jpg', N'asdsadsad ', 1, 240000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (9, N'Mocha', N'/app/img/coffee/mocha.jpg', N'alo 123   ', 1, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (10, N'Tiramisu', N'/app/img/coffee/tiramisu.jpg', N'asdsad    ', 2, 150000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (11, N'Mochi', N'/app/img/coffee/mochi.jpg', N'asdsadas  ', 3, 200000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
USE [master]
GO
ALTER DATABASE [CCS] SET  READ_WRITE 
GO
