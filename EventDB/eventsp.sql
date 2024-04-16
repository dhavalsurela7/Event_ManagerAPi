USE [Event_Handling]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivityOperation]    Script Date: 09-04-2024 15:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[sp_ActivityOperation] @flag VARCHAR(255),
                                 @Activity_Name VARCHAR(255),
								 @Activity_Description varchar(MAX),								
                                 @Activity_Start_Datetime datetime,
								 @Activity_End_Datetime datetime,
								 @Activity_Price decimal(10,2),
								 @Event_Name varchar(255)
AS
  BEGIN
      IF @flag = 'INSERT'
        BEGIN
            INSERT INTO tbl_Activities([Activity_Name],[Activity_Description],[Activity_Start_Datetime],[Activity_End_Datetime],[Event_Name])
			VALUES (@Activity_Name,@Activity_Description,@Activity_Start_Datetime,@Activity_End_Datetime,@Event_Name)
			SELECT '200|Activity added successfully' as [Message]
        END
    
	  ELSE IF @flag = 'SELECTNAME'
        BEGIN
            SELECT Activity_Name 
			FROM tbl_Activities
			WHERE Event_Name = @Event_Name
        END
	  ELSE IF @flag = 'SELECT'
        BEGIN
            SELECT [Activity_Name],[Activity_Description],[Activity_Start_Datetime],[Activity_End_Datetime],[Activity_Price]
			FROM tbl_Activities
			WHERE Event_Name = @Event_Name
        END
	  ELSE IF @flag = 'SETPRICE'
        BEGIN
            UPDATE tbl_Activities
			SET Activity_Price = @Activity_Price
			WHERE Activity_Name = @Activity_Name
			SELECT '200|Price added successfully' as [Message]
        END
	  ELSE
		BEGIN
			SELECT '400|Invalid flag' as [Message]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_Adminlogin]    Script Date: 09-04-2024 15:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Adminlogin] @flag          VARCHAR(255),
                                 @Admin_Name     VARCHAR(255),
                                 @Admin_Email    VARCHAR(320),
                                 @Admin_Address  VARCHAR(max),
                                 @Admin_Password VARCHAR(255),
								 @Admin_Mobile nchar(10)
AS
  BEGIN
      IF @flag = 'login'
        BEGIN
            IF (SELECT Count([Admin_Id])
                FROM   [tbl_Admins]
                WHERE  Admin_Email = @Admin_Email
                       AND Admin_Password = @Admin_Password) > 0
              BEGIN
                  SELECT '200|Login Success' AS [Message]
                         
              END
            ELSE
              BEGIN
                  SELECT '400|Invalid Credentials' AS [Message]
              END
        END
	  ELSE 
		BEGIN
			 SELECT '400|Invalid flag' AS [Message]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_EventOperation]    Script Date: 09-04-2024 15:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_EventOperation] @flag          VARCHAR(255),
                                 @Event_Name     VARCHAR(255),
                                 @Event_Start_Date date,
								 @Event_End_Date date,
								 @Event_Image varchar(MAX),
								 @Event_Description varchar(MAX)
AS
  BEGIN
      IF @flag = 'INSERT'
        BEGIN
            INSERT INTO tbl_Events([Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Image],[Event_Description])
			VALUES (@Event_Name,@Event_Start_Date,@Event_End_Date,@Event_Image,@Event_Description)
			SELECT '200|Event added successfully' as [Message]
        END
      ELSE IF @flag = 'PUBLISH'
        BEGIN
            UPDATE tbl_Events set isActive = 1
			WHERE Event_Name = @Event_Name
			SELECT '200|Event published successfully' as [Message]
        END
	  ELSE IF @flag = 'SELECTNAME'
        BEGIN
            SELECT Event_Name 
			FROM tbl_Events
        END
	  ELSE IF @flag = 'SELECT'
        BEGIN
            SELECT [Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Image],[Event_Description] 
			FROM tbl_Events
			WHERE [Event_End_Date] >= GETDATE() and isActive = 1
        END
	  ELSE IF @flag = 'SELECTONE'
        BEGIN
            SELECT [Event_Name],[Event_Start_Date],[Event_End_Date],[Event_Image],[Event_Description] 
			FROM tbl_Events
			WHERE Event_Name = @Event_Name
        END
	  ELSE
		BEGIN
			SELECT '400|Invalid flag' as [Message]
		END
  END 
GO
/****** Object:  StoredProcedure [dbo].[sp_UserOperation]    Script Date: 09-04-2024 15:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserOperation] @flag          VARCHAR(255),
                                 @User_Name     VARCHAR(255),
                                 @User_Email    VARCHAR(320),
                                 @User_Address  VARCHAR(max),
                                 @User_Password VARCHAR(255),
								 @User_Mobile nchar(10)
AS
  BEGIN
      IF @flag = 'login'
        BEGIN
            IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email
                       AND user_password = @User_Password) > 0
              BEGIN
                  SELECT '200|Login Success' AS [Message],
                         [User_Id]  AS t
                  FROM   [tbl_Users]
                  WHERE  user_email = @User_Email
                         AND user_password = @User_Password
              END
            ELSE
              BEGIN
                  SELECT '400|Invalid Credentials' AS [Message]
              END
        END
      ELSE IF @flag = 'register'
        BEGIN
            IF (SELECT Count([User_Id])
                FROM   [tbl_Users]
                WHERE  user_email = @User_Email) = 0
              BEGIN
                  INSERT INTO [tbl_Users]
                              ([user_name],[user_email],[user_address],[user_password],[User_Mobile],[Created_DateTime])
                  VALUES      (@User_Name,@User_Email,@User_Address,@User_Password,@User_Mobile,Getdate())
				  SELECT '200|Registration Success' AS [Message]
              END
            ELSE
              BEGIN
                  SELECT '400|User already exists' AS [Message]
              END
        END
	  ELSE 
		BEGIN
			 SELECT '400|Error in Registration => User already exists' AS [Message]
		END
  END 
GO
