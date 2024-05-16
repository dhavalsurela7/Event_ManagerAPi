USE [Event_Handling]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivityOperation]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Author:           <Author,Dhaval>
--this sp is used for insert, update price, select name, select operations on Activities
CREATE   PROC [dbo].[sp_ActivityOperation] 
@flag VARCHAR(255),
@Activity_Name VARCHAR(255),
@Activity_Description varchar(MAX),								
@Activity_Start_Datetime datetime,
@Activity_End_Datetime datetime,
@Activity_Price decimal(10,2),
@Event_Id bigint
AS
  BEGIN
      IF @flag = 'INSERT'
        BEGIN
            INSERT INTO tbl_Activities([Activity_Name],[Activity_Description],[Activity_Start_Datetime],[Activity_End_Datetime],[Event_Id])
			VALUES (@Activity_Name,@Activity_Description,@Activity_Start_Datetime,@Activity_End_Datetime,@Event_Id)
			SELECT 'ACTIVITY ADDED SUCCESFULLY' as [Message],'200' as[Code]
        END
	  ELSE IF @flag = 'SELECTNAME'
        BEGIN
            SELECT Activity_Name 
			FROM tbl_Activities
			WHERE Event_Id = @Event_Id
        END
	  ELSE IF @flag = 'SELECT'
        BEGIN
            SELECT [Activity_Name],[Activity_Description],[Activity_Start_Datetime],[Activity_End_Datetime],[Activity_Price]
			FROM tbl_Activities
			WHERE Event_Id = @Event_Id
        END
	  ELSE IF @flag = 'SETPRICE'
        BEGIN
            UPDATE tbl_Activities
			SET Activity_Price = @Activity_Price
			WHERE Activity_Name = @Activity_Name
			SELECT 'PRICE ADDED SUCCESFULLY' as [Message],'200' as[Code]
        END
	  ELSE
		BEGIN
			SELECT 'INVALID FLAG' as [Message],'400' as[Code]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Adminlogin]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Name : Dhaval Surela
--Date : 03/04/2024
--Login User if email and password combination exists
CREATE PROC [dbo].[sp_Adminlogin] 
@flag VARCHAR(255),
@Admin_Name VARCHAR(255),
@Admin_Email VARCHAR(320),
@Admin_Address VARCHAR(max),
@Admin_Password VARCHAR(255),
@Admin_Mobile NCHAR(10)
AS
  BEGIN
      IF @flag = 'LOGIN'
        BEGIN
            IF (SELECT Count([Admin_Id])
                FROM   [tbl_Admins]
                WHERE  Admin_Email = @Admin_Email
                       AND Admin_Password = @Admin_Password) > 0
              BEGIN
                  SELECT 'LOGIN SUCCESS' AS [Message],'200' as[Code]
                         
              END
			ELSE IF (SELECT Count([Admin_Id])
                FROM   [tbl_Admins]
                WHERE  Admin_Email = @Admin_Email
                       AND Admin_Password <> @Admin_Password) > 0
              BEGIN
                  SELECT 'INVALID PASSWORD' AS [Message],'400' as[Code]
                         
              END
            ELSE
              BEGIN
                  SELECT 'ADMIN DOES NOT EXISTS' AS [Message],'404' as[Code]
              END
        END
	  ELSE 
		BEGIN
			 SELECT 'INVALID FLAG' AS [Message],'400' as[Code]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Chart]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Chart]
