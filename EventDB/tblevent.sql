USE [Event_Handling]
GO
/****** Object:  Table [dbo].[tbl_Activities]    Script Date: 16-04-2024 15:39:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__tbl_Acti__7FD1B87744AAB932] UNIQUE NONCLUSTERED 
(
	[Activity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 16-04-2024 15:39:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Admin_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Events]    Script Date: 16-04-2024 15:39:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Event_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 16-04-2024 15:39:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__User_Tab__4C70A05C277206EC] UNIQUE NONCLUSTERED 
(
	[User_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
