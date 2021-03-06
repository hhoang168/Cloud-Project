USE [master]
GO
/****** Object:  Database [Project]    Script Date: 12/18/2019 11:20:48 AM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[tblBills]    Script Date: 12/18/2019 11:20:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBills](
	[IdBill] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[Total] [float] NULL,
	[Date] [date] NOT NULL,
	[IDStatusBill] [int] NOT NULL,
	[BillNum] [int] NOT NULL,
 CONSTRAINT [PK_tblBills_1] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCities](
	[IdCity] [varchar](20) NOT NULL,
	[NameCity] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblCities] PRIMARY KEY CLUSTERED 
(
	[IdCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHouses]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHouses](
	[IdHouse] [varchar](50) NOT NULL,
	[PicHouse] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Furniture] [nvarchar](20) NULL,
	[TypeID] [nvarchar](10) NOT NULL,
	[Price] [float] NOT NULL,
	[IdWay] [varchar](20) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK_tblHouses] PRIMARY KEY CLUSTERED 
(
	[IdHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductsInBill]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductsInBill](
	[IdBill] [varchar](50) NOT NULL,
	[IdHouse] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_tblProductsInBill_1] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC,
	[IdHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProperties]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProperties](
	[IdHouse] [varchar](50) NOT NULL,
	[MediaRoom] [bit] NOT NULL,
	[FamilyRoom] [bit] NOT NULL,
	[GymRoom] [bit] NOT NULL,
	[Library] [bit] NOT NULL,
	[Pool] [bit] NOT NULL,
	[TV] [bit] NOT NULL,
	[Kitchen] [bit] NOT NULL,
	[LivingRoom] [bit] NOT NULL,
	[Garden] [bit] NOT NULL,
 CONSTRAINT [PK_tblProperties] PRIMARY KEY CLUSTERED 
(
	[IdHouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [varchar](20) NOT NULL,
	[RoleDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[StatusCode] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[StatusCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusBills]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusBills](
	[IDStatusBill] [int] NOT NULL,
	[StatusDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblStatusBills] PRIMARY KEY CLUSTERED 
(
	[IDStatusBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTypes]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypes](
	[TypeID] [nvarchar](10) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [varchar](max) NULL,
	[Password] [varchar](50) NULL,
	[RoleID] [varchar](20) NOT NULL,
	[Invalid] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWays]    Script Date: 12/18/2019 11:20:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWays](
	[IdWay] [varchar](20) NOT NULL,
	[NameWay] [nvarchar](max) NULL,
	[IdCity] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblWays] PRIMARY KEY CLUSTERED 
(
	[IdWay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBills]  WITH CHECK ADD  CONSTRAINT [FK_tblBills_tblStatusBills] FOREIGN KEY([IDStatusBill])
REFERENCES [dbo].[tblStatusBills] ([IDStatusBill])
GO
ALTER TABLE [dbo].[tblBills] CHECK CONSTRAINT [FK_tblBills_tblStatusBills]
GO
ALTER TABLE [dbo].[tblBills]  WITH CHECK ADD  CONSTRAINT [FK_tblBills_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblBills] CHECK CONSTRAINT [FK_tblBills_tblUsers]
GO
ALTER TABLE [dbo].[tblHouses]  WITH CHECK ADD  CONSTRAINT [FK_tblHouses_tblStatus] FOREIGN KEY([StatusCode])
REFERENCES [dbo].[tblStatus] ([StatusCode])
GO
ALTER TABLE [dbo].[tblHouses] CHECK CONSTRAINT [FK_tblHouses_tblStatus]
GO
ALTER TABLE [dbo].[tblHouses]  WITH CHECK ADD  CONSTRAINT [FK_tblHouses_tblTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[tblTypes] ([TypeID])
GO
ALTER TABLE [dbo].[tblHouses] CHECK CONSTRAINT [FK_tblHouses_tblTypes]
GO
ALTER TABLE [dbo].[tblHouses]  WITH CHECK ADD  CONSTRAINT [FK_tblHouses_tblWays] FOREIGN KEY([IdWay])
REFERENCES [dbo].[tblWays] ([IdWay])
GO
ALTER TABLE [dbo].[tblHouses] CHECK CONSTRAINT [FK_tblHouses_tblWays]
GO
ALTER TABLE [dbo].[tblProductsInBill]  WITH CHECK ADD  CONSTRAINT [FK_tblProductsInBill_tblBills1] FOREIGN KEY([IdBill])
REFERENCES [dbo].[tblBills] ([IdBill])
GO
ALTER TABLE [dbo].[tblProductsInBill] CHECK CONSTRAINT [FK_tblProductsInBill_tblBills1]
GO
ALTER TABLE [dbo].[tblProductsInBill]  WITH CHECK ADD  CONSTRAINT [FK_tblProductsInBill_tblHouses] FOREIGN KEY([IdHouse])
REFERENCES [dbo].[tblHouses] ([IdHouse])
GO
ALTER TABLE [dbo].[tblProductsInBill] CHECK CONSTRAINT [FK_tblProductsInBill_tblHouses]
GO
ALTER TABLE [dbo].[tblProperties]  WITH CHECK ADD  CONSTRAINT [FK_tblProperties_tblHouses] FOREIGN KEY([IdHouse])
REFERENCES [dbo].[tblHouses] ([IdHouse])
GO
ALTER TABLE [dbo].[tblProperties] CHECK CONSTRAINT [FK_tblProperties_tblHouses]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblWays]  WITH CHECK ADD  CONSTRAINT [FK_tblWays_tblCities] FOREIGN KEY([IdCity])
REFERENCES [dbo].[tblCities] ([IdCity])
GO
ALTER TABLE [dbo].[tblWays] CHECK CONSTRAINT [FK_tblWays_tblCities]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
