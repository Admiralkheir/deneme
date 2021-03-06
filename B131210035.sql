USE [master]
GO
/****** Object:  Database [blogproject]    Script Date: 10.12.2017 15:29:07 ******/
CREATE DATABASE [blogproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blogproject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\blogproject.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'blogproject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\blogproject_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [blogproject] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blogproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blogproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blogproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blogproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blogproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blogproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [blogproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blogproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blogproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blogproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blogproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blogproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blogproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blogproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blogproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blogproject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blogproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blogproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blogproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blogproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blogproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blogproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blogproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blogproject] SET RECOVERY FULL 
GO
ALTER DATABASE [blogproject] SET  MULTI_USER 
GO
ALTER DATABASE [blogproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blogproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blogproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blogproject] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [blogproject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'blogproject', N'ON'
GO
USE [blogproject]
GO
/****** Object:  Table [dbo].[AnahtarKelime]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnahtarKelime](
	[AnahtarKelimeID] [int] IDENTITY(1,1) NOT NULL,
	[AnahtarKelimeAd] [nchar](50) NULL,
 CONSTRAINT [PK_AnahtarKelime] PRIMARY KEY CLUSTERED 
(
	[AnahtarKelimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[YetkiID] [int] NULL,
	[AdSoyad] [nchar](30) NULL,
	[Eposta] [nchar](25) NULL,
	[Parola] [nchar](15) NULL,
	[GirisID] [nchar](15) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Makale]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[MakaleID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[KullaniciID] [int] NULL,
	[Baslik] [nvarchar](max) NULL,
	[Makale_İcerik] [nvarchar](max) NULL,
	[Makale_Tarih] [datetime] NULL CONSTRAINT [DF_Makale_Tarih]  DEFAULT (getdate()),
	[Makale_Resim] [nvarchar](max) NULL,
	[Begeni] [int] NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[MakaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Makale_AnahtarKelime]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale_AnahtarKelime](
	[MakaleID] [int] NOT NULL,
	[AnahtarKelimeID] [int] NOT NULL,
 CONSTRAINT [PK_Makale_AnahtarKelime] PRIMARY KEY CLUSTERED 
(
	[MakaleID] ASC,
	[AnahtarKelimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[olumluOy]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olumluOy](
	[oyID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_olumluOy] PRIMARY KEY CLUSTERED 
(
	[oyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[olumsuzOy]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[olumsuzOy](
	[oyID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_olumsuzOy] PRIMARY KEY CLUSTERED 
(
	[oyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oy]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oy](
	[oyID] [int] IDENTITY(1,1) NOT NULL,
	[oyTip] [char](10) NULL,
	[YorumID] [int] NULL,
 CONSTRAINT [PK_oy] PRIMARY KEY CLUSTERED 
(
	[oyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[YetkiID] [int] IDENTITY(1,1) NOT NULL,
	[YetkiHali] [nchar](50) NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[YetkiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 10.12.2017 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[YorumID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NULL,
	[MakaleID] [int] NULL,
	[Yorum_İcerik] [nvarchar](500) NULL,
	[Yorum_Tarih] [datetime] NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[YorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AnahtarKelime] ON 

INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (14, N'kelime2                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (15, N'kelime3                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (16, N'kelime1                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (17, N'kelime2                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (18, N'kelime3                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (19, N'kelime1                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (20, N'kelime2                                           ')
INSERT [dbo].[AnahtarKelime] ([AnahtarKelimeID], [AnahtarKelimeAd]) VALUES (21, N'kelime3                                           ')
SET IDENTITY_INSERT [dbo].[AnahtarKelime] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (1, N'Genel Şeyler')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (2, N'Anime/Manga')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (3, N'Teknoloji')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (4, N'Siyaset')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (5, N'Gezi/Seyahat')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (6, N'Yazılım')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (7, N'Linux')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (8, N'Sinema')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (9, N'Kendi Yazılarım')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (10, N'Hobi')
INSERT [dbo].[Kategori] ([KategoriID], [KategoriAd]) VALUES (11, N'Android')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [YetkiID], [AdSoyad], [Eposta], [Parola], [GirisID]) VALUES (1, 1, N'Tugay Ersoy                   ', N'tugay.ersoy@gmail.com    ', N'123            ', N'tugay          ')
INSERT [dbo].[Kullanici] ([KullaniciID], [YetkiID], [AdSoyad], [Eposta], [Parola], [GirisID]) VALUES (2, 2, N'Ali Varan                     ', N'alivaran@hotmail.com     ', N'123            ', N'alivaran       ')
INSERT [dbo].[Kullanici] ([KullaniciID], [YetkiID], [AdSoyad], [Eposta], [Parola], [GirisID]) VALUES (3, 2, N'test test12                   ', N'deneme                   ', N'123            ', N'deneme         ')
INSERT [dbo].[Kullanici] ([KullaniciID], [YetkiID], [AdSoyad], [Eposta], [Parola], [GirisID]) VALUES (5, 2, N'Bülent Tezip                  ', N'bulent@gmail.com         ', N'123            ', N'bulent         ')
INSERT [dbo].[Kullanici] ([KullaniciID], [YetkiID], [AdSoyad], [Eposta], [Parola], [GirisID]) VALUES (6, 2, N'ali                           ', N'ali@hotmail.com          ', N'123            ', N'alisen         ')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Makale] ON 

INSERT [dbo].[Makale] ([MakaleID], [KategoriID], [KullaniciID], [Baslik], [Makale_İcerik], [Makale_Tarih], [Makale_Resim], [Begeni]) VALUES (7, 1, 1, N'Genel Kültür', N'M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus Bonorum et Malorum"un 1.10.32 sayılı bölümü  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?" 1914 tarihli H. Rackham Çevirisi  "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?" M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus Bonorum et Malorum"un 1.10.33 sayılı bölümü  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat." 1914 tarihli H. Rackham Çevirisi  "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."', CAST(N'2012-05-03 00:00:00.000' AS DateTime), N'/Resimler/MakaleResimleri/3b33eb4a-ee5c-4c72-94cd-6bf1fd3141f1.jpg', 1)
INSERT [dbo].[Makale] ([MakaleID], [KategoriID], [KullaniciID], [Baslik], [Makale_İcerik], [Makale_Tarih], [Makale_Resim], [Begeni]) VALUES (8, 4, 1, N'Siyasi Hayat', N'M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus Bonorum et Malorum"un 1.10.32 sayılı bölümü  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?" 1914 tarihli H. Rackham Çevirisi  "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?" M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus Bonorum et Malorum"un 1.10.33 sayılı bölümü  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat." 1914 tarihli H. Rackham Çevirisi  "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."', CAST(N'2015-04-02 00:00:00.000' AS DateTime), N'/Resimler/MakaleResimleri/365d5f44-9744-4a33-98eb-1be44bae19e3.jpg', 1)
INSERT [dbo].[Makale] ([MakaleID], [KategoriID], [KullaniciID], [Baslik], [Makale_İcerik], [Makale_Tarih], [Makale_Resim], [Begeni]) VALUES (9, 9, 1, N'Benim Hakkımda', N'M.Ö. 45 tarihinde Çiçero tarafından yazılan "de Finibus Bonorum et Malorum"un 1.10.33 sayılı bölümü  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat." 1914 tarihli H. Rackham Çevirisi  "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."', CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'/Resimler/MakaleResimleri/11d4f6b1-84cb-402f-8204-8c04b484f975.jpg', 1)
SET IDENTITY_INSERT [dbo].[Makale] OFF
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (7, 14)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (7, 15)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (8, 16)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (8, 17)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (8, 18)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (9, 19)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (9, 20)
INSERT [dbo].[Makale_AnahtarKelime] ([MakaleID], [AnahtarKelimeID]) VALUES (9, 21)
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([YetkiID], [YetkiHali]) VALUES (1, N'Admin                                             ')
INSERT [dbo].[Yetki] ([YetkiID], [YetkiHali]) VALUES (2, N'Uye                                               ')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
ALTER TABLE [dbo].[Yorum] ADD  CONSTRAINT [DF_Yorum_Yorum_Tarih]  DEFAULT (getdate()) FOR [Yorum_Tarih]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Yetki1] FOREIGN KEY([YetkiID])
REFERENCES [dbo].[Yetki] ([YetkiID])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Yetki1]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategori] ([KategoriID])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kullanici]
GO
ALTER TABLE [dbo].[Makale_AnahtarKelime]  WITH CHECK ADD  CONSTRAINT [FK_Makale_AnahtarKelime_AnahtarKelime] FOREIGN KEY([AnahtarKelimeID])
REFERENCES [dbo].[AnahtarKelime] ([AnahtarKelimeID])
GO
ALTER TABLE [dbo].[Makale_AnahtarKelime] CHECK CONSTRAINT [FK_Makale_AnahtarKelime_AnahtarKelime]
GO
ALTER TABLE [dbo].[Makale_AnahtarKelime]  WITH CHECK ADD  CONSTRAINT [FK_Makale_AnahtarKelime_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleID])
GO
ALTER TABLE [dbo].[Makale_AnahtarKelime] CHECK CONSTRAINT [FK_Makale_AnahtarKelime_Makale]
GO
ALTER TABLE [dbo].[olumluOy]  WITH CHECK ADD  CONSTRAINT [FK_olumluOy_oy] FOREIGN KEY([oyID])
REFERENCES [dbo].[oy] ([oyID])
GO
ALTER TABLE [dbo].[olumluOy] CHECK CONSTRAINT [FK_olumluOy_oy]
GO
ALTER TABLE [dbo].[olumsuzOy]  WITH CHECK ADD  CONSTRAINT [FK_olumsuzOy_oy] FOREIGN KEY([oyID])
REFERENCES [dbo].[oy] ([oyID])
GO
ALTER TABLE [dbo].[olumsuzOy] CHECK CONSTRAINT [FK_olumsuzOy_oy]
GO
ALTER TABLE [dbo].[oy]  WITH CHECK ADD  CONSTRAINT [FK_oy_Yorum] FOREIGN KEY([YorumID])
REFERENCES [dbo].[Yorum] ([YorumID])
GO
ALTER TABLE [dbo].[oy] CHECK CONSTRAINT [FK_oy_Yorum]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Kullanici]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([MakaleID])
REFERENCES [dbo].[Makale] ([MakaleID])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [blogproject] SET  READ_WRITE 
GO