@Flag VARCHAR(10)
AS
BEGIN
declare @Count INT
if @Flag = 'Monthwise'
begin
select @Count = COUNT(Event_Id) from tbl_Events where   Event_End_Date >=CONVERT(date, GETDATE()) AND IsActive = 1 
if @Count = 0
begin
select 'DO not have any Events' as [Message], 0 as Code
return
end
select 'Fetched Successfully' as [Message], 1 as Code
select MONTH(Event_Start_Date) as Month,Count(Event_Id) as Count 
from (select * from tbl_Events 
where  Event_End_Date >=CONVERT(date, GETDATE()) AND IsActive = 1 ) EventTbl 
group by MONTH(Event_Start_Date)
end 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EventOperation]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Name : Dhaval Surela
--Date : 03/04/2024
--this sp is used to perform all events operations like insert, update, publish, delete, select
CREATE PROC [dbo].[sp_EventOperation] 
@flag VARCHAR(255),
@Event_Name VARCHAR(255),
@Event_Start_Date DATE,
@Event_End_Date DATE,
@Event_Image VARCHAR(MAX),
@Event_Description VARCHAR(MAX),
@New_Event_Name VARCHAR(255),
@Event_Id bigint
AS
  BEGIN
      IF @flag = 'INSERT'
        BEGIN
            INSERT INTO tbl_Events([Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Image],[Event_Description])
			VALUES (@Event_Name,@Event_Start_Date,@Event_End_Date,@Event_Image,@Event_Description)
			SELECT 'EVENT ADDED SUCCESSFULLY' as [Message],'200' as[Code]
        END
	 ELSE IF @flag = 'UPDATE'
        BEGIN
		IF @Event_Image is Not Null
			BEGIN
				UPDATE tbl_Events
				SET Event_Name = @New_Event_Name,
				Event_Description=@Event_Description,
				Event_Start_Date = @Event_Start_Date,
				Event_End_Date = @Event_End_Date,
				Event_Image = @Event_Image
				WHERE Event_Name = @Event_Name
				DELETE FROM tbl_Activities
				WHERE Event_Id = @Event_Id and (Activity_Start_Datetime >= @Event_Start_Date or Activity_End_Datetime <= @Event_End_Date)
				SELECT 'EVENT UPADATED SUCCESSFULLY' as [Message],'200' as[Code]
			END
		ELSE
			BEGIN
				UPDATE tbl_Events
				SET Event_Name = @New_Event_Name,
				Event_Description=@Event_Description,
				Event_Start_Date = @Event_Start_Date,
				Event_End_Date = @Event_End_Date
				WHERE Event_Name = @Event_Name
				DELETE FROM tbl_Activities
				WHERE Event_Id = @Event_Id and (Activity_Start_Datetime > @Event_Start_Date or Activity_End_Datetime < @Event_End_Date)
				SELECT 'EVENT UPADATED SUCCESSFULLY' as [Message],'200' as[Code]
			END
        END
      ELSE IF @flag = 'PUBLISH'
        BEGIN
            UPDATE tbl_Events set isActive = 1
			WHERE Event_Name = @Event_Name
			SELECT 'EVENT PUBLISHED SUCCESSFULLY' as [Message],'200' as[Code]
        END
	  ELSE IF @flag = 'UNPUBLISH'
        BEGIN
            UPDATE tbl_Events set isActive = 0
			WHERE Event_Name = @Event_Name
			SELECT 'EVENT UNPUBLISHED SUCCESSFULLY' as [Message],'200' as[Code]
        END
	 ELSE IF @flag = 'DELETE'
        BEGIN
            DELETE FROM tbl_Events 
			WHERE Event_Name = @Event_Name
			SELECT 'EVENT DELETED SUCCESSFULLY' as [Message],'200' as[Code]
        END
	  ELSE IF @flag = 'SELECTNAME'
        BEGIN
            SELECT Event_Name,Event_Start_Date,Event_End_Date,Event_Id
			FROM tbl_Events
			WHERE isActive = 0
			ORDER BY [Event_Start_Date] ASC
        END
	  ELSE IF @flag = 'SELECT'
        BEGIN
            SELECT [Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Image],[Event_Description],Event_Id
			FROM tbl_Events
			WHERE [Event_End_Date] >= GETDATE() and isActive = 1
			ORDER BY [Event_Start_Date] ASC
        END
	 ELSE IF @flag = 'SELECTALL'
        BEGIN
            SELECT [Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Description],[isActive],[Event_Image],[Event_Id] 
			FROM tbl_Events
			ORDER BY [Event_Start_Date] ASC
        END
	 ELSE IF @flag = 'SELECTONGOING'
        BEGIN
            SELECT [Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Description] 
			FROM tbl_Events
			WHERE GETDATE() BETWEEN Event_Start_Date AND Event_End_Date and isActive = 1
			ORDER BY [Event_Start_Date] ASC
        END
	  ELSE
		BEGIN
			SELECT 'INVALID FLAG' as [Message],'400' as[Code]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTemplate]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTemplate]
