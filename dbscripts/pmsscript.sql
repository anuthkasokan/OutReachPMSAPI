USE [outreachpms]
GO
/****** Object:  Table [dbo].[city]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[class]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[division]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[group]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[month]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[parameter]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[parameterschoolmap]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[performanceyear]    Script Date: 3/9/2019 4:09:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[performanceyear](
	[yearid] [int] IDENTITY(1,1) NOT NULL,
	[performanceyear] [varchar](255) NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[yearid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[school]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[student]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[studentdailyperformance]    Script Date: 3/9/2019 4:09:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentdailyperformance](
	[studentdailyperformanceid] [int] IDENTITY(1,1) NOT NULL,
	[studentschoolmapid] [int] NULL,
	[parameterschoolmapid] [int] NULL,
	[performanceindex] [bit] NULL,
	[day] [int] NULL,
	[monthid] [int] NULL,
	[yearid] [int] NULL,
	[created_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentdailyperformanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[studentschoolmap]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[studentteacher]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[teacher]    Script Date: 3/9/2019 4:09:22 AM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 3/9/2019 4:09:22 AM ******/
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
ALTER TABLE [dbo].[studentdailyperformance]  WITH CHECK ADD FOREIGN KEY([monthid])
REFERENCES [dbo].[month] ([monthid])
GO
ALTER TABLE [dbo].[studentdailyperformance]  WITH CHECK ADD FOREIGN KEY([parameterschoolmapid])
REFERENCES [dbo].[parameterschoolmap] ([parameterschoolmapid])
GO
ALTER TABLE [dbo].[studentdailyperformance]  WITH CHECK ADD FOREIGN KEY([studentschoolmapid])
REFERENCES [dbo].[studentschoolmap] ([studentschoolmapid])
GO
ALTER TABLE [dbo].[studentdailyperformance]  WITH CHECK ADD FOREIGN KEY([yearid])
REFERENCES [dbo].[performanceyear] ([yearid])
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
