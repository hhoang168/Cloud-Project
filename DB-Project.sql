USE [Project]
GO
/****** Object:  Table [dbo].[tblBills]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHouses]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProductsInBill]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProperties]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatusBills]    Script Date: 7/15/2020 9:40:51 PM ******/
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
/****** Object:  Table [dbo].[tblTypes]    Script Date: 7/15/2020 9:40:51 PM ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWays]    Script Date: 7/15/2020 9:40:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCities] ([IdCity], [NameCity]) VALUES (N'1', N'HCM')
INSERT [dbo].[tblCities] ([IdCity], [NameCity]) VALUES (N'2', N'HaNoi')
INSERT [dbo].[tblHouses] ([IdHouse], [PicHouse], [Description], [Furniture], [TypeID], [Price], [IdWay], [StatusCode], [IsDelete]) VALUES (N'1', N'https://pixabay.com/en/house-1353389_1920', N'Nha dep', N'1-2-3-4', N'2', 200000, N'1', 2, 0)
INSERT [dbo].[tblHouses] ([IdHouse], [PicHouse], [Description], [Furniture], [TypeID], [Price], [IdWay], [StatusCode], [IsDelete]) VALUES (N'2', N'https://pixabay.com/en/house-431604_1920', N'Nha 2', N'3-2-1-4', N'1', 400000, N'1', 1, 0)
INSERT [dbo].[tblProperties] ([IdHouse], [MediaRoom], [FamilyRoom], [GymRoom], [Library], [Pool], [TV], [Kitchen], [LivingRoom], [Garden]) VALUES (N'1', 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[tblProperties] ([IdHouse], [MediaRoom], [FamilyRoom], [GymRoom], [Library], [Pool], [TV], [Kitchen], [LivingRoom], [Garden]) VALUES (N'2', 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[tblRoles] ([RoleID], [RoleDescription]) VALUES (N'1', N'admin')
INSERT [dbo].[tblRoles] ([RoleID], [RoleDescription]) VALUES (N'2', N'member')
INSERT [dbo].[tblStatus] ([StatusCode], [Status]) VALUES (1, N'owned')
INSERT [dbo].[tblStatus] ([StatusCode], [Status]) VALUES (2, N'free')
INSERT [dbo].[tblStatusBills] ([IDStatusBill], [StatusDescription]) VALUES (1, N'paid')
INSERT [dbo].[tblStatusBills] ([IDStatusBill], [StatusDescription]) VALUES (2, N'pending')
INSERT [dbo].[tblTypes] ([TypeID], [TypeName]) VALUES (N'1', N'Apartment')
INSERT [dbo].[tblTypes] ([TypeID], [TypeName]) VALUES (N'2', N'Building')
INSERT [dbo].[tblUsers] ([UserID], [UserName], [Email], [Password], [RoleID], [Invalid]) VALUES (N'1', N'admin', N'admin@gmail.com', N'12345678', N'1', 0)
INSERT [dbo].[tblUsers] ([UserID], [UserName], [Email], [Password], [RoleID], [Invalid]) VALUES (N'2', N'johndoe', N'johndoe@gmail.com', N'12345678', N'2', 0)
INSERT [dbo].[tblWays] ([IdWay], [NameWay], [IdCity]) VALUES (N'1', N'HCM way', N'1')
INSERT [dbo].[tblWays] ([IdWay], [NameWay], [IdCity]) VALUES (N'2', N'HaNoi way', N'2')
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