@Name VARCHAR(255)
AS
 BEGIN
	SELECT [Template_Name],[Template_Subject],[Template_Body] 
	FROM tbl_Template 
	WHERE Template_Name = @Name
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_SendOtp]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_SendOtp  '9313695901'
CREATE PROC [dbo].[sp_SendOtp] 
@Email VARCHAR(320)
AS
DECLARE @OTP VARCHAR(6)
DECLARE @CurrentTime VARCHAR(19)
SET @CurrentTime = (SELECT CONVERT(VARCHAR,GETDATE(),120))
BEGIN
	 DELETE FROM tbl_Otp WHERE (select DATEDIFF(SECOND , Otp_Datetime,@CurrentTime )) > 180
	 DELETE FROM tbl_OtpExceed WHERE @CurrentTime > DATEADD(MINUTE,15,Free_Time)
	IF (SELECT COUNT(Otp_Id) FROM tbl_Otp WHERE Email = @Email) < 3 
		AND (SELECT COUNT(Temp_Id) FROM tbl_OtpExceed WHERE Email = @Email) = 0
	 BEGIN
		SET @OTP = (SELECT FLOOR(RAND()*1000000-1))
		INSERT INTO tbl_Otp (Email,[Otp],[Otp_Datetime])
		VALUES (@Email,@OTP,@CurrentTime)
		SELECT @OTP AS OTP, '200' AS CODE
	 END
	ELSE
	 BEGIN
		SELECT  '400' AS CODE
		IF (SELECT COUNT(Temp_Id) FROM tbl_OtpExceed WHERE Email = @Email) = 0
		 BEGIN
			INSERT INTO tbl_OtpExceed (Email,Free_Time)
			VALUES (@Email,@CurrentTime)
		 END
	 END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserOperation]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Name : Dhaval Surela
--Date : 03/04/2024
--this sp is used for user registration and login
CREATE PROC [dbo].[sp_UserOperation] 
@flag VARCHAR(255),
@User_Name VARCHAR(255),
@User_Email VARCHAR(320),
@User_Address VARCHAR(max),
@User_Password VARCHAR(255),
@User_Mobile NCHAR(10)
AS
  BEGIN
      IF @flag = 'LOGIN'
        BEGIN
            IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email
                       AND user_password = @User_Password) > 0
              BEGIN
                  SELECT 'LOGIN SUCCESS' AS [Message],'200' as[Code]
              END
            ELSE IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email
                       AND user_password <> @User_Password) > 0
              BEGIN
                  SELECT 'INVALID PASSWORD' AS [Message],'400' as[Code]
              END
			ELSE 
			  BEGIN
				  SELECT 'USER DOES NOT EXISTS' AS [Message],'404' as[Code]
			  END	
        END
      ELSE IF @flag = 'REGISTER'
        BEGIN
            IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email) = 0
              BEGIN
                  INSERT INTO [tbl_Users]
                              ([user_name],[user_email],[user_address],[user_password],[User_Mobile],[Created_DateTime])
                  VALUES      (@User_Name,@User_Email,@User_Address,@User_Password,@User_Mobile,Getdate())
				  SELECT 'REGISTRATION SUCCESSFULL' AS [Message],'200' as[Code]
              END
            ELSE
              BEGIN
                  SELECT 'USER ALREDY EXISTS' AS [Message],'400' as[Code]
              END
        END
	  ELSE IF @flag = 'EXIST'
        BEGIN
            IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email) > 0
              BEGIN
				  SELECT 'USER EXISTS' AS [Message],'200' as[Code]
              END
            ELSE
              BEGIN
                  SELECT 'USER DOES NOT EXISTS' AS [Message],'400' as[Code]
              END
        END
	  ELSE IF @flag = 'RESET'
        BEGIN
			UPDATE tbl_Users
			SET User_Password = @User_Password
			SELECT 'PASSWORD RESET' AS [Message],'200' as[Code]
        END
	  ELSE 
		BEGIN
			 SELECT 'INVALID FLAG' AS [Message],'400' as[Code]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_VerifyOtp]    Script Date: 16-05-2024 17:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- sp_VerifyOtp '9313695901','258590'

CREATE PROC [dbo].[sp_VerifyOtp]
@Email VARCHAR(320),
@Otp VARCHAR(6)
AS
DECLARE @CurrentTime VARCHAR(19)
SET @CurrentTime = (select convert(varchar,getDate(),120))  
 BEGIN
	DELETE FROM tbl_Otp WHERE (select datediff(second , Otp_Datetime,@CurrentTime )) > 180
	IF (SELECT TOP 1 Otp FROM tbl_Otp WHERE Email = @Email ORDER BY Otp_Id DESC ) = @Otp
	 BEGIN
		SELECT 'OTP VERIFIED' AS [Message], '200' AS [Code]
	 END
	ELSE
	 BEGIN
		SELECT 'OTP NOT VERIFIED' AS [Message], '400' AS [Code]
	 END
 END
GO
