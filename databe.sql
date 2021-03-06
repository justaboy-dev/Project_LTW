USE [master]
GO
/****** Object:  Database [CCS]    Script Date: 6/2/2021 8:49:03 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 6/2/2021 8:49:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[idBill] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Total] [bigint] NULL,
	[Status] [bit] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[idBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 6/2/2021 8:49:03 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/2/2021 8:49:03 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/2/2021 8:49:03 PM ******/
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
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 6/2/2021 8:49:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[Email] [nvarchar](100) NOT NULL,
	[id] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[Email] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2021 8:49:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](400) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([idBill], [Email], [Total], [Status], [Date]) VALUES (1, N'nhattan@gmail.com', 1040000, 1, CAST(N'2021-04-24T22:19:27.260' AS DateTime))
INSERT [dbo].[Bill] ([idBill], [Email], [Total], [Status], [Date]) VALUES (2, N'nhattan@gmail.com', 403333, 1, CAST(N'2021-04-24T22:27:22.410' AS DateTime))
INSERT [dbo].[Bill] ([idBill], [Email], [Total], [Status], [Date]) VALUES (5, N'nhattan@gmail.com', 270000, 1, CAST(N'2021-04-26T22:26:14.323' AS DateTime))
INSERT [dbo].[Bill] ([idBill], [Email], [Total], [Status], [Date]) VALUES (6, N'test_pass@gmail.com', 440000, 0, CAST(N'2021-04-27T18:23:43.510' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (1, 5, 2)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (1, 6, 2)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (1, 7, 3)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (1, 8, 1)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (1, 9, 2)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (2, 5, 2)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (2, 9, 3)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (2, 15, 3)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (5, 5, 1)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (5, 6, 1)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (5, 7, 1)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (6, 5, 4)
INSERT [dbo].[BillDetails] ([idBill], [id], [amount]) VALUES (6, 7, 1)
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Coffee')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Bánh kem')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Bánh ngọt')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (5, N'Bfcake', N'/app/img/coffee/bfcake.jpg', N'Bánh ngọt (cake) định nghĩa theo wikipedia là dòng bánh gato có nguồn gốc từ tiếng Pháp "gâteux"

"Bánh ngọt hay bánh ga-tô (phương ngữ miền Bắc, bắt nguồn từ gâteux trong tiếng Pháp) là một loại thức ăn thường dưới hình thức món bánh dạng bánh mì từ bột nhào, được nướng lên dùng để tráng miệng. Bánh ngọt có nhiều loại, có thể phân loại dựa theo nguyên liệu và kỹ thuật chế biến như bánh ngọt làm từ lúa mì, bơ, bánh ngọt dạng bọt biển. Bánh ngọt có thể phục vụ những mục đính đặc biệt như bánh cưới, bánh sinh nhật, bánh Giáng sinh, bánh Halloween...". Keyword: Bánh kem, cake', 2, 80000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (6, N'Chessecake', N'/app/img/coffee/chessecake.jpeg', N'Cheesecake là một loại bánh có sự kết hợp hài hoà của phô mai tươi, kem, sữa và trứng. Chiếc bánh cheesecake chính là món tráng miệng được yêu thích bởi sự béo ngậy, thơm lừng và ngọt ngào của chúng. Keyword: Bánh kem, cake', 2, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (7, N'Macchiato', N'/app/img/coffee/macchiato.jpg', N'Trong tiếng Ý, Macchiato hay caffe macchiato có nghĩa là “đánh dấu” hoặc “vệt lốm đốm” chỉ hình ảnh một tấm vải trắng điểm xuyến những chấm nhỏ li ti bên trên tương tự như ly macchiato có lớp bọt sữa trắng trên bề mặt và được rắc thêm các đốm nâu bột cà phê lên để trang trí. Cùng với Cappuccino và Latte, Macchiato cũng là loại thức uống được tạo thành từ 2 thành phần nguyên liệu chính là cà phê espresso và sữa. Keyword: cafe, coffee, cà phê, café', 1, 120000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (8, N'Espresso', N'/app/img/coffee/espresso.jpg', N'Espresso là café được pha bằng máy, sử dụng nước nóng nén bởi áp suất cao qua lớp bột cà phê được xay mịn. Nước dùng để pha chế Espresso là nước tinh khiết, còn café dùng để pha chế theo phương pháp này cũng phải là café rang mộc, không tẩm ướp bất kỳ tạp chất nào. Keyword: cafe, coffee, cà phê, café', 1, 240000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (9, N'Mocha', N'/app/img/coffee/mocha.jpg', N'Với các tín đồ ăn vặt nói chung và các bạn yêu thích bánh ngọt nói riêng thì bánh cuộn kem mocha chính là loại bánh được lựa chọn nhiều nhất. Từ lớp vỏ bánh mềm mịn như tan chảy trong miệng cộng với lớp kem béo ngậy và mùi thơm cà phê khiến tinh thần của bạn như được thư giãn. Keyword: cafe, coffee, cà phê, café', 1, 70000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (10, N'Tiramisu', N'/app/img/coffee/tiramisu.jpg', N'Là loại bánh cực kỳ nổi tiếng của người Ý, Tiramisu hội tụ đầy đủ những tinh hoa ẩm thực sẵn có trong hương vị thơm ngon và cách trình bày trang trọng của đất nước xinh đẹp này. Món bánh này dễ dàng chinh phục người thưởng thức ngay từ lần đầu tiên bởi vị ngon ấn tượng, độ mềm mịn, mát lạnh của từng miếng bánh tan ngay đầu lưỡi.  Keyword: Bánh kem, cake', 2, 150000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (11, N'Mochi', N'/app/img/coffee/mochi.jpg', N'Mochi là một loại bánh giầy nhân ngọt truyền thống của Nhật Bản làm từ bột gạo nếp hay gạo nếp giã nhuyễn không những được dùng để ăn trong cuộc sống hàng ngày mà còn là vật phẩm dâng lên thần linh và có ý nghĩa mang lại may mắn. Bánh Mochi là vật cúng không thể thiếu trong các gia đình Nhật Bản nhân dịp năm mới. Họ bày trí Mochi ở hốc tường Toko-noma trang trọng trong phòng khách hoặc trong nhà. Keyword: Bánh ngọt', 3, 200000)
INSERT [dbo].[Product] ([id], [name], [image], [descriptions], [categoryId], [price]) VALUES (15, N'Cà phê sữa hành', N'/app/img/coffee/cafe-sua-nong_min.jpg', N'Keyword: cafe, coffee, cà phê, café', 1, 11111)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ShoppingCart] ([Email], [id], [Amount]) VALUES (N'nhattan@gmail.com', 5, 1)
INSERT [dbo].[ShoppingCart] ([Email], [id], [Amount]) VALUES (N'nhattan@gmail.com', 6, 4)
INSERT [dbo].[ShoppingCart] ([Email], [id], [Amount]) VALUES (N'nhattan1@gmail.com', 5, 1)
INSERT [dbo].[ShoppingCart] ([Email], [id], [Amount]) VALUES (N'nhattan1@gmail.com', 6, 1)
GO
INSERT [dbo].[User] ([Email], [Password], [Name], [Phone], [Address]) VALUES (N'nhattan@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', N'Adminstrator', N'0909009009 ', N'Hồ chí Minh')
INSERT [dbo].[User] ([Email], [Password], [Name], [Phone], [Address]) VALUES (N'nhattan1@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', N'user_test', N'0909009009', N'hcm')
INSERT [dbo].[User] ([Email], [Password], [Name], [Phone], [Address]) VALUES (N'test_pass@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', N'test_past', N'0909090909', N'Hồ Chí Minh')
GO
USE [master]
GO
ALTER DATABASE [CCS] SET  READ_WRITE 
GO
