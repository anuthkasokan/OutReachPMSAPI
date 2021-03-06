USE [outreachpms]
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (1, N'Kochi', 1, CAST(0x0000AABD00000000 AS DateTime))
INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (2, N'Hyderabad', 1, CAST(0x0000AABD00000000 AS DateTime))
INSERT [dbo].[city] ([cityid], [cityname], [status], [created_on]) VALUES (3, N'Chennai', 1, CAST(0x0000AABD00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[city] OFF
SET IDENTITY_INSERT [dbo].[school] ON 

INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (1, N'Thikkakkara Govt. High School', 1, 1, CAST(0x0000AA0B00000000 AS DateTime))
INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (2, N'Kakkanad Govt. High School', 2, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[school] ([schoolid], [schoolname], [cityid], [status], [created_on]) VALUES (3, N'Kalamassery Govt. High School', 3, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[school] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (1, N'Admin', CAST(0x0000A9FD00000000 AS DateTime))
INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (2, N'PMO', CAST(0x0000A9FD00000000 AS DateTime))
INSERT [dbo].[role] ([roleid], [rolename], [created_on]) VALUES (3, N'POC', CAST(0x0000A9FD00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (1, N'Kanthi', N'kanthi@gmail.com', N'abc123', 1, 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (2, N'Sangeetha', N'sangeetha@gmail.com', N'abc123', 2, 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[user] ([userid], [username], [email], [password], [roleid], [schoolid], [cityid], [created_on]) VALUES (3, N'Pradeep', N'pradeep@gmail.com', N'abc123', 3, 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[user] OFF
SET IDENTITY_INSERT [dbo].[group] ON 

INSERT [dbo].[group] ([groupid], [schoolid], [groupname], [status], [created_on]) VALUES (1, 1, N'Jasmine', 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[group] OFF
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
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[studentschoolmap] ON 

INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (3, 1, 1, 1, NULL, N'1', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (4, 2, 1, 1, NULL, N'2', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (5, 3, 1, 1, NULL, N'3', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (6, 4, 1, 1, NULL, N'4', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (7, 5, 1, 1, NULL, N'5', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (8, 6, 1, 1, NULL, N'6', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (9, 7, 1, 1, NULL, N'7', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (10, 8, 1, 1, NULL, N'8', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (11, 9, 1, 1, NULL, N'9', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (12, 10, 1, 1, NULL, N'10', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (13, 11, 1, 1, NULL, N'11', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
INSERT [dbo].[studentschoolmap] ([studentschoolmapid], [studentid], [schoolid], [classid], [divisionid], [rollnumber], [groupid], [status], [created_on]) VALUES (14, 12, 1, 1, NULL, N'12', 1, 1, CAST(0x0000AA0C00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[studentschoolmap] OFF
