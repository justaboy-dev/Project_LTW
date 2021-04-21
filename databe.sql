USE [master]
GO
/****** Object:  Database [CCS]    Script Date: 4/21/2021 12:42:01 PM ******/
CREATE DATABASE [CCS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CCS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CCS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CCS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CCS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
USE [CCS]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/21/2021 12:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[idBill] [int] NOT NULL,
	[Email] [nchar](100) NULL,
	[Total] [nchar](10) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[idBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 4/21/2021 12:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[idBill] [int] NOT NULL,
	[id] [int] NOT NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[idBill] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/21/2021 12:42:02 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/21/2021 12:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[descriptions] [nvarchar](max) NOT NULL,
	[categoryId] [int] NOT NULL,
	[price] [bigint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 4/21/2021 12:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Email] [nchar](100) NOT NULL,
	[id] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/21/2021 12:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nchar](100) NOT NULL,
	[Password] [nchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nchar](11) NULL,
	[Address] [nvarchar](400) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Bánh kem')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Bánh ngọt')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (5, N'Bfcake', N'/app/img/coffee/bfcake.jpg', N'Bánh ngọt (cake) định nghĩa theo wikipedia là dòng bánh gato có nguồn gốc từ tiếng Pháp "gâteux"

"Bánh ngọt hay bánh ga-tô (phương ngữ miền Bắc, bắt nguồn từ gâteux trong tiếng Pháp) là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween..."', 2, 80000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (6, N'Chessecake', N'/app/img/coffee/chessecake.jpeg', N'Cheesecake là một loại bánh có sự kết hợp hài hoà của phô mai tươi, kem, sữa và trứng. Chiếc bánh cheesecake chính là món tráng miệng được yêu thích bởi sự béo ngậy, thơm lừng và ngọt ngào của chúng.', 2, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (7, N'Macchiato', N'/app/img/coffee/macchiato.jpg', N'Trong tiếng Ý, Macchiato hay caffe macchiato có nghĩa là “đánh dấu” hoặc “vệt lốm đốm” chỉ hình ảnh một tấm vải trắng điểm xuyến những chấm nhỏ li ti bên trên tương tự như ly macchiato có lớp bọt sữa trắng trên bề mặt và được rắc thêm các đốm nâu bột cà phê lên để trang trí. Cùng với Cappuccino và Latte, Macchiato cũng là loại thức uống được tạo thành từ 2 thành phần nguyên liệu chính là cà phê espresso và sữa.', 1, 120000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (8, N'Espresso', N'/app/img/coffee/espresso.jpg', N'Espresso là café được pha bằng máy, sử dụng nước nóng nén bởi áp suất cao qua lớp bột cà phê được xay mịn. Nước dùng để pha chế Espresso là nước tinh khiết, còn café dùng để pha chế theo phương pháp này cũng phải là café rang mộc, không tẩm ướp bất kỳ tạp chất nào.', 1, 240000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (9, N'Mocha', N'/app/img/coffee/mocha.jpg', N'Với các tín đồ ăn vặt nói chung và các bạn yêu thích bánh ngọt nói riêng thì bánh cuộn kem mocha chính là loại bánh được lựa chọn nhiều nhất. Từ lớp vỏ bánh mềm mịn như tan chảy trong miệng cộng với lớp kem béo ngậy và mùi thơm cà phê khiến tinh thần của bạn như được thư giãn. ', 1, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (10, N'Tiramisu', N'/app/img/coffee/tiramisu.jpg', N'Là loại bánh cực kỳ nổi tiếng của người Ý, Tiramisu hội tụ đầy đủ những tinh hoa ẩm thực sẵn có trong hương vị thơm ngon và cách trình bày trang trọng của đất nước xinh đẹp này. Món bánh này dễ dàng chinh phục người thưởng thức ngay từ lần đầu tiên bởi vị ngon ấn tượng, độ mềm mịn, mát lạnh của từng miếng bánh tan ngay đầu lưỡi. ', 2, 150000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (11, N'Mochi', N'/app/img/coffee/mochi.jpg', N'Mochi là một loại bánh giầy nhân ngọt truyền thống của Nhật Bản làm từ bột gạo nếp hay gạo nếp giã nhuyễn không những được dùng để ăn trong cuộc sống hàng ngày mà còn là vật phẩm dâng lên thần linh và có ý nghĩa mang lại may mắn. Bánh Mochi là vật cúng không thể thiếu trong các gia đình Nhật Bản nhân dịp năm mới. Họ bày trí Mochi ở hốc tường Toko-noma trang trọng trong phòng khách hoặc trong nhà', 3, 200000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [Phone], [Address]) VALUES (N'nhattan@gmail.com                                                                                   ', N'123456                                            ', N'Tân Đẹp Trai', N'0909009009 ', N'Hồ chí Minh')
GO
USE [master]
GO
ALTER DATABASE [CCS] SET  READ_WRITE 
GO
