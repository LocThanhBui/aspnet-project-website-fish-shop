USE [master]
GO
/****** Object:  Database [WebsiteShopCaCanh]    Script Date: 11/6/2021 2:27:43 PM ******/
CREATE DATABASE [WebsiteShopCaCanh] ON  PRIMARY 
( NAME = N'WebsiteShopCaCanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\WebsiteShopCaCanh.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteShopCaCanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\WebsiteShopCaCanh_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteShopCaCanh] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteShopCaCanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteShopCaCanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteShopCaCanh] SET DB_CHAINING OFF 
GO
USE [WebsiteShopCaCanh]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/6/2021 2:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2021 2:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2021 2:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2021 2:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avartar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [ntext] NULL,
	[FullDescription] [ntext] NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/6/2021 2:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (1, N'Cá Cảnh & Thức ăn', N'logocakoi.jpg', N'logo-ca-koi', 1, 1, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (2, N'Phụ kiện thủy sinh', N'den_week.png', N'logo-weekqua', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (3, N'Tropical Pro', N'pro.jpg', N'logo-tropical-pro', 1, 3, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (1, N'Cá Cảnh & Thức ăn ', N'carong.png                                                                                          ', N'ca-canh', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'Đèn Thủy Sinh', N'den_week.png                                                                                        ', N'den-thuy-sinh', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'Bể Kính Thủy Sinh', N'bekinh.png                                                                                          ', N'be-kinh', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N'Vi sinh', N'visinh_multibio.png                                                                                 ', N'vi-sinh', 1, 4, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avartar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Lọc Vi Sinh', N'locvisinh_sunsun.png                                                                                ', N'loc-vi-sinh', 1, 5, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (1, N'Cá rồng', N'carong.png                                                                                          ', 1, N'Cá rồng quá bối (SCLEROPAGES MACROCEPHALUS).', N'Cá rồng quá bối (SCLEROPAGES MACROCEPHALUS) còn có tên gọi khác là kim long quá bối và nhu cầu chơi loại cá này ngày càng cao. Tuy nhiên khả năng trưởng thành và sinh sản khá thấp nên chúng nằm trong danh sách những loại cá rồng đẹp và đắt nhất.Là loài có tính cách hung dữ nhất trong các loại cá rồng Châu Á. Nếu nuôi theo đàn, thường xảy ra tình trạng tấn công lẫn nhau, ngay cả những con cùng chủng loại. So về vóc dáng, kích thước với những loài cá rồng khác thì Kim Long Quá Bối không được đánh giá cao.
Như vậy, sự thật cá rồng quá bối là gì đã được chúng tôi chia sẻ cơ bản trong bài viết trên đây. Nếu bạn đang quan tâm và dự định thiết kế một bể cá rồng trong ngôi nhà của mình, hi vọng rằng những thông tin chúng tôi cung cấp có thể thực sự trở nên hữu ích dành cho bạn. Chúc bạn thành công với thú vui riêng của mình!
Hy vọng qua một vài chia sẻ bên trên đã giúp bạn hiểu rõ và giải đáp được những thắc mắc về cá rồng quá bối. Chúc bạn mua được những chú cá rồng tuyệt đẹp và chăm sóc kỹ lưỡng để cho màu sắc bắt mắt nhất.Mang vẻ đẹp lộng lẫy, rõ ràng ngay từ khi còn nhỏ đến lúc trưởng thành
Dễ nuôi, dễ chăm sóc, không yêu cầu quá khắt khe như những loài cá rồng khác
Được xem là một trong những loài cá phong thủy, có ý nghĩa mang đến sự may mắn, thịnh vượng và tài lộc cho gia chủ
Rất ít khi xảy ra hiện tượng trề môi ở cá rồng quá bối (một hiện tượng phổ biến ở loài cá rồng nói chung) nên đảm bảo được vẻ đẹp theo năm tháng', 500000, 450000, 1, N'carong', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'Cá Pleco', N'capleco.png                                                                                         ', 1, N'Cá Pleco (cá lau kính) là một loài cá trong họ cá da xùLoricariidae thuộc bộ cá da trơn. ', N'Ở nước ta số lượng người ít chơi cá pleco còn ít do yếu tố địa lý và giá trị của dòng cá này, nhưng dòng cá này lại khá phổ biến với người chơi thủy sinh trên thế giới. Loài cá này có tuổi thọ trung bình cao lên tới 10- 15 năm, ở tự nhiên tuổi thọ chúng còn cao hơn nhiều. Vì ở Việt Nam ít người nuôi loại cá này nên Cách nuôi cá pleco là thắc mắc của rất nhiều người.', 200000, 150000, 1, N'capleco', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'Cá PingPong', N'capingpong.png                                                                                      ', 1, N' Đây là dòng cá cảnh có nguồn gốc từ Trung Quốc.', N'Cá Ping Pong là dòng cá vàng hay còn có tên gọi khác là cá vàng ngọc trai, cá vảy trân châu Chinsurin. Đây là dòng cá cảnh có nguồn gốc từ Trung Quốc, có lẽ chúng được các nhà lai tạo tài tình của TQ tạo ra. Đây là dòng cá cảnh được rất nhiều người chơi bể cá cảnh hay những bể cá nhỏ đề bản, vì dáng người đáng yêu của chúng, nên chúng có tính giải trí rất cao.Vào mùa đông, bạn hãy chí ý hơn khi thay nước cho bể cá Ping Pong, hãy thay từ 20 đến 30% và một tuần chỉ thay 1 lần để đảm bảo việc thay đổi này không ảnh hưởng nhiều đến cá, và hãy cắm sưởi để đảm bảo nhiệt độ luôn được cân bằng nhất.

Cá Ping Pong có thể nuôi trong hồ thủy sinh được nhưng với số lượng ít để đảm bảo hồ thủy sinh không bị phá bố cục. Vì cá Ping Pong là dòng cá vàng nên chúng ăn rất nhiều và thải phân cũng rất nhiều, cùng với đó chúng cũng hay đi ăn ngọn cây thủy sinh, vậy nên bạn có thể nuôi cá Ping Pong số lượng ít thôi để đảm bảo bể thủy sinh luôn sạch và đẹp nhất.', 200000, 150000, 1, N'capingpong', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N'Thức ăn cá Tropical Pro', N'thucan_tropical.png                                                                                 ', 1, N'Thức ăn cá Tropical Pro Defence size S là một trong những dòng thức ăn cực kỳ cần thiết cho cá cảnh,', N'Nếu bạn là người chơi cá chuyên nghiệp, và muốn những chú cá của chúng ta khỏe mạnh, phát triển cực tốt cũng như có một hệ tiêu hóa khỏe để phát triển và tăng sức đề kháng, sản phẩm Tropical Pro Defence size S chắc chắn là sản phẩm mà bạn không nên bỏ qua và phải có ngay trong kệ tủ thức ăn cho cá cảnh của bạn.Tropical Pro Defense size S là thức ăn dạng hạt chìm từ từ (cỡ hạt: 0.5-1.0 mm) với chế phẩm sinh học để cho cá non và cá trưởng thành có thể sử dụng và ăn hàng ngày. Pprobiotic được bổ sung vào thức ăn có chứa nội bào tử Bacillus subtilis còn hoạt động, giúp ổn định hệ vi sinh đường ruột, tăng cường sức đề kháng của cá đối với mầm bệnh và tạo điều kiện sử dụng các chất dinh dưỡng, do đó làm tăng tốc độ phát triển của cá và giảm ô nhiễm nước với phân của cá.Tác dụng hiệp đồng của probiotic, beta-glucan, vitamin và carotenoid giúp cải thiện đáng kể tình trạng sức khỏe tổng thể của cá và hệ thống miễn dịch của chúng, do đó thức ăn cũng được khuyên dùng trong thời gian mắc bệnh, phục hồi hoặc thích nghi. Probiotic ảnh hưởng tích cực đến quá trình sinh sản, tăng khả năng sinh sản của cá và tỷ lệ sống của cá con và giảm bớt căng thẳng do vận chuyển, sinh sản, đánh nhau trong đàn cá, sự cạnh tranh,… Hàm lượng protein cao, bao gồm các axit amin thiết yếu cho cá cảnh.', 300000, 200000, 2, N'thucantrapical-pro', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Thức ăn cá cảnh Tropical SuperVit', N'thucan_tropicalsuper.png                                                                            ', 1, N'Thức ăn cá Tropical Pro Defence size S là một trong những dòng thức ăn cực kỳ cần thiết cho cá cảnh,', N'Nếu bạn là người chơi cá chuyên nghiệp, và muốn những chú cá của chúng ta khỏe mạnh, phát triển cực tốt cũng như có một hệ tiêu hóa khỏe để phát triển và tăng sức đề kháng, sản phẩm Tropical Pro Defence size S chắc chắn là sản phẩm mà bạn không nên bỏ qua và phải có ngay trong kệ tủ thức ăn cho cá cảnh của bạn.Tropical Pro Defense size S là thức ăn dạng hạt chìm từ từ (cỡ hạt: 0.5-1.0 mm) với chế phẩm sinh học để cho cá non và cá trưởng thành có thể sử dụng và ăn hàng ngày. Pprobiotic được bổ sung vào thức ăn có chứa nội bào tử Bacillus subtilis còn hoạt động, giúp ổn định hệ vi sinh đường ruột, tăng cường sức đề kháng của cá đối với mầm bệnh và tạo điều kiện sử dụng các chất dinh dưỡng, do đó làm tăng tốc độ phát triển của cá và giảm ô nhiễm nước với phân của cá.Tác dụng hiệp đồng của probiotic, beta-glucan, vitamin và carotenoid giúp cải thiện đáng kể tình trạng sức khỏe tổng thể của cá và hệ thống miễn dịch của chúng, do đó thức ăn cũng được khuyên dùng trong thời gian mắc bệnh, phục hồi hoặc thích nghi. Probiotic ảnh hưởng tích cực đến quá trình sinh sản, tăng khả năng sinh sản của cá và tỷ lệ sống của cá con và giảm bớt căng thẳng do vận chuyển, sinh sản, đánh nhau trong đàn cá, sự cạnh tranh,… Hàm lượng protein cao, bao gồm các axit amin thiết yếu cho cá cảnh.', 200000, 150000, 2, N'thucantrapical-supervit', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (6, N'Thức ăn JBL', N'thucan_jbl.png                                                                                      ', 1, N'Thức ăn cá viên dán JBL Novo Tab 160g 250ml xuất xứ Đức, dòng sản phẩm thức ăn chuyên dụng cho cá cảnh thủy sinh. ', N'Dòng sản phẩm thức ăn JBL Novo Tab có 2 dạng hộp chính là: 60g/150ml và 150g/250ml

Sử dụng protein nguyên chất, không sử dụng bột cá giá rẻ.
Tỷ lệ protein/chất béo tối ưu.
Chủ yếu là protein từ động vật sống trong nước.
Giảm sự phát triển của tảo và tăng trưởng cá tối ưu nhờ hàm lượng phosphate thích hợp.
Xuất xứ: Đức Dòng thức ăn JBL Novo Tab 160g/250ml phù hợp với mọi dòng cá, mang đến dòng thứ ăn lượng tốt để cá phát triển, cùng với đó là nâng cao sức đề kháng của các dòng cá cảnh.Thức ăn viên dán JBL được thiết kế dành cho tất cả các dòng cá cảnh có thể ăn.
Thức ăn JBL không bị mủn và vụn trong nước.
Cung cấp nhiều chất dinh dưỡng và vi ta min.
Không làm bẩn nước.
Dính chắc khi dán vào bể kính.
Dạng viên nén chắc chắn.', 400000, 350000, 2, N'thucan-jbl', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (7, N'Đèn Netlea Nano ', N'den_netlea.png                                                                                      ', 2, N'Đèn Netlea Nano chuyên dùng cho bể thủy sinh mini và nano để bàn cực kỳ đẹp mắt và ấn tượng. Bảo hành 1 năm chính hãng.', N'Dòng đèn Netlea Nano (Desktop Landscape Lamp) là dòng sản phẩm mới đến từ hãng Netlea, dòng sản phẩm chuyên dùng cho bể Mini và Nano để bàn.

Với thiết kế gọn gàng và cực kỳ tối ưu, đèn Netlea Nano sẽ là một sản phẩm mới mang đến những trải nghiệm mới với chất lượng cực tốt.', 2000000, 1500000, 2, N'den-netlea-nano', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (8, N'Đèn WEEK P900', N'den_week.png                                                                                        ', 2, N'Đèn thủy sinh Week P900 Pro là một trong những dòng sản phẩm mới nhất hiện tại của Week đánh vào phân khúc trung cấp.', N'Với thiết kế và công nghệ mới, Week P Pro Series chắc chắn là dòng sản phẩm rất đáng chú ý trong nửa cuối năm nay.Đèn Week P900 Pro là một dòng sản phẩm mới của hãng, thừa hưởng công nghệ mới và những cải tiến kỹ thuật. Thủy Sinh 4U chắc chắn đây sẽ là một dòng đèn rất tốt với:

Sử dụng APP để điều chỉnh đèn.
Thiết kế đẹp mắt với chất liệu nhôm nguyên khối
Led RGB 3 in 1 giúp cây lên màu và phát triển tốt hơn.
Bóng đèn UV giúp cây phát triển và lên màu tốt hơn, có thể chỉnh bằng APP
Thiết kế tích hợp 2 dạng chân là chân gác chữ Z và có thể treo bằng cáp.
Hệ thống tản nhiệt hiệu quả cao nhờ dùng quạt và vỏ nhôm dày, giúp đèn có thể giảm tới 15 độ.Sau nhiều vòng thử nghiệm và đánh giá so sánh, chúng tôi đã chọn quang phổ RGB-UV làm dòng chính để nâng cấp loạt đèn. Trong quá trình thử nghiệm và nghiên cứu nên chúng tôi nhận thấy phổ RGB (3 trong 1) và WRGB (4 trong 1) khi nuôi trồng thủy sinh tạo hiệu ứng màu chậm hơn. Ngoài ra còn có RGB + W do được trang bị các hạt ánh sáng trắng nên nó có ưu điểm về độ sáng, tuy nhiên chúng đều có vấn đề nước màu vàng ở mức độ khác nhau, dẫn đến hiện tượng màu sắc không rõ ràng và hiệu ứng phong cảnh kém.', 1500000, 1400000, 2, N'den-week-p900', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (9, N'Đèn WEEK P900 Pro', N'den_week.png                                                                                        ', 2, N'Đèn thủy sinh Week P900 Pro là một trong những dòng sản phẩm mới nhất hiện tại của Week đánh vào phân khúc trung cấp.', N'Với thiết kế và công nghệ mới, Week P Pro Series chắc chắn là dòng sản phẩm rất đáng chú ý trong nửa cuối năm nay.Đèn Week P900 Pro là một dòng sản phẩm mới của hãng, thừa hưởng công nghệ mới và những cải tiến kỹ thuật. Thủy Sinh 4U chắc chắn đây sẽ là một dòng đèn rất tốt với:

Sử dụng APP để điều chỉnh đèn.
Thiết kế đẹp mắt với chất liệu nhôm nguyên khối
Led RGB 3 in 1 giúp cây lên màu và phát triển tốt hơn.
Bóng đèn UV giúp cây phát triển và lên màu tốt hơn, có thể chỉnh bằng APP
Thiết kế tích hợp 2 dạng chân là chân gác chữ Z và có thể treo bằng cáp.
Hệ thống tản nhiệt hiệu quả cao nhờ dùng quạt và vỏ nhôm dày, giúp đèn có thể giảm tới 15 độ.Sau nhiều vòng thử nghiệm và đánh giá so sánh, chúng tôi đã chọn quang phổ RGB-UV làm dòng chính để nâng cấp loạt đèn. Trong quá trình thử nghiệm và nghiên cứu nên chúng tôi nhận thấy phổ RGB (3 trong 1) và WRGB (4 trong 1) khi nuôi trồng thủy sinh tạo hiệu ứng màu chậm hơn. Ngoài ra còn có RGB + W do được trang bị các hạt ánh sáng trắng nên nó có ưu điểm về độ sáng, tuy nhiên chúng đều có vấn đề nước màu vàng ở mức độ khác nhau, dẫn đến hiện tượng màu sắc không rõ ràng và hiệu ứng phong cảnh kém.', 2000000, 1900000, 2, N'den-week-p900-pro', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (10, N'Đèn WEEK P900 Pro Max', N'den_week.png                                                                                        ', 2, N'Đèn thủy sinh Week P900 Pro là một trong những dòng sản phẩm mới nhất hiện tại của Week đánh vào phân khúc trung cấp.', N'Với thiết kế và công nghệ mới, Week P Pro Series chắc chắn là dòng sản phẩm rất đáng chú ý trong nửa cuối năm nay.Đèn Week P900 Pro là một dòng sản phẩm mới của hãng, thừa hưởng công nghệ mới và những cải tiến kỹ thuật. Thủy Sinh 4U chắc chắn đây sẽ là một dòng đèn rất tốt với:

Sử dụng APP để điều chỉnh đèn.
Thiết kế đẹp mắt với chất liệu nhôm nguyên khối
Led RGB 3 in 1 giúp cây lên màu và phát triển tốt hơn.
Bóng đèn UV giúp cây phát triển và lên màu tốt hơn, có thể chỉnh bằng APP
Thiết kế tích hợp 2 dạng chân là chân gác chữ Z và có thể treo bằng cáp.
Hệ thống tản nhiệt hiệu quả cao nhờ dùng quạt và vỏ nhôm dày, giúp đèn có thể giảm tới 15 độ.Sau nhiều vòng thử nghiệm và đánh giá so sánh, chúng tôi đã chọn quang phổ RGB-UV làm dòng chính để nâng cấp loạt đèn. Trong quá trình thử nghiệm và nghiên cứu nên chúng tôi nhận thấy phổ RGB (3 trong 1) và WRGB (4 trong 1) khi nuôi trồng thủy sinh tạo hiệu ứng màu chậm hơn. Ngoài ra còn có RGB + W do được trang bị các hạt ánh sáng trắng nên nó có ưu điểm về độ sáng, tuy nhiên chúng đều có vấn đề nước màu vàng ở mức độ khác nhau, dẫn đến hiện tượng màu sắc không rõ ràng và hiệu ứng phong cảnh kém.', 3000000, 2500000, 2, N'den-week-p900-pro-max', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (11, N'Đèn WEEK P900 RGB', N'den_week.png                                                                                        ', 2, N'Đèn thủy sinh Week P900 Pro là một trong những dòng sản phẩm mới nhất hiện tại của Week đánh vào phân khúc trung cấp.', N'Với thiết kế và công nghệ mới, Week P Pro Series chắc chắn là dòng sản phẩm rất đáng chú ý trong nửa cuối năm nay.Đèn Week P900 Pro là một dòng sản phẩm mới của hãng, thừa hưởng công nghệ mới và những cải tiến kỹ thuật. Thủy Sinh 4U chắc chắn đây sẽ là một dòng đèn rất tốt với:

Sử dụng APP để điều chỉnh đèn.
Thiết kế đẹp mắt với chất liệu nhôm nguyên khối
Led RGB 3 in 1 giúp cây lên màu và phát triển tốt hơn.
Bóng đèn UV giúp cây phát triển và lên màu tốt hơn, có thể chỉnh bằng APP
Thiết kế tích hợp 2 dạng chân là chân gác chữ Z và có thể treo bằng cáp.
Hệ thống tản nhiệt hiệu quả cao nhờ dùng quạt và vỏ nhôm dày, giúp đèn có thể giảm tới 15 độ.Sau nhiều vòng thử nghiệm và đánh giá so sánh, chúng tôi đã chọn quang phổ RGB-UV làm dòng chính để nâng cấp loạt đèn. Trong quá trình thử nghiệm và nghiên cứu nên chúng tôi nhận thấy phổ RGB (3 trong 1) và WRGB (4 trong 1) khi nuôi trồng thủy sinh tạo hiệu ứng màu chậm hơn. Ngoài ra còn có RGB + W do được trang bị các hạt ánh sáng trắng nên nó có ưu điểm về độ sáng, tuy nhiên chúng đều có vấn đề nước màu vàng ở mức độ khác nhau, dẫn đến hiện tượng màu sắc không rõ ràng và hiệu ứng phong cảnh kém.', 2000000, 1500000, 2, N'den-week-p900-rgb', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (12, N'Đèn WEEK P900 RGB Pro', N'den_week.png                                                                                        ', 2, N'Đèn thủy sinh Week P900 Pro là một trong những dòng sản phẩm mới nhất hiện tại của Week đánh vào phân khúc trung cấp.', N'Với thiết kế và công nghệ mới, Week P Pro Series chắc chắn là dòng sản phẩm rất đáng chú ý trong nửa cuối năm nay.Đèn Week P900 Pro là một dòng sản phẩm mới của hãng, thừa hưởng công nghệ mới và những cải tiến kỹ thuật. Thủy Sinh 4U chắc chắn đây sẽ là một dòng đèn rất tốt với:

Sử dụng APP để điều chỉnh đèn.
Thiết kế đẹp mắt với chất liệu nhôm nguyên khối
Led RGB 3 in 1 giúp cây lên màu và phát triển tốt hơn.
Bóng đèn UV giúp cây phát triển và lên màu tốt hơn, có thể chỉnh bằng APP
Thiết kế tích hợp 2 dạng chân là chân gác chữ Z và có thể treo bằng cáp.
Hệ thống tản nhiệt hiệu quả cao nhờ dùng quạt và vỏ nhôm dày, giúp đèn có thể giảm tới 15 độ.Sau nhiều vòng thử nghiệm và đánh giá so sánh, chúng tôi đã chọn quang phổ RGB-UV làm dòng chính để nâng cấp loạt đèn. Trong quá trình thử nghiệm và nghiên cứu nên chúng tôi nhận thấy phổ RGB (3 trong 1) và WRGB (4 trong 1) khi nuôi trồng thủy sinh tạo hiệu ứng màu chậm hơn. Ngoài ra còn có RGB + W do được trang bị các hạt ánh sáng trắng nên nó có ưu điểm về độ sáng, tuy nhiên chúng đều có vấn đề nước màu vàng ở mức độ khác nhau, dẫn đến hiện tượng màu sắc không rõ ràng và hiệu ứng phong cảnh kém.', 3000000, 2500000, 2, N'den-week-p900-rgb-pro', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (13, N'sanphamtest1', N'visinh_extrabio.png                                                                                 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-04 09:37:10.350' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (14, N'Cá sóc đầu đỏ', N'casocdaudo.png                                                                                      ', 1, N'Cá sóc đầu đỏ là một trong những loại cá cảnh rất được người chơi thủy sinh ưa chuộng.', N'Cá sóc đầu đỏ có tên khoa học là Rummynose Tetra, được đặt tên theo ngoại hình đặc biệt của cá bởi cái đầu đỏ đặc trưng của loài cá này. Toàn thân là một màu bạc như gương và một cái đuôi ấn tượng với hai sọc đen trắng đan xen với nhau những vạch này nhìn rất đơn giản nhưng khi kết hợp lại thành một chú cá sóc đầu đỏ dễ thương vô cùng.Cá sóc đầu đỏ là lài ăn tạp, chúng thường được thả vào thủy sinh hoặc các bể sinh thái có kích thước lớn. Ở điều kiện lý tưởng gần như môi trường giống với môi trường nước tự nhiên để có thể sinh trưởng và phát triển. Thả loại cá này theo đàn là một sựa chọn hợp lý bở bạn sẽ có thê chiêm ngưỡng một bức tranh ấn tượng trong ngôi nhà của mình.Hiện cá này có thể nhân giống trong môi trường nhốt như bể chứa hoặc trong các hồ nuôi cá ở cá trang trại, nước chua sẽ giúp cho việc sinh sản của cá này tốt hơn. Khi trứng nở cần loại bỏ cá bố và cá mẹ tránh trường hợp chúng ăn những con con của mình.', 200000, 150000, 2, N'ca-soc-dau-do', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (15, N'Cá trâm', N'catram.png                                                                                          ', 1, N'Cá trâm tên khoa học Boraras urophthalmoides thuộc chi Boraras, cá trâm có vẻ ngoài nhỏ nhắn và thói quen bơi thành đàn tạo cho bể cá thủy sinh của bạn thêm phần bắt mắt.', N'Cá trâm là một loài cá trong chi cá trâm Boraras thuộc họ cá chép bản địa vùng Đông Nam Á, chúng phân bố rộng từ Thái Lan, Campuchia cho đến Việt Nam, ở Việt Nam chúng có nhiều ở vùng Đồng Tháp Mười. Môi trường đầm lầy và bụi thủy sinh rậm rạp.Cá trâm có vạch sẫm màu ở cạnh vây lưng điểm xuyết bởi viền cam/vàng tươi. Vây lưng và vây hậu môn của cá Trâm có những mảng sẫm mầu ở cạnh trước. Mặc dù kích thước nhỏ bé nhưng nhìn kĩ bằng mắt thường cũng có thể nhìn thấy vây lưng và vây hậu môn ở cá đực cũng thể hiện màu đỏ nhạt hay cam.Cá Trâm có kích thước khoảng 16mm và là một dòng cá cảnh được nói là khá nhỏ. Chính vì vẻ ngoài nhỏ nhắn, sắc màu rực rỡ đỏ xinh, cá trâm tạo điểm nhấn nổi bật trong bể. Ngoài ra kích thước nhỏ nên người ta hay nuôi chung cá Trâm chung với tép.', 200000, 150000, 2, N'ca-tram', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (16, N'Vi sinh MultiBio', N'visinh_multibio.png                                                                                 ', 4, N'Dòng sản phẩm vi sinh MultiBio là dòng sản phẩm sinh học giúp xử lý nước, khử mùi hôi tanh và trong nước cực nhanh (theo nhiều anh em đánh giá là trong ngay chỉ sau 2h sử dụng.', N'Multibio là chế phẩm sinh học chứa hỗn hợp nhiều lợi khuẩn hiếu khí và kị khí, nồng độ sinh khối (vi sinh vật) cao, giúp xử lý các chất độc hại trong nước, từ đó mang lại một môi trường tuyệt vời cho bể thủy sinh của bạn.NH3/NH4 sẽ được vi khuẩn Nitrosomonas chuyển hóa thành NO2. Sau đó NO2 được vi khuẩn Nitrobacter oxy hóa thành NO3 (ở dạng này cây có thể hấp thụ). Tiếp theo quá trình khử Nitrate sẽ xảy ra, NO3 bị các vi khuẩn kỵ khí Pseudomas và Clostrium khử.Đáp: Là vị sinh làm trong nước, ổn định bể nhanh số 1 hiện nay. Xử lý được hiện tượng bụi bể cực kì hiệu quả. Là vi sinh duy nhất hiện nay khử được mùi hôi tanh của bể cá trong vòng 24h. Tăng cường sức đề kháng, giảm stress cho cá. Ngăn ngừa rêu hại, tạo nâu cực kì hiệu quả. Liều lượng dùng cho bếp.', 300000, 150000, 2, N'vi-sinh-MultiBio', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (17, N'Vi sinh Extrabio', N'visinh_extrabio.png                                                                                 ', 4, N'Vi sinh Extrabio là một trong những dòng vi sinh rất tốt được phát triển bởi một hãng tại Việt Nam.', N'Đây là một trong số những dòng vi sinh được rất nhiều người sử dụng cho hồ cá cảnh và thủy sinh vì độ hiệu quả và mức giá rất dễ chịu.Extrabio là chế phẩm sinh học (men vi sinh) được nghiên cứu và sản xuất dựa trên quá trình thí nghiệm cũng như kiểm định cực kỳ nghiêm ngặt, sản phẩm men vi sinh Extrabio có chứa những chủng vi sinh và enzim tốt nhất giúp thúc đẩy quá trình xử lý các chất trong nước cực nhanh.', 270000, 140000, 2, N'vi-sinh-Extrabio ', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (18, N'Bể siêu trong 30x18x20 kính 5', N'bekinh.png                                                                                          ', 3, N'Dòng sản phẩm bể kính siêu trong 30cm hàng nhập khẩu nguyên chiếc giá rẻ tại Thủy Sinh 4U. Dòng sản phẩm bể cá thủy sinh siêu trong mài vi tính dán giấu keo cực đẹp.', N'Dòng sản phẩm sử dụng kính siêu trong, mang đến độ xuyên thấu tốt, ít gây ảnh hưởng tới trải nghiệm người chơi thủy sinh.
Mức giá rẻ và phù hợp với nhiều người chơi thủy sinh.
Là kính 5 nên gọn gàng và thanh thoát hơn.
Bể dán theo dạng dấu keo và được mài vi tính xiết cạnh đảm bảo thẩm mỹ cho chiếc bể thủy sinh.
Kích thước chuẩn xác phù hợp với kích thước chuẩn của thế giới.
Có tấm cao xu mỏng lót đáy bể, giúp bể giảm thiểu tác động từ bề mặt.
Sản phẩm phù hợp với mọi dòng đèn thủy sinh có kích thước chuẩn.
Sản phẩm được Thủy Sinh 4U phân phối và đảm bảo chất lượng, được bảo hành đầy đủ. Hãy đến với Shop Ca Canh để mua những sản phẩm bể kính 60 cm siêu trong chất lượng cao.', 270000, 250000, 2, N'be-kinh', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (19, N'Bể siêu trong 35x21x23 kính 5mm', N'bekinh.png                                                                                          ', 3, N'Dòng sản phẩm bể kính siêu trong 30cm hàng nhập khẩu nguyên chiếc giá rẻ tại Thủy Sinh 4U. Dòng sản phẩm bể cá thủy sinh siêu trong mài vi tính dán giấu keo cực đẹp.', N'Dòng sản phẩm sử dụng kính siêu trong, mang đến độ xuyên thấu tốt, ít gây ảnh hưởng tới trải nghiệm người chơi thủy sinh.
Mức giá rẻ và phù hợp với nhiều người chơi thủy sinh.
Là kính 5 nên gọn gàng và thanh thoát hơn.
Bể dán theo dạng dấu keo và được mài vi tính xiết cạnh đảm bảo thẩm mỹ cho chiếc bể thủy sinh.
Kích thước chuẩn xác phù hợp với kích thước chuẩn của thế giới.
Có tấm cao xu mỏng lót đáy bể, giúp bể giảm thiểu tác động từ bề mặt.
Sản phẩm phù hợp với mọi dòng đèn thủy sinh có kích thước chuẩn.
Sản phẩm được Thủy Sinh 4U phân phối và đảm bảo chất lượng, được bảo hành đầy đủ. Hãy đến với Shop Ca Canh để mua những sản phẩm bể kính 60 cm siêu trong chất lượng cao.', 320000, 300000, 2, N'be-kinh', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (20, N'Bể siêu trong 40x24x25 kính 5mm', N'bekinh.png                                                                                          ', 3, N'Dòng sản phẩm bể kính siêu trong 30cm hàng nhập khẩu nguyên chiếc giá rẻ tại Thủy Sinh 4U. Dòng sản phẩm bể cá thủy sinh siêu trong mài vi tính dán giấu keo cực đẹp.', N'Dòng sản phẩm sử dụng kính siêu trong, mang đến độ xuyên thấu tốt, ít gây ảnh hưởng tới trải nghiệm người chơi thủy sinh.
Mức giá rẻ và phù hợp với nhiều người chơi thủy sinh.
Là kính 5 nên gọn gàng và thanh thoát hơn.
Bể dán theo dạng dấu keo và được mài vi tính xiết cạnh đảm bảo thẩm mỹ cho chiếc bể thủy sinh.
Kích thước chuẩn xác phù hợp với kích thước chuẩn của thế giới.
Có tấm cao xu mỏng lót đáy bể, giúp bể giảm thiểu tác động từ bề mặt.
Sản phẩm phù hợp với mọi dòng đèn thủy sinh có kích thước chuẩn.
Sản phẩm được Thủy Sinh 4U phân phối và đảm bảo chất lượng, được bảo hành đầy đủ. Hãy đến với Shop Ca Canh để mua những sản phẩm bể kính 60 cm siêu trong chất lượng cao.', 400000, 380000, 2, N'be-kinh', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (21, N'Bể siêu trong 50x27x30 kính 5mm', N'bekinh.png                                                                                          ', 3, N'Dòng sản phẩm bể kính siêu trong 30cm hàng nhập khẩu nguyên chiếc giá rẻ tại Thủy Sinh 4U. Dòng sản phẩm bể cá thủy sinh siêu trong mài vi tính dán giấu keo cực đẹp.', N'Dòng sản phẩm sử dụng kính siêu trong, mang đến độ xuyên thấu tốt, ít gây ảnh hưởng tới trải nghiệm người chơi thủy sinh.
Mức giá rẻ và phù hợp với nhiều người chơi thủy sinh.
Là kính 5 nên gọn gàng và thanh thoát hơn.
Bể dán theo dạng dấu keo và được mài vi tính xiết cạnh đảm bảo thẩm mỹ cho chiếc bể thủy sinh.
Kích thước chuẩn xác phù hợp với kích thước chuẩn của thế giới.
Có tấm cao xu mỏng lót đáy bể, giúp bể giảm thiểu tác động từ bề mặt.
Sản phẩm phù hợp với mọi dòng đèn thủy sinh có kích thước chuẩn.
Sản phẩm được Thủy Sinh 4U phân phối và đảm bảo chất lượng, được bảo hành đầy đủ. Hãy đến với Shop Ca Canh để mua những sản phẩm bể kính 60 cm siêu trong chất lượng cao.', 500000, 450000, 2, N'be-kinh', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (22, N'Bể siêu trong 60x30x35 kính 5mm', N'bekinh.png                                                                                          ', 3, N'Dòng sản phẩm bể kính siêu trong 30cm hàng nhập khẩu nguyên chiếc giá rẻ tại Thủy Sinh 4U. Dòng sản phẩm bể cá thủy sinh siêu trong mài vi tính dán giấu keo cực đẹp.', N'Dòng sản phẩm sử dụng kính siêu trong, mang đến độ xuyên thấu tốt, ít gây ảnh hưởng tới trải nghiệm người chơi thủy sinh.
Mức giá rẻ và phù hợp với nhiều người chơi thủy sinh.
Là kính 5 nên gọn gàng và thanh thoát hơn.
Bể dán theo dạng dấu keo và được mài vi tính xiết cạnh đảm bảo thẩm mỹ cho chiếc bể thủy sinh.
Kích thước chuẩn xác phù hợp với kích thước chuẩn của thế giới.
Có tấm cao xu mỏng lót đáy bể, giúp bể giảm thiểu tác động từ bề mặt.
Sản phẩm phù hợp với mọi dòng đèn thủy sinh có kích thước chuẩn.
Sản phẩm được Thủy Sinh 4U phân phối và đảm bảo chất lượng, được bảo hành đầy đủ. Hãy đến với Shop Ca Canh để mua những sản phẩm bể kính 60 cm siêu trong chất lượng cao.', 600000, 580000, 2, N'be-kinh', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (23, N'Lọc thùng Sunsun Xiaoli XWA', N'locvisinh_sunsun.png                                                                                ', 5, N'Dòng sản phẩm lọc thùng Sunsun Xiaoli XWA đến từ hãng Sunsun là một trong số những dòng sản phẩm mới nhất trong năm 2021. ', N'Là một dòng sản phẩm mới được cải tiến từ những ưu điểm có sẵn từ hãng, lọc Sunsun Xiaoli XWA không những rẻ, khỏe mà chất lượng phần cứng đã được tăng lên rất nhiều.Điểm đầu tiên mình cần chia sẻ đó chính là chất lượng sản phẩm so với người đàn anh đi trước chính là lọc Sunsun HW, khi mình cầm vào sản phẩm thì phải khẳng định một điều đó chính là chất lượng gia cộng, chất lượng nhựa và thiết kế của Sunsun Xiaoli đã tốt hơn rất nhiều so với người đàn anh tiền nhiệm. Cảm giác chắc chắn hơn, cứng hơn và đàm tay hơn, khiến sản phẩm có cảm tình hơn và thể hiện được chất lượng từ sản phẩm.Nói về thiết kế sản phẩm,thẩm mỹ sẽ hơi khó để khen hoặc chê, nhưng nhìn chung dòng sản phẩm mới Xiaoli có thiết kế đẹp hơn và độc đáo hơn bản tiền nhiệm, cảm giác tinh tế hơn với thiết kế không quá rườm già nhưng vẫn thẩm mỹ.', 1500000, 1300000, 2, N'loc-vi-sinh-sunsun', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (24, N'In Out inox Fi 19 xoay 360 độ', N'loc_inox.png                                                                                        ', 5, N'Bộ sản phẩm In Out inox Fi 19 đến từ hãng HAD, dòng sản phẩm in out chuyên dùng cho bể thủy sinh mini, nano để bàn cực kỳ tiện và đẹp mắt. Đây là một dòng sản phẩm thay thế cho các đầu in out bằng nhựa theo kèm trong các dòng lọc thủy sinh.', N'Sản phẩm In Out inox Fi 19 hãng HAD (Việt Nam) được sản xuất bằng Inox 304 nên rất cứng, bền và ít bị han khi ngâm nước lâu ngày. Được đánh bóng hoàn hảo, giúp tăng tính thẩm mỹ và trải nghiệm chơi thủy sinh nhờ thiết kế tinh tế hơn.Bộ In Out inox Fi 19 với thiết kế mới nhất có thể chỉnh được đầu xoay, giúp bạn có thể điều chỉnh hướng của dòng nước theo đúng layout và yêu cầu. Bộ In Out inox Fi 19 được thiết kế để tránh làm tổn thương đến các loại cá nhỏ hoặc tép.Với công dụng chính là tăng tính thẩm mỹ cho bể thủy sinh của bạn, chúng ta sẽ không phải nhìn thấy những đường In Out màu đen theo kèm của các dòng lọc thùng mà thay vào đó là màu bạc óng của dòng Inox 304.

Sản phẩm được Thủy Sinh 4U phân phối và bảo hành, đảm bảo sản phẩm chất lượng đúng thông số đưa ra.', 280000, 250000, 2, N'loc-inox-19', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (25, N'In Out inox Fi 16 hãng HAD chất lượng cao', N'loc_inox.png                                                                                        ', 5, N'Bộ sản phẩm In Out inox Fi 19 đến từ hãng HAD, dòng sản phẩm in out chuyên dùng cho bể thủy sinh mini, nano để bàn cực kỳ tiện và đẹp mắt. Đây là một dòng sản phẩm thay thế cho các đầu in out bằng nhựa theo kèm trong các dòng lọc thủy sinh.', N'Sản phẩm In Out inox Fi 19 hãng HAD (Việt Nam) được sản xuất bằng Inox 304 nên rất cứng, bền và ít bị han khi ngâm nước lâu ngày. Được đánh bóng hoàn hảo, giúp tăng tính thẩm mỹ và trải nghiệm chơi thủy sinh nhờ thiết kế tinh tế hơn.Bộ In Out inox Fi 19 với thiết kế mới nhất có thể chỉnh được đầu xoay, giúp bạn có thể điều chỉnh hướng của dòng nước theo đúng layout và yêu cầu. Bộ In Out inox Fi 19 được thiết kế để tránh làm tổn thương đến các loại cá nhỏ hoặc tép.Với công dụng chính là tăng tính thẩm mỹ cho bể thủy sinh của bạn, chúng ta sẽ không phải nhìn thấy những đường In Out màu đen theo kèm của các dòng lọc thùng mà thay vào đó là màu bạc óng của dòng Inox 304.

Sản phẩm được Thủy Sinh 4U phân phối và bảo hành, đảm bảo sản phẩm chất lượng đúng thông số đưa ra.', 250000, 200000, 2, N'loc-inox-16', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (26, N'In Out inox Fi 12 hãng HAD chất lượng cao', N'loc_inox.png                                                                                        ', 5, N'Bộ sản phẩm In Out inox Fi 19 đến từ hãng HAD, dòng sản phẩm in out chuyên dùng cho bể thủy sinh mini, nano để bàn cực kỳ tiện và đẹp mắt. Đây là một dòng sản phẩm thay thế cho các đầu in out bằng nhựa theo kèm trong các dòng lọc thủy sinh.', N'Sản phẩm In Out inox Fi 19 hãng HAD (Việt Nam) được sản xuất bằng Inox 304 nên rất cứng, bền và ít bị han khi ngâm nước lâu ngày. Được đánh bóng hoàn hảo, giúp tăng tính thẩm mỹ và trải nghiệm chơi thủy sinh nhờ thiết kế tinh tế hơn.Bộ In Out inox Fi 19 với thiết kế mới nhất có thể chỉnh được đầu xoay, giúp bạn có thể điều chỉnh hướng của dòng nước theo đúng layout và yêu cầu. Bộ In Out inox Fi 19 được thiết kế để tránh làm tổn thương đến các loại cá nhỏ hoặc tép.Với công dụng chính là tăng tính thẩm mỹ cho bể thủy sinh của bạn, chúng ta sẽ không phải nhìn thấy những đường In Out màu đen theo kèm của các dòng lọc thùng mà thay vào đó là màu bạc óng của dòng Inox 304.

Sản phẩm được Thủy Sinh 4U phân phối và bảo hành, đảm bảo sản phẩm chất lượng đúng thông số đưa ra.', 200000, 180000, 2, N'loc-inox-12', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avartar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (27, N'In Out inox Fi 10 hãng HAD cực đẹp cho bể mini, nano', N'loc_inox.png                                                                                        ', 5, N'Bộ sản phẩm In Out inox Fi 19 đến từ hãng HAD, dòng sản phẩm in out chuyên dùng cho bể thủy sinh mini, nano để bàn cực kỳ tiện và đẹp mắt. Đây là một dòng sản phẩm thay thế cho các đầu in out bằng nhựa theo kèm trong các dòng lọc thủy sinh.', N'Sản phẩm In Out inox Fi 19 hãng HAD (Việt Nam) được sản xuất bằng Inox 304 nên rất cứng, bền và ít bị han khi ngâm nước lâu ngày. Được đánh bóng hoàn hảo, giúp tăng tính thẩm mỹ và trải nghiệm chơi thủy sinh nhờ thiết kế tinh tế hơn.Bộ In Out inox Fi 19 với thiết kế mới nhất có thể chỉnh được đầu xoay, giúp bạn có thể điều chỉnh hướng của dòng nước theo đúng layout và yêu cầu. Bộ In Out inox Fi 19 được thiết kế để tránh làm tổn thương đến các loại cá nhỏ hoặc tép.Với công dụng chính là tăng tính thẩm mỹ cho bể thủy sinh của bạn, chúng ta sẽ không phải nhìn thấy những đường In Out màu đen theo kèm của các dòng lọc thùng mà thay vào đó là màu bạc óng của dòng Inox 304.

Sản phẩm được Thủy Sinh 4U phân phối và bảo hành, đảm bảo sản phẩm chất lượng đúng thông số đưa ra.', 180000, 150000, 2, N'loc-inox-10', 2, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Loc', N'Bui', N'loc123@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Loc', N'Thanh', N'loc123456@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'Loc', N'Coc', N'loccoc123@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá sốc, 2:Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [WebsiteShopCaCanh] SET  READ_WRITE 
GO
