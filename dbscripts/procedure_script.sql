USE [outreachpms]
GO
/****** Object:  StoredProcedure [dbo].[DuplicateCheckForPerformanceBulkUpload]    Script Date: 3/17/2019 1:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DuplicateCheckForPerformanceBulkUpload] 
@SchoolId INT,
@ClassId INT,
@day INT,
@month INT, 
@year INT  AS

BEGIN

	DELETE SDP FROM studentdailyperformance SDP
	JOIN studentschoolmap SSM ON SDP.studentschoolmapid = SSM.studentschoolmapid
	WHERE SDP.[day] = @day AND SDP.[monthid] = @month  AND SDP.[yearid] = @year 
	AND SSM.classid = @ClassId AND SSM.schoolid = @SchoolId
	
	SELECT 1 AS ReturnVal

END



GO
/****** Object:  StoredProcedure [dbo].[GetDataForExcelUpload]    Script Date: 3/17/2019 1:21:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetDataForExcelUpload] 
@SchoolName varchar(100),
@Class varchar(20),
@Month varchar(20),
@Year varchar(20) AS

BEGIN

DECLARE @SchoolId INT
DECLARE @MonthId INT
DECLARE @YearId INT
DECLARE @ClassId INT

SET @SchoolId =(SELECT schoolid FROM school WHERE schoolname = @SchoolName)
SET @MonthId =(SELECT monthid FROM [month] WHERE [monthname] = @Month)
SET @ClassId =(SELECT classid FROM class WHERE classname = @Class)
SET @YearId =(SELECT yearid FROM performanceyear WHERE performanceyear = CAST(@Year AS INT))


SELECT @SchoolId as SchoolId,@MonthId as MonthId,@ClassId as ClassId,@YearId as YearId

END

GO
