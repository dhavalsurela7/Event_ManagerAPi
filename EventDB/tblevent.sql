USE [Event_Handling]
GO
/****** Object:  Table [dbo].[tbl_Activities]    Script Date: 18-04-2024 10:31:51 ******/
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
	[Event_Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK__tbl_Acti__393F5A453CBFE2C9] PRIMARY KEY CLUSTERED 
(
	[Activity_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 18-04-2024 10:31:51 ******/
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
/****** Object:  Table [dbo].[tbl_Events]    Script Date: 18-04-2024 10:31:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Events](
	[Event_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event_Name] [varchar](255) NOT NULL,
	[Event_Start_Date] [date] NOT NULL,
	[Event_End_Date] [date] NOT NULL,
	[Event_Image] [varchar](max) NULL,
	[Event_Description] [varchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Event_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 18-04-2024 10:31:51 ******/
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

INSERT [dbo].[tbl_Activities] ([Activity_Id], [Activity_Name], [Activity_Description], [Activity_Start_Datetime], [Activity_End_Datetime], [Activity_Price], [Event_Name]) VALUES (5, N'raakhi', N'raakhi bandho', CAST(N'2024-04-20T15:23:00.000' AS DateTime), CAST(N'2024-04-20T18:23:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)), N'Rakshabandhan')
INSERT [dbo].[tbl_Activities] ([Activity_Id], [Activity_Name], [Activity_Description], [Activity_Start_Datetime], [Activity_End_Datetime], [Activity_Price], [Event_Name]) VALUES (6, N'mithai', N'mithai khao', CAST(N'2024-04-21T15:23:00.000' AS DateTime), CAST(N'2024-04-21T20:23:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)), N'Rakshabandhan')
INSERT [dbo].[tbl_Activities] ([Activity_Id], [Activity_Name], [Activity_Description], [Activity_Start_Datetime], [Activity_End_Datetime], [Activity_Price], [Event_Name]) VALUES (8, N'go to moon', N'let''s go to moon', CAST(N'2024-04-21T11:46:00.000' AS DateTime), CAST(N'2024-04-22T11:47:00.000' AS DateTime), CAST(100000.00 AS Decimal(10, 2)), N'Bladerunner')
SET IDENTITY_INSERT [dbo].[tbl_Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Admins] ON 

INSERT [dbo].[tbl_Admins] ([Admin_Id], [Admin_Name], [Admin_Email], [Admin_Address], [Admin_Password], [Admin_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (1, N'Admin', N'admin@ofs.com', N'Mumbai', N'password', N'9054499036', 1, CAST(N'2024-04-03T16:14:48.157' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Events] ON 

INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (10, N'Bladerunner', CAST(N'2024-04-20' AS Date), CAST(N'2024-04-26' AS Date), N'C:\Users\LENOVO\source\repos\Event_Manager\Event_Manager\Bladerunner.png', N'bladerunner hu me', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (11, N'Rakshabandhan', CAST(N'2024-04-19' AS Date), CAST(N'2024-04-23' AS Date), N'C:\Users\LENOVO\source\repos\Event_Manager\Event_Manager\Rakshabandhan.png', N'let''s update', 1)
SET IDENTITY_INSERT [dbo].[tbl_Events] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (3, N'Dhaval', N'dhaval@gmail.com', N'Memnagar', N'123456', N'9313695901', 1, CAST(N'2024-04-03T15:30:19.747' AS DateTime), NULL)
INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (4, N'Dharmesh', N'dharmesh@gmail.com', N'Naroda', N'123456', N'9054499036', 1, CAST(N'2024-04-04T18:45:13.900' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Acti__7FD1B87744AAB932]    Script Date: 18-04-2024 10:31:52 ******/
ALTER TABLE [dbo].[tbl_Activities] ADD  CONSTRAINT [UQ__tbl_Acti__7FD1B87744AAB932] UNIQUE NONCLUSTERED 
(
	[Activity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Admi__6066AA65F206B3ED]    Script Date: 18-04-2024 10:31:52 ******/
ALTER TABLE [dbo].[tbl_Admins] ADD UNIQUE NONCLUSTERED 
(
	[Admin_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Even__C46EAE6E21C5508F]    Script Date: 18-04-2024 10:31:52 ******/
ALTER TABLE [dbo].[tbl_Events] ADD UNIQUE NONCLUSTERED 
(
	[Event_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User_Tab__4C70A05C277206EC]    Script Date: 18-04-2024 10:31:52 ******/
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
ALTER TABLE [dbo].[tbl_Activities]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Activities_tbl_Events1] FOREIGN KEY([Event_Name])
REFERENCES [dbo].[tbl_Events] ([Event_Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Activities] CHECK CONSTRAINT [FK_tbl_Activities_tbl_Events1]
GO
