USE [Event_Handling]
GO
/****** Object:  Table [dbo].[tbl_Activities]    Script Date: 16-05-2024 13:08:35 ******/
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
/****** Object:  Table [dbo].[tbl_Admins]    Script Date: 16-05-2024 13:08:35 ******/
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
/****** Object:  Table [dbo].[tbl_Events]    Script Date: 16-05-2024 13:08:35 ******/
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
/****** Object:  Table [dbo].[tbl_Otp]    Script Date: 16-05-2024 13:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Otp](
	[Otp_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Otp] [varchar](6) NOT NULL,
	[Otp_Datetime] [varchar](19) NOT NULL,
 CONSTRAINT [PK_tbl_Otp] PRIMARY KEY CLUSTERED 
(
	[Otp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OtpExceed]    Script Date: 16-05-2024 13:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OtpExceed](
	[Temp_Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Free_Time] [varchar](19) NOT NULL,
 CONSTRAINT [PK_tbl_OtpExceed] PRIMARY KEY CLUSTERED 
(
	[Temp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Template]    Script Date: 16-05-2024 13:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Template](
	[Template_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Template_Name] [varchar](255) NOT NULL,
	[Template_Subject] [varchar](255) NOT NULL,
	[Template_Body] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Template_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 16-05-2024 13:08:35 ******/
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

INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (4, N'Diwali', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-15' AS Date), N'C:\EventApiPub\Diwali.png', N'let''s go', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (5, N'Dashera', CAST(N'2024-05-08' AS Date), CAST(N'2024-05-15' AS Date), N'C:\EventApiPub\Dashera.png', N'Burai par a6ai ki jit', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (6, N'Holi', CAST(N'2024-05-17' AS Date), CAST(N'2024-05-25' AS Date), N'C:\EventApiPub\Holi.png', N'Holi he!!!!!!!!!!!!!!!!!!!', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (7, N'Navaratri', CAST(N'2024-06-12' AS Date), CAST(N'2024-06-20' AS Date), N'C:\EventApiPub\Navaratri.png', N'Navaratri', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (8, N'Baishakhi', CAST(N'2024-05-15' AS Date), CAST(N'2024-05-16' AS Date), N'C:\EventApiPub\Baishakhi.png', N'Baishakhi', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (9, N'Ganesh Chaturthi', CAST(N'2024-05-09' AS Date), CAST(N'2024-05-11' AS Date), N'C:\EventApiPub\Ganesh Chaturthi.png', N'Ganesh chaturhti', 1)
INSERT [dbo].[tbl_Events] ([Event_Id], [Event_Name], [Event_Start_Date], [Event_End_Date], [Event_Image], [Event_Description], [isActive]) VALUES (10, N'GudiPadva', CAST(N'2024-05-17' AS Date), CAST(N'2024-05-25' AS Date), N'C:\EventApiPub\GudiPadva.png', N'GudiPadva', 1)
SET IDENTITY_INSERT [dbo].[tbl_Events] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Otp] ON 

INSERT [dbo].[tbl_Otp] ([Otp_Id], [Email], [Otp], [Otp_Datetime]) VALUES (27, N'riyawali123@gmail.com', N'636901', N'2024-05-16 13:00:28')
SET IDENTITY_INSERT [dbo].[tbl_Otp] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Template] ON 

