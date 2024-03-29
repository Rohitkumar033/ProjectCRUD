USE [dbCollege]
GO
/****** Object:  Table [dbo].[tblClass]    Script Date: 16-Oct-19 12:03:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentRecords]    Script Date: 16-Oct-19 12:03:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[RollNo] [nvarchar](10) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[ClassId] [int] NULL,
 CONSTRAINT [PK_tblStudentRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTeachers]    Script Date: 16-Oct-19 12:03:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[TeacherName] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblTeachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblClass] ON 
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (1, N'Ist')
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (2, N'2nd')
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (3, N'3rd')
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (4, N'4th')
GO
INSERT [dbo].[tblClass] ([Id], [ClassName]) VALUES (5, N'5th')
GO
SET IDENTITY_INSERT [dbo].[tblClass] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudentRecords] ON 
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (1, N'sachin Kumar', N'101', N'sachin9396@gmail.com', N'H.no:961 maan nagar , batala.', N'9876281609', N'chandigarh', N'punjab', CAST(N'2019-10-12T18:25:56.533' AS DateTime), CAST(N'2019-10-15T18:03:58.707' AS DateTime), 1, 2)
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (2, N'Rohit Kumar', N'102', N'rohit1996@gmail.com', N'maan nagar batala', N'98763456', N'batala', N'punjab', CAST(N'2019-10-12T18:39:30.563' AS DateTime), CAST(N'2019-10-15T17:54:43.193' AS DateTime), 1, 2)
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (5, N'Neeraj Kumar', N'103', N'neeraj@gmail.com', N'RajParura , Pathankot', N'34356565774', N'Pathankot', N'punjab', CAST(N'2019-10-14T16:42:22.753' AS DateTime), CAST(N'2019-10-15T17:54:27.840' AS DateTime), 1, 5)
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (6, N'Happy', N'104', N'happy@gmail.com', N'Patti , TaranTarn', N'986348383', N'Patti', N'Punjab', CAST(N'2019-10-14T16:43:27.310' AS DateTime), CAST(N'2019-10-15T18:03:33.220' AS DateTime), 1, 3)
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (7, N'Shetty', N'105', N'shetty@gmail.com', N'Dhianpur , Panwan', N'8872546781', N'Panwan', N'Punjab', CAST(N'2019-10-15T17:59:51.480' AS DateTime), CAST(N'2019-10-15T17:59:51.480' AS DateTime), 1, 2)
GO
INSERT [dbo].[tblStudentRecords] ([ID], [Name], [RollNo], [Email], [Address], [Phone], [City], [State], [CreatedDate], [LastUpdatedDate], [IsActive], [ClassId]) VALUES (9, N'Roby', N'106', N'roby@gmail.com', N'dalachak , dhianpur', N'986348383', N'dalachak', N'punjab', CAST(N'2019-10-15T18:07:23.963' AS DateTime), CAST(N'2019-10-15T18:07:23.963' AS DateTime), 1, 5)
GO
SET IDENTITY_INSERT [dbo].[tblStudentRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTeachers] ON 
GO
INSERT [dbo].[tblTeachers] ([Id], [ClassId], [TeacherName]) VALUES (1, 1, N'Varun')
GO
INSERT [dbo].[tblTeachers] ([Id], [ClassId], [TeacherName]) VALUES (2, 2, N'Puneet')
GO
INSERT [dbo].[tblTeachers] ([Id], [ClassId], [TeacherName]) VALUES (3, 3, N'Tushar')
GO
INSERT [dbo].[tblTeachers] ([Id], [ClassId], [TeacherName]) VALUES (4, 4, N'Sachin')
GO
INSERT [dbo].[tblTeachers] ([Id], [ClassId], [TeacherName]) VALUES (5, 5, N'Raman')
GO
SET IDENTITY_INSERT [dbo].[tblTeachers] OFF
GO
ALTER TABLE [dbo].[tblStudentRecords]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentRecords_tblClass] FOREIGN KEY([ClassId])
REFERENCES [dbo].[tblClass] ([Id])
GO
ALTER TABLE [dbo].[tblStudentRecords] CHECK CONSTRAINT [FK_tblStudentRecords_tblClass]
GO
ALTER TABLE [dbo].[tblTeachers]  WITH CHECK ADD  CONSTRAINT [FK_tblTeachers_tblClass] FOREIGN KEY([ClassId])
REFERENCES [dbo].[tblClass] ([Id])
GO
ALTER TABLE [dbo].[tblTeachers] CHECK CONSTRAINT [FK_tblTeachers_tblClass]
GO
