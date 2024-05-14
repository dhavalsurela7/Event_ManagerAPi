USE [Event_Handling]
GO
/****** Object:  Table [dbo].[tbl_Activities]    Script Date: 06-05-2024 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Activities](
	[Activity_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Activity_Name] [varchar](255) NOT NULL,
	[Activity_Description] [varchar](max) NOT NULL,
	[Activity_Start_Datetime] [datetime] NOT NULL,
	[Activity_End_Datetime] [datetime] NOT NULL,
	[Activity_Price] [decimal](10, 2) NOT NULL,
	[Event_Id] [bigint] NOT NULL,
 CONSTRAINT [PK__tbl_Acti__393F5A453CBFE2C9] PRIMARY KEY CLUSTERED 
(
	[Activity_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 06-05-2024 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Admins](
	[Admin_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Admin_Name] [varchar](255) NOT NULL,
	[Admin_Email] [varchar](320) NOT NULL,
	[Admin_Address] [varchar](max) NOT NULL,
	[Admin_Password] [varchar](255) NOT NULL,
	[Admin_Mobile] [varchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Created_DateTime] [datetime] NOT NULL,
	[Updated_Datetime] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Admin_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Events]    Script Date: 06-05-2024 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Events](
	[Event_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event_Name] [varchar](255) NOT NULL,
	[Event_Start_Date] [date] NOT NULL,
	[Event_End_Date] [date] NOT NULL,
	[Event_Image] [varchar](max) NOT NULL,
	[Event_Description] [varchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK__tbl_Even__FD6BEF8445C29B14] PRIMARY KEY CLUSTERED 
(
	[Event_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 06-05-2024 12:14:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](255) NOT NULL,
	[User_Email] [varchar](320) NOT NULL,
	[User_Address] [varchar](max) NOT NULL,
	[User_Password] [varchar](255) NOT NULL,
	[User_Mobile] [nchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Created_DateTime] [datetime] NOT NULL,
	[Updated_Datetime] [datetime] NULL,
 CONSTRAINT [PK__User_Tab__206D91707E004D2A] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Activities] ON 

INSERT [dbo].[tbl_Activities] ([Activity_Id], [Activity_Name], [Activity_Description], [Activity_Start_Datetime], [Activity_End_Datetime], [Activity_Price], [Event_Id]) VALUES (3, N'Fugga Fod', N'Fugga fodo inam jito ', CAST(N'2024-05-09T10:16:00.000' AS DateTime), CAST(N'2024-05-09T21:17:00.000' AS DateTime), CAST(9000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[tbl_Activities] ([Activity_Id], [Activity_Name], [Activity_Description], [Activity_Start_Datetime], [Activity_End_Datetime], [Activity_Price], [Event_Id]) VALUES (4, N'Potluck', N'Lets go Fodiessssssssssssssssssssssssssss', CAST(N'2024-05-22T17:47:00.000' AS DateTime), CAST(N'2024-05-25T17:47:00.000' AS DateTime), CAST(52.00 AS Decimal(10, 2)), 6)
SET IDENTITY_INSERT [dbo].[tbl_Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Admins] ON 

INSERT [dbo].[tbl_Admins] ([Admin_Id], [Admin_Name], [Admin_Email], [Admin_Address], [Admin_Password], [Admin_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (1, N'Admin', N'admin@ofs.com', N'Mumbai', N'Admin@123', N'9054499036', 1, CAST(N'2024-04-03T16:14:48.157' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Events] ON 

INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (4, N'Diwali', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-15' AS Date), N'C:\EventApiPub\Diwali.png', N'let''s go', 0)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (5, N'Dashera', CAST(N'2024-05-09' AS Date), CAST(N'2024-05-16' AS Date), N'C:\EventApiPub\Dashera.png', N'Burai par a6ai ki jit', 0)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (6, N'Holi', CAST(N'2024-05-17' AS Date), CAST(N'2024-05-25' AS Date), N'C:\EventApiPub\Holi.png', N'Holi he!!!!!!!!!!!!!!!!!!!', 0)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (7, N'Navaratri', CAST(N'2024-06-12' AS Date), CAST(N'2024-06-20' AS Date), N'C:\EventApiPub\Navaratri.png', N'Navaratri', 0)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (8, N'Baishakhi', CAST(N'2024-05-15' AS Date), CAST(N'2024-05-16' AS Date), N'C:\EventApiPub\Baishakhi.png', N'Baishakhi', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (9, N'Ganesh Chaturthi', CAST(N'2024-05-09' AS Date), CAST(N'2024-05-11' AS Date), N'C:\EventApiPub\Ganesh Chaturthi.png', N'Ganesh chaturhti', 0)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (10, N'GudiPadva', CAST(N'2024-05-17' AS Date), CAST(N'2024-05-25' AS Date), N'C:\EventApiPub\GudiPadva.png', N'GudiPadva', 1)
SET IDENTITY_INSERT [dbo].[tbl_Events] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (3, N'Dhaval', N'dhaval@gmail.com', N'Memnagar', N'Dhaval@123', N'9313695901', 1, CAST(N'2024-04-03T15:30:19.747' AS DateTime), NULL)
INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (4, N'Dharmesh', N'dharmesh@gmail.com', N'Naroda', N'Dharmesh@123', N'9054499036', 1, CAST(N'2024-04-04T18:45:13.900' AS DateTime), NULL)
INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (10009, N'Dharmesh Dallo', N'dharmesh123@gmail.com', N'Dallapur', N'Dharmesh@123', N'0999999999', 1, CAST(N'2024-05-01T17:17:28.523' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Acti__7FD1B87744AAB932]    Script Date: 06-05-2024 12:14:52 ******/
ALTER TABLE [dbo].[tbl_Activities] ADD  CONSTRAINT [UQ__tbl_Acti__7FD1B87744AAB932] UNIQUE NONCLUSTERED 
(
	[Activity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Admi__6066AA65F206B3ED]    Script Date: 06-05-2024 12:14:52 ******/
ALTER TABLE [dbo].[tbl_Admins] ADD UNIQUE NONCLUSTERED 
(
	[Admin_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Even__C46EAE6E21C5508F]    Script Date: 06-05-2024 12:14:52 ******/
ALTER TABLE [dbo].[tbl_Events] ADD  CONSTRAINT [UQ__tbl_Even__C46EAE6E21C5508F] UNIQUE NONCLUSTERED 
(
	[Event_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User_Tab__4C70A05C277206EC]    Script Date: 06-05-2024 12:14:52 ******/
ALTER TABLE [dbo].[tbl_Users] ADD  CONSTRAINT [UQ__User_Tab__4C70A05C277206EC] UNIQUE NONCLUSTERED 
(
	[User_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Activities] ADD  CONSTRAINT [DF_tbl_Activities_Activity_Price]  DEFAULT ((0)) FOR [Activity_Price]
GO
ALTER TABLE [dbo].[tbl_Admins] ADD  CONSTRAINT [DF_tbl_Admins_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Events] ADD  CONSTRAINT [DF_tbl_Events_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tbl_Users] ADD  CONSTRAINT [DF_tbl_Users_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Activities]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Activities_tbl_Events] FOREIGN KEY([Event_Id])
REFERENCES [dbo].[tbl_Events] ([Event_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Activities] CHECK CONSTRAINT [FK_tbl_Activities_tbl_Events]
GO