INSERT [dbo].[tbl_Template] ([Template_Id], [Template_Name], [Template_Subject], [Template_Body]) VALUES (1, N'OTP', N'One Time Password', N'<!doctype html>
<html xmlns=http://www.w3.org/1999/xhtml xmlns:o=urn:schemas-microsoft-com:office:office style="font-family:arial,helvetica neue,helvetica,sans-serif">
<head>
<meta content="width=device-width,initial-scale=1" name=viewport>
<meta charset=UTF-8>
<meta name=x-apple-disable-message-reformatting>
<meta http-equiv=X-UA-Compatible content="IE=edge">
<meta content="telephone=no" name=format-detection>
<link href=https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css rel=stylesheet integrity=sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH crossorigin=anonymous>
<title>Event Manager</title><!--[if (mso 16)]>
    <style type="text/css">
    a {text-decoration: none;}
    </style>
    <![endif]--><!--[if gte mso 9]><style>sup { font-size: 100% !important; }</style><![endif]--><!--[if gte mso 9]>
<xml>
    <o:OfficeDocumentSettings>
    <o:AllowPNG></o:AllowPNG>
    <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
</xml>
<![endif]-->
<style>.ft-text{font-size:11px!important;line-height:16px!important}tbody,td,tfoot,th,thead,tr{background-color:#e3dceb}@media only screen and (max-width:400px){.ftwdt{width:180px!important}}#outlook a{padding:0}.es-button{mso-style-priority:100!important;text-decoration:none!important}a[x-apple-data-detectors]{color:inherit!important;text-decoration:none!important;font-size:inherit!important;font-family:inherit!important;font-weight:inherit!important;line-height:inherit!important}.es-desk-hidden{display:none;float:left;overflow:hidden;width:0;max-height:0;line-height:0;mso-hide:all}@media only screen and (max-width:600px){a,ol li,p,ul li{line-height:150%!important}h1,h1 a,h2,h2 a,h3,h3 a{line-height:120%}h1{font-size:30px!important;text-align:left}h2{font-size:24px!important;text-align:left}h3{font-size:20px!important;text-align:left}.es-content-body h1 a,.es-footer-body h1 a,.es-header-body h1 a{font-size:30px!important;text-align:left}.es-content-body h2 a,.es-footer-body h2 a,.es-header-body h2 a{font-size:24px!important;text-align:left}.es-content-body h3 a,.es-footer-body h3 a,.es-header-body h3 a{font-size:20px!important;text-align:left}.es-menu td a{font-size:14px!important}.es-header-body a,.es-header-body ol li,.es-header-body p,.es-header-body ul li{font-size:14px!important}.es-content-body a,.es-content-body ol li,.es-content-body p,.es-content-body ul li{font-size:14px!important}.es-footer-body a,.es-footer-body ol li,.es-footer-body p,.es-footer-body ul li{font-size:11px!important}.es-infoblock a,.es-infoblock ol li,.es-infoblock p,.es-infoblock ul li{font-size:14px!important}[class=gmail-fix]{display:none!important}.es-m-txt-c,.es-m-txt-c h1,.es-m-txt-c h2,.es-m-txt-c h3{text-align:center!important}.es-m-txt-r,.es-m-txt-r h1,.es-m-txt-r h2,.es-m-txt-r h3{text-align:right!important}.es-m-txt-l,.es-m-txt-l h1,.es-m-txt-l h2,.es-m-txt-l h3{text-align:left!important}.es-m-txt-c img,.es-m-txt-l img,.es-m-txt-r img{display:inline!important}.es-button-border{display:inline-block!important}a.es-button,button.es-button{font-size:18px!important;display:inline-block!important}.es-adaptive table,.es-left,.es-right{width:100%!important}.es-content,.es-content table,.es-footer,.es-footer table,.es-header,.es-header table{width:100%!important;max-width:600px!important}.es-adapt-td{display:block!important;width:100%!important}.adapt-img{width:100%!important;height:auto!important}.es-m-p0{padding:0!important}.es-m-p0r{padding-right:0!important}.es-m-p0l{padding-left:0!important}.es-m-p0t{padding-top:0!important}.es-m-p0b{padding-bottom:0!important}.es-m-p20b{padding-bottom:20px!important}.es-hidden,.es-mobile-hidden{display:none!important}table.es-desk-hidden,td.es-desk-hidden,tr.es-desk-hidden{width:auto!important;overflow:visible!important;float:none!important;max-height:inherit!important;line-height:inherit!important}tr.es-desk-hidden{display:table-row!important}table.es-desk-hidden{display:table!important}td.es-desk-menu-hidden{display:table-cell!important}.es-menu td{width:1%!important}.esd-block-html table,table.es-table-not-adapt{width:auto!important}table.es-social{display:inline-block!important}table.es-social td{display:inline-block!important}.es-desk-hidden{display:table-row!important;width:auto!important;overflow:visible!important;max-height:inherit!important}.es-m-p5{padding:5px!important}.es-m-p5t{padding-top:5px!important}.es-m-p5b{padding-bottom:5px!important}.es-m-p5r{padding-right:5px!important}.es-m-p5l{padding-left:5px!important}.es-m-p10{padding:10px!important}.es-m-p10t{padding-top:10px!important}.es-m-p10b{padding-bottom:10px!important}.es-m-p10r{padding-right:10px!important}.es-m-p10l{padding-left:10px!important}.es-m-p15{padding:15px!important}.es-m-p15t{padding-top:15px!important}.es-m-p15b{padding-bottom:15px!important}.es-m-p15r{padding-right:15px!important}.es-m-p15l{padding-left:15px!important}.es-m-p20{padding:20px!important}.es-m-p20t{padding-top:20px!important}.es-m-p20r{padding-right:20px!important}.es-m-p20l{padding-left:20px!important}.es-m-p25{padding:25px!important}.es-m-p25t{padding-top:25px!important}.es-m-p25b{padding-bottom:25px!important}.es-m-p25r{padding-right:25px!important}.es-m-p25l{padding-left:25px!important}.es-m-p30{padding:30px!important}.es-m-p30t{padding-top:30px!important}.es-m-p30b{padding-bottom:30px!important}.es-m-p30r{padding-right:30px!important}.es-m-p30l{padding-left:30px!important}.es-m-p35{padding:35px!important}.es-m-p35t{padding-top:35px!important}.es-m-p35b{padding-bottom:35px!important}.es-m-p35r{padding-right:35px!important}.es-m-p35l{padding-left:35px!important}.es-m-p40{padding:40px!important}.es-m-p40t{padding-top:40px!important}.es-m-p40b{padding-bottom:40px!important}.es-m-p40r{padding-right:40px!important}.es-m-p40l{padding-left:40px!important}}</style>
</head>
<body style="width:100%;font-family:arial,helvetica neue,helvetica,sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:50px">
<div class=es-wrapper-color style=background-color:#f6f6f6><!--[if gte mso 9]>
			<v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">
				<v:fill type="tile" color="#f6f6f6"></v:fill>
			</v:background>
		<![endif]-->
<table class=es-wrapper width=100% cellspacing=0 cellpadding=0 style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;background-color:#f6f6f6">
<tr>
<td valign=top style=padding:0;Margin:0>
<table class=es-header cellspacing=0 cellpadding=0 align=center style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed!important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top">
<tr>
<td align=center bgcolor=#e3dceb style=padding:0;Margin:0;background-color:#e3dceb>
<table class=es-header-body cellspacing=0 cellpadding=0 bgcolor=#e3dceb align=center style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#e3dceb;width:600px>
<tr>
<td align=left style=padding:0;Margin:0;background-color:#e3dceb>
<table cellspacing=0 cellpadding=0 width=100% style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#e3dceb>
<tr style=background-color:#e3dceb>
<td class=es-m-p0r valign=top align=center style=padding:0;Margin:0;width:600px>
<table width=100% cellspacing=0 cellpadding=0 style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;border-left:1px solid #ccc" role=presentation>
<tr>
<td align=center style=padding:0;Margin:0;font-size:0px><img class=adapt-img src=[HEADERLOGO] alt style=display:block;border:0;outline:0;text-decoration:none;-ms-interpolation-mode:bicubic width=598></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table class=es-content cellspacing=0 cellpadding=0 align=center style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed!important;width:100%>
<tr>
<td align=center bgcolor=#ffffff style=padding:0;Margin:0;background-color:#fff>
<table class=es-content-body cellspacing=0 cellpadding=0 bgcolor=#ffffff align=center style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#fff;border-right:1px solid #ccc;border-left:1px solid #ccc;width:600px">
<tr>
<td align=left style="padding:0;Margin:0;padding-top:20px;padding-left:30px;padding-right:30px;border:2px solid #8c5480;border-bottom:0">
<table width=100% cellspacing=0 cellpadding=0 style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px>
<tr>
<td valign=top align=center style=padding:0;Margin:0;width:538px>
<table width=100% cellspacing=0 cellpadding=0 role=presentation style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
<b>Dear User,</b>
</p>
</td>
</tr>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
Welcome to Event Management.</p>
</td>
</tr>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
Thank you for choosing us.</p>
</td>
</tr>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
To ensure the security of your account we require you to verify your email address.</p>
</td>
</tr>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
Here is your OTP.</p>
</td>
</tr>
<tr>
<td align=center>
<h2 style="background-color:#8c5480;margin:0 auto;width:max-content;padding:2px 10px;color:#fff;border-radius:4px">
[OTP]</h2>
</td>
</tr>
<tr>
<td align=left style=padding-top:20px;Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
OTP is valid for 3 minutes.</p>
</td>
</tr>
<tr>
<td align=left style=Margin:0;padding-bottom:10px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
Looking forward to always offering you the best of our services,</p>
</td>
</tr>
<tr>
<td align=left style=padding:0;Margin:0;padding-bottom:25px>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:23px;color:#333;font-size:15px">
<strong>Event Management</strong>
</p>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table class=es-content cellspacing=0 cellpadding=0 align=center style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed!important;width:100%>
</table>
<table cellpadding=0 cellspacing=0 class=es-content align=center style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed!important;width:100%>
<tr>
<td align=center bgcolor=#ffffff style=padding:0;Margin:0;background-color:#fff>
<table bgcolor=#ffffff class=es-content-body align=center cellpadding=0 cellspacing=0 style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#fff;border-right:1px solid #ccc;border-left:1px solid #ccc;width:600px">
<tr>
<td class=esdev-adapt-off align=left bgcolor=#6a146b style=padding:0;Margin:0;padding-bottom:10px;padding-top:20px;background-color:#8c5480>
<table cellpadding=0 cellspacing=0 class=esdev-mso-table style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;width:598px>
<tr>
<td style=padding:0;Margin:0;width:10px></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table cellpadding=0 cellspacing=0 class=es-footer align=center style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed!important;width:100%;background-color:transparent;background-repeat:repeat;background-position:center top">
<tr>
<td align=center bgcolor=#ffffff style=padding:0;Margin:0;background-color:#fff>
<table bgcolor=#ffffff class=es-footer-body align=center cellpadding=0 cellspacing=0 style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#fff;border-right:1px solid #ccc;border-left:1px solid #ccc;width:600px;border-bottom:1px solid #ccc">
<tr>
<td align=left bgcolor=#6a146b style=padding:0;Margin:0;padding-bottom:15px;padding-left:20px;padding-right:20px;background-color:#8c5480>
<table cellpadding=0 cellspacing=0 width=100% style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px>
<tr>
<td align=center valign=top style=padding:0;Margin:0;width:558px>
<table cellpadding=0 cellspacing=0 width=100% role=presentation style=mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px>
<tr>
<td align=left style=padding:0;Margin:0;background-color:#8c5480>
<p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial,helvetica neue,helvetica,sans-serif;line-height:17px;color:#fff;font-size:11px">
<em><span style=font-size:11px><strong>Disclaimer:</strong><br>Terms and conditions of Event Management apply.Please do not share OTP with anyone. If you did not request this OTP, Please ignore this mail</span></em>
</p>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>')
SET IDENTITY_INSERT [dbo].[tbl_Template] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (1, N'Dhaval Surela', N'dhavalsurela4@gmail.com', N'Memnagar', N'Riya@123', N'9313695901', 1, CAST(N'2024-05-15T18:38:31.670' AS DateTime), NULL)
INSERT [dbo].[tbl_Users] ([User_Id], [User_Name], [User_Email], [User_Address], [User_Password], [User_Mobile], [IsActive], [Created_DateTime], [Updated_Datetime]) VALUES (2, N'Riya Wali', N'riyawali123@gmail.com', N'Chandkheda', N'Riya@123', N'6006324050', 1, CAST(N'2024-05-16T13:01:42.893' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Acti__7FD1B87744AAB932]    Script Date: 16-05-2024 13:08:35 ******/
ALTER TABLE [dbo].[tbl_Activities] ADD  CONSTRAINT [UQ__tbl_Acti__7FD1B87744AAB932] UNIQUE NONCLUSTERED 
(
	[Activity_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Admi__6066AA65F206B3ED]    Script Date: 16-05-2024 13:08:35 ******/
ALTER TABLE [dbo].[tbl_Admins] ADD UNIQUE NONCLUSTERED 
(
	[Admin_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Even__C46EAE6E21C5508F]    Script Date: 16-05-2024 13:08:35 ******/
ALTER TABLE [dbo].[tbl_Events] ADD  CONSTRAINT [UQ__tbl_Even__C46EAE6E21C5508F] UNIQUE NONCLUSTERED 
(
	[Event_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User_Tab__4C70A05C277206EC]    Script Date: 16-05-2024 13:08:35 ******/
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
