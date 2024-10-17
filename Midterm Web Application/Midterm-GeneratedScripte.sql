USE [master]
GO
/****** Object:  Database [TeacherCourseDB]    Script Date: 2024-10-16 8:11:48 AM ******/
CREATE DATABASE [TeacherCourseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeacherCourseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TeacherCourseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeacherCourseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TeacherCourseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TeacherCourseDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeacherCourseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeacherCourseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeacherCourseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeacherCourseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeacherCourseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeacherCourseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TeacherCourseDB] SET  MULTI_USER 
GO
ALTER DATABASE [TeacherCourseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeacherCourseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeacherCourseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeacherCourseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeacherCourseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeacherCourseDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeacherCourseDB', N'ON'
GO
ALTER DATABASE [TeacherCourseDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TeacherCourseDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TeacherCourseDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2024-10-16 8:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseNumber] [nvarchar](10) NOT NULL,
	[CourseTitle] [nvarchar](100) NULL,
	[TotalHour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherCourses]    Script Date: 2024-10-16 8:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherCourses](
	[TeacherNumber] [int] NOT NULL,
	[CourseNumber] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherNumber] ASC,
	[CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2024-10-16 8:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherNumber] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [TotalHour]) VALUES (N'COMP101', N'Advanced Programming in C#', 75)
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [TotalHour]) VALUES (N'COMP102', N'Structured Programming', 90)
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [TotalHour]) VALUES (N'COMP103', N'Web Application I', 90)
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [TotalHour]) VALUES (N'COMP104', N'Web Application II', 75)
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [TotalHour]) VALUES (N'COMP105', N'ASP.Net Core MVC', 90)
GO
INSERT [dbo].[TeacherCourses] ([TeacherNumber], [CourseNumber]) VALUES (1234, N'COMP101')
GO
INSERT [dbo].[TeacherCourses] ([TeacherNumber], [CourseNumber]) VALUES (1234, N'COMP103')
GO
INSERT [dbo].[TeacherCourses] ([TeacherNumber], [CourseNumber]) VALUES (1235, N'COMP102')
GO
INSERT [dbo].[TeacherCourses] ([TeacherNumber], [CourseNumber]) VALUES (1236, N'COMP104')
GO
INSERT [dbo].[TeacherCourses] ([TeacherNumber], [CourseNumber]) VALUES (1236, N'COMP105')
GO
INSERT [dbo].[Teachers] ([TeacherNumber], [FirstName], [LastName], [Email]) VALUES (1234, N'Mary', N'Brown', N'mary@yahoo.com')
GO
INSERT [dbo].[Teachers] ([TeacherNumber], [FirstName], [LastName], [Email]) VALUES (1235, N'Richard', N'Green', N'richard@gmail.com')
GO
INSERT [dbo].[Teachers] ([TeacherNumber], [FirstName], [LastName], [Email]) VALUES (1236, N'Michael', N'Freitag', N'michael@hotmail.com')
GO
ALTER TABLE [dbo].[TeacherCourses]  WITH CHECK ADD FOREIGN KEY([CourseNumber])
REFERENCES [dbo].[Courses] ([CourseNumber])
GO
ALTER TABLE [dbo].[TeacherCourses]  WITH CHECK ADD FOREIGN KEY([TeacherNumber])
REFERENCES [dbo].[Teachers] ([TeacherNumber])
GO
USE [master]
GO
ALTER DATABASE [TeacherCourseDB] SET  READ_WRITE 
GO
