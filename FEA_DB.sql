USE [FEA_DB]
GO
/****** Object:  Table [dbo].[AnnouncementReply]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementReply](
	[Id] [varchar](50) NULL,
	[ThreadId] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnnouncementThread]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementThread](
	[Id] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[OfficialContactNumber] [varchar](50) NULL,
	[OfficialContactEmail] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumReply]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumReply](
	[Id] [varchar](50) NULL,
	[ThreadId] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumThread]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumThread](
	[Id] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Email] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[TypeDesc] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MilestonePackage]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MilestonePackage](
	[Id] [varchar](50) NOT NULL,
	[DateCreated] [varchar](50) NULL,
	[PackageName] [varchar](50) NULL,
 CONSTRAINT [PK_MilestonePackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MilestonePackageItems]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MilestonePackageItems](
	[Id] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[MilestonePackageId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Milestones]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Milestones](
	[Id] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL,
 CONSTRAINT [PK_Milestones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[CurrentStage] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSalesCycleDiscussionForumReply]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSalesCycleDiscussionForumReply](
	[Id] [varchar](50) NULL,
	[ThreadId] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSalesCycleDiscussionForumThread]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSalesCycleDiscussionForumThread](
	[Id] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSalesCycleStage]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSalesCycleStage](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Stage] [varchar](50) NULL,
	[POC] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTeamLead]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTeamLead](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[TeamLeadEmail] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTeamMember]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTeamMember](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[TeamMemberEmail] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskDiscussionForumReply]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskDiscussionForumReply](
	[Id] [varchar](50) NULL,
	[ThreadId] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TaskId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskDiscussionForumThread]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskDiscussionForumThread](
	[Id] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TaskId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL,
	[MilestoneId] [varchar](50) NULL,
	[AssignedTo] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Deadline] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[CloseDate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[ProjectId] [varchar](50) NULL,
	[Priority] [varchar](50) NULL,
	[RaisedBy] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketClosureRequest]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketClosureRequest](
	[Id] [varchar](50) NULL,
	[TicketId] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DateCreated] [varchar](50) NULL,
	[DateTime] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDiscussionForumReply]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDiscussionForumReply](
	[Id] [varchar](50) NULL,
	[ThreadId] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TicketId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketDiscussionForumThread]    Script Date: 16-05-2024 15:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketDiscussionForumThread](
	[Id] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TicketId] [varchar](50) NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Login] ([Email], [Name], [Password], [Type], [TypeDesc]) VALUES (N'admin@gmail.com', N'Admin', N'123', N'Admin', NULL)
GO
GO
INSERT [dbo].[Login] ([Email], [Name], [Password], [Type], [TypeDesc]) VALUES (N'admin2@gmail.com', N'Admin2', N'123', N'Admin2', NULL)
GO
GO
INSERT [dbo].[Login] ([Email], [Name], [Password], [Type], [TypeDesc]) VALUES (N'admin3@gmail.com', N'Admin3', N'123', N'Admin3', NULL)
GO
GO
INSERT [dbo].[Login] ([Email], [Name], [Password], [Type], [TypeDesc]) VALUES (N'admin4@gmail.com', N'Admin4', N'123', N'Admin4', NULL)
GO
