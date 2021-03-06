USE [master]
GO
/****** Object:  Database [outreachpms]    Script Date: 3/16/2019 7:04:12 AM ******/
CREATE DATABASE [outreachpms]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'outreachpms', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\outreachpms.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'outreachpms_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\outreachpms_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [outreachpms] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [outreachpms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [outreachpms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [outreachpms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [outreachpms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [outreachpms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [outreachpms] SET ARITHABORT OFF 
GO
ALTER DATABASE [outreachpms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [outreachpms] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [outreachpms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [outreachpms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [outreachpms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [outreachpms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [outreachpms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [outreachpms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [outreachpms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [outreachpms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [outreachpms] SET  ENABLE_BROKER 
GO
ALTER DATABASE [outreachpms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [outreachpms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [outreachpms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [outreachpms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [outreachpms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [outreachpms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [outreachpms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [outreachpms] SET RECOVERY FULL 
GO
ALTER DATABASE [outreachpms] SET  MULTI_USER 
GO
ALTER DATABASE [outreachpms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [outreachpms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [outreachpms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [outreachpms] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'outreachpms', N'ON'
GO
USE [outreachpms]
GO
/****** Object:  Table [dbo].[city]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[cityid] [int] IDENTITY(1,1) NOT NULL,
	[cityname] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[class]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[class](
	[classid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[division]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[division](
	[divisionid] [int] IDENTITY(1,1) NOT NULL,
	[divisionname] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[divisionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[group]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[group](
	[groupid] [int] IDENTITY(1,1) NOT NULL,
	[schoolid] [int] NULL,
	[groupname] [varchar](255) NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[month]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[month](
	[monthid] [int] IDENTITY(1,1) NOT NULL,
	[monthname] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[monthid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parameter]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parameter](
	[parameterid] [int] IDENTITY(1,1) NOT NULL,
	[parametername] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[parameterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parameterschoolmap]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parameterschoolmap](
	[parameterschoolmapid] [int] IDENTITY(1,1) NOT NULL,
	[parameterid] [int] NULL,
	[schoolid] [int] NULL,
	[alterparameter] [varchar](255) NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[parameterschoolmapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[performanceyear]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[performanceyear](
	[yearid] [int] IDENTITY(1,1) NOT NULL,
	[performanceyear] [int] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[yearid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[school]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[school](
	[schoolid] [int] IDENTITY(1,1) NOT NULL,
	[schoolname] [nvarchar](50) NULL,
	[cityid] [int] NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[schoolid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[studentid] [int] IDENTITY(1,1) NOT NULL,
	[studentname] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[caste] [varchar](255) NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentdailyperformance]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentdailyperformance](
	[studentdailyperformanceid] [bigint] IDENTITY(1,1) NOT NULL,
	[studentschoolmapid] [int] NULL,
	[Attendance] [bit] NULL,
	[Discipline] [bit] NULL,
	[HomeWork] [bit] NULL,
	[day] [int] NULL,
	[monthid] [int] NULL,
	[yearid] [int] NULL,
	[created_on] [datetime] NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_studentdailyperformance] PRIMARY KEY CLUSTERED 
(
	[studentdailyperformanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[studentschoolmap]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studentschoolmap](
	[studentschoolmapid] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NULL,
	[schoolid] [int] NULL,
	[classid] [int] NULL,
	[divisionid] [int] NULL,
	[rollnumber] [varchar](255) NULL,
	[groupid] [int] NULL,
	[status] [bit] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentschoolmapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentteacher]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentteacher](
	[studentteacherid] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [int] NULL,
	[teacherid] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentteacherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teacher]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacher](
	[teacherid] [int] IDENTITY(1,1) NOT NULL,
	[teachername] [varchar](50) NULL,
	[schoolid] [int] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[teacherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/16/2019 7:04:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[roleid] [int] NULL,
	[schoolid] [int] NULL,
	[cityid] [int] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (1, N'Kochi', 1, CAST(0x0000AABD00000000 AS DateTime))
INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (2, N'Hyderabad', 1, CAST(0x0000AABD00000000 AS DateTime))
INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (3, N'Chennai', 1, CAST(0x0000AABD00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[city] OFF
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (1, N'I-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (2, N'II-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (3, N'III-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (4, N'IV-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (5, N'V-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (6, N'VI-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (7, N'VII-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (8, N'VIII-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (9, N'IX-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (10, N'X-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (11, N'XI-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (12, N'XII-A', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (13, N'I-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (14, N'II-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (15, N'III-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (16, N'IV-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (17, N'V-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (18, N'VI-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (19, N'VII-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (20, N'VIII-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (21, N'IX-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (22, N'X-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (23, N'XI-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (24, N'XII-B', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (25, N'I-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (26, N'II-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (27, N'III-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (28, N'IV-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (29, N'V-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (30, N'VI-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (31, N'VII-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (32, N'VIII-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (33, N'IX-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (34, N'X-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (35, N'XI-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (36, N'XII-C', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (37, N'I-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (38, N'II-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (39, N'III-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (40, N'IV-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (41, N'V-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (42, N'VI-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (43, N'VII-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (44, N'VIII-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (45, N'IX-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (46, N'X-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (47, N'XI-D', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[class] ([classid], [classname], [created_on]) VALUES (48, N'XII-D', CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[class] OFF
SET IDENTITY_INSERT [dbo].[group] ON 

INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (1, 1, N'Strawberry', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (2, 1, N'Apple', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (3, 1, N'Orange', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (4, 1, N'Grape', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (5, 1, N'Mango', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (6, 1, N'WaterMelon', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (7, 1, N'Guava', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (8, 1, N'Banana', 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[group] OFF
SET IDENTITY_INSERT [dbo].[month] ON 

INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (1, N'January', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (2, N'February', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (3, N'March', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (4, N'April', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (5, N'May', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (6, N'June', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (7, N'July', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (8, N'August', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (9, N'September', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (10, N'October', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (11, N'November', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[month] ([monthid], [monthname], [created_on]) VALUES (12, N'December', CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[month] OFF
SET IDENTITY_INSERT [dbo].[parameter] ON 

INSERT [dbo].[parameter] ([parameterid], [parametername], [created_on]) VALUES (1, N'Attendance', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[parameter] ([parameterid], [parametername], [created_on]) VALUES (2, N'Discipline', CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[parameter] ([parameterid], [parametername], [created_on]) VALUES (3, N'HomeWork', CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[parameter] OFF
SET IDENTITY_INSERT [dbo].[parameterschoolmap] ON 

INSERT [dbo].[parameterschoolmap] ([parameterschoolmapid], [parameterid], [schoolid], [alterparameter], [status], [created_on]) VALUES (1, 1, 1, NULL, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[parameterschoolmap] ([parameterschoolmapid], [parameterid], [schoolid], [alterparameter], [status], [created_on]) VALUES (2, 2, 1, NULL, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[parameterschoolmap] ([parameterschoolmapid], [parameterid], [schoolid], [alterparameter], [status], [created_on]) VALUES (3, 3, 1, NULL, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[parameterschoolmap] OFF
SET IDENTITY_INSERT [dbo].[performanceyear] ON 

INSERT [dbo].[performanceyear] ([yearid], [performanceyear], [created_on]) VALUES (1, 2019, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[performanceyear] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (1, N'Admin', CAST(0x0000A9FD00000000 AS DateTime))
INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (2, N'PMO', CAST(0x0000A9FD00000000 AS DateTime))
INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (3, N'POC', CAST(0x0000A9FD00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[school] ON 

INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (1, N'Thikkakkara Govt. High School', 1, 1, CAST(0x0000AA0B00000000 AS DateTime))
INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (2, N'Kakkanad Govt. High School', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (3, N'Kalamassery Govt. High School', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[school] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (1, N'Habeeb', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (2, N'Raju', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (3, N'John', N'M', N'Christian', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (4, N'Student0', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (5, N'Student1', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (6, N'Student2', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (7, N'Student3', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (8, N'Student4', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (9, N'Student6', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (10, N'Student7', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (11, N'Student8', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (12, N'Student9', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (13, N'Student10', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (14, N'Muhammed', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (15, N'Michael', N'M', N'Christian', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (16, N'George', N'M', N'Christian', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (17, N'Student11', N'F', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (18, N'Student12', N'M', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (19, N'Student13', N'F', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (20, N'Student14', N'F', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (21, N'Student15', N'F', N'Muslim', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (22, N'Student16', N'F', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (23, N'Student17', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (24, N'Student18', N'F', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (25, N'Student19', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[student] ([studentid], [studentname], [gender], [caste], [status], [created_on]) VALUES (26, N'Student20', N'M', N'Hindu', 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[studentdailyperformance] ON 

INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (1, 3, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (4, 3, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (5, 3, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (6, 3, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (7, 3, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (8, 3, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (11, 3, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (12, 3, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (13, 3, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (14, 3, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (15, 3, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (18, 3, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (19, 3, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (20, 3, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (21, 3, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (22, 3, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (25, 3, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (26, 3, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (27, 3, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (28, 3, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (29, 4, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (32, 4, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (33, 4, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (34, 4, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (35, 4, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (36, 4, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (39, 4, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (40, 4, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (41, 4, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (42, 4, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (43, 4, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (46, 4, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (47, 4, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (48, 4, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (49, 4, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (50, 4, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (53, 4, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (54, 4, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (55, 4, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (56, 4, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (57, 5, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (60, 5, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (61, 5, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (62, 5, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (63, 5, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (64, 5, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (67, 5, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (68, 5, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (69, 5, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (70, 5, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (71, 5, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (74, 5, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (75, 5, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (76, 5, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (77, 5, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (78, 5, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (81, 5, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (82, 5, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (83, 5, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (84, 5, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (85, 6, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (88, 6, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (89, 6, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (90, 6, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (91, 6, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (92, 6, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (95, 6, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (96, 6, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (97, 6, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (98, 6, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (99, 6, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (102, 6, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (103, 6, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (104, 6, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (105, 6, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (106, 6, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (109, 6, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (110, 6, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (111, 6, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (112, 6, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (113, 7, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (116, 7, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (117, 7, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (118, 7, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (119, 7, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (120, 7, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (123, 7, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (124, 7, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (125, 7, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (126, 7, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (127, 7, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (130, 7, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (131, 7, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (132, 7, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (133, 7, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (134, 7, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (137, 7, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (138, 7, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (139, 7, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
GO
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (140, 7, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (141, 8, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (144, 8, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (145, 8, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (146, 8, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (147, 8, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (148, 8, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (151, 8, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (152, 8, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (153, 8, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (154, 8, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (155, 8, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (158, 8, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (159, 8, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (160, 8, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (161, 8, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (162, 8, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (165, 8, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (166, 8, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (167, 8, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (168, 8, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (169, 9, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (172, 9, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (173, 9, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (174, 9, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (175, 9, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (176, 9, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (179, 9, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (180, 9, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (181, 9, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (182, 9, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (183, 9, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (186, 9, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (187, 9, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (188, 9, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (189, 9, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (190, 9, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (193, 9, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (194, 9, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (195, 9, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (196, 9, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (197, 10, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (200, 10, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (201, 10, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (202, 10, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (203, 10, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (204, 10, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (207, 10, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (208, 10, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (209, 10, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (210, 10, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (211, 10, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (214, 10, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (215, 10, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (216, 10, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (217, 10, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (218, 10, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (221, 10, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (222, 10, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (223, 10, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (224, 10, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (225, 11, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (228, 11, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (229, 11, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (230, 11, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (231, 11, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (232, 11, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (235, 11, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (236, 11, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (237, 11, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (238, 11, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (239, 11, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (242, 11, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (243, 11, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (244, 11, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (245, 11, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (246, 11, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (249, 11, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (250, 11, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (251, 11, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (252, 11, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (253, 12, 1, 1, 1, 1, 2, 1, NULL, 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (256, 12, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (257, 12, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (258, 12, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (259, 12, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (260, 12, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (263, 12, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (264, 12, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (265, 12, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (266, 12, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (267, 12, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (270, 12, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (271, 12, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (272, 12, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (273, 12, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (274, 12, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (277, 12, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (278, 12, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (279, 12, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
GO
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (280, 12, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (281, 13, 1, 1, 1, 1, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (284, 13, 1, 1, 1, 4, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (285, 13, 1, 1, 1, 5, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (286, 13, 1, 1, 1, 6, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (287, 13, 1, 1, 1, 7, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (288, 13, 1, 1, 1, 8, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (291, 13, 1, 1, 1, 11, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (292, 13, 1, 1, 1, 12, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (293, 13, 1, 1, 1, 13, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (294, 13, 1, 1, 1, 14, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (295, 13, 1, 1, 1, 15, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (298, 13, 1, 1, 1, 18, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (299, 13, 1, 1, 1, 19, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (300, 13, 1, 1, 1, 20, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (301, 13, 1, 1, 1, 21, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (302, 13, 1, 1, 1, 22, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (305, 13, 1, 1, 1, 25, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (306, 13, 1, 1, 1, 26, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (307, 13, 1, 1, 1, 27, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
INSERT [dbo].[studentdailyperformance] ([studentdailyperformanceid], [studentschoolmapid], [Attendance], [Discipline], [HomeWork], [day], [monthid], [yearid], [created_on], [Points]) VALUES (308, 13, 1, 1, 1, 28, 2, 1, CAST(0x0000AABD00000000 AS DateTime), 20)
SET IDENTITY_INSERT [dbo].[studentdailyperformance] OFF
SET IDENTITY_INSERT [dbo].[studentschoolmap] ON 

INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (3, 1, 1, 1, NULL, N'1', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (4, 2, 1, 1, NULL, N'2', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (5, 3, 1, 1, NULL, N'3', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (6, 4, 1, 1, NULL, N'4', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (7, 5, 1, 1, NULL, N'5', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (8, 6, 1, 1, NULL, N'6', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (9, 7, 1, 1, NULL, N'7', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (10, 8, 1, 1, NULL, N'8', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (11, 9, 1, 1, NULL, N'9', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (12, 10, 1, 1, NULL, N'10', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (13, 11, 1, 1, NULL, N'11', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (14, 12, 1, 1, NULL, N'12', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (15, 13, 2, 2, NULL, N'13', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (16, 14, 2, 2, NULL, N'1', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (17, 15, 2, 2, NULL, N'2', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (18, 16, 2, 2, NULL, N'3', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (19, 17, 2, 2, NULL, N'4', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (20, 18, 2, 2, NULL, N'5', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (21, 19, 2, 2, NULL, N'6', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (22, 20, 2, 2, NULL, N'7', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (23, 21, 2, 2, NULL, N'8', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (24, 22, 2, 2, NULL, N'9', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (25, 23, 2, 2, NULL, N'10', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (26, 24, 2, 2, NULL, N'11', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (27, 25, 2, 2, NULL, N'12', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (28, 26, 2, 2, NULL, N'13', 4, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[studentschoolmap] OFF
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([teacherid], [teachername], [schoolid], [status]) VALUES (1, N'Sasikala', 1, 1)
INSERT [dbo].[teacher] ([teacherid], [teachername], [schoolid], [status]) VALUES (2, N'Indira', 1, 1)
INSERT [dbo].[teacher] ([teacherid], [teachername], [schoolid], [status]) VALUES (3, N'Jaison', 1, 1)
SET IDENTITY_INSERT [dbo].[teacher] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (1, N'Kanthi', N'kanthi@gmail.com', N'abc123', 1, NULL, NULL, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (2, N'Sangeetha', N'sangeetha@gmail.com', N'abc123', 2, NULL, NULL, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (3, N'Pradeep', N'pradeep@gmail.com', N'abc123', 3, 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[group]  WITH CHECK ADD FOREIGN KEY([schoolid])
REFERENCES [dbo].[school] ([schoolid])
GO
ALTER TABLE [dbo].[parameterschoolmap]  WITH CHECK ADD FOREIGN KEY([parameterid])
REFERENCES [dbo].[parameter] ([parameterid])
GO
ALTER TABLE [dbo].[parameterschoolmap]  WITH CHECK ADD FOREIGN KEY([schoolid])
REFERENCES [dbo].[school] ([schoolid])
GO
ALTER TABLE [dbo].[school]  WITH CHECK ADD FOREIGN KEY([cityid])
REFERENCES [dbo].[city] ([cityid])
GO
ALTER TABLE [dbo].[studentdailyperformance]  WITH CHECK ADD  CONSTRAINT [FK_studentdailyperformance_studentschoolmap] FOREIGN KEY([studentschoolmapid])
REFERENCES [dbo].[studentschoolmap] ([studentschoolmapid])
GO
ALTER TABLE [dbo].[studentdailyperformance] CHECK CONSTRAINT [FK_studentdailyperformance_studentschoolmap]
GO
ALTER TABLE [dbo].[studentschoolmap]  WITH CHECK ADD FOREIGN KEY([classid])
REFERENCES [dbo].[class] ([classid])
GO
ALTER TABLE [dbo].[studentschoolmap]  WITH CHECK ADD FOREIGN KEY([divisionid])
REFERENCES [dbo].[division] ([divisionid])
GO
ALTER TABLE [dbo].[studentschoolmap]  WITH CHECK ADD FOREIGN KEY([groupid])
REFERENCES [dbo].[group] ([groupid])
GO
ALTER TABLE [dbo].[studentschoolmap]  WITH CHECK ADD FOREIGN KEY([schoolid])
REFERENCES [dbo].[school] ([schoolid])
GO
ALTER TABLE [dbo].[studentschoolmap]  WITH CHECK ADD FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
GO
ALTER TABLE [dbo].[studentteacher]  WITH CHECK ADD FOREIGN KEY([studentid])
REFERENCES [dbo].[student] ([studentid])
GO
ALTER TABLE [dbo].[studentteacher]  WITH CHECK ADD FOREIGN KEY([teacherid])
REFERENCES [dbo].[teacher] ([teacherid])
GO
ALTER TABLE [dbo].[teacher]  WITH CHECK ADD FOREIGN KEY([schoolid])
REFERENCES [dbo].[school] ([schoolid])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([cityid])
REFERENCES [dbo].[city] ([cityid])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([schoolid])
REFERENCES [dbo].[school] ([schoolid])
GO
USE [master]
GO
ALTER DATABASE [outreachpms] SET  READ_WRITE 
GO
