USE [EF.Json]
GO
/****** Object:  Table [dbo].[WebStandards]    Script Date: 3/24/2023 7:42:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebStandards](
	[Identifier] [int] IDENTITY(1,1) NOT NULL,
	[Section] [nvarchar](max) NULL,
	[Id] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Uri] [nvarchar](max) NULL,
	[ConformanceLevel] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Tips] [nvarchar](max) NULL,
	[Remedy] [nvarchar](max) NULL,
	[Exceptions] [nvarchar](max) NULL,
	[RelatedList] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebStandards] PRIMARY KEY CLUSTERED 
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
