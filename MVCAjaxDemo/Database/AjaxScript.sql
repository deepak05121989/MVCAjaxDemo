USE [master]
GO
/****** Object:  Database [demoDB]    Script Date: 12/30/2023 1:27:23 PM ******/
CREATE DATABASE [demoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\demoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'demoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\demoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [demoDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [demoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [demoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [demoDB] SET  MULTI_USER 
GO
ALTER DATABASE [demoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [demoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'demoDB', N'ON'
GO
ALTER DATABASE [demoDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [demoDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [demoDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [varchar](50) NULL,
	[emp_email] [varchar](100) NULL,
	[emp_mobile] [bigint] NULL,
	[emp_salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentDetails]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NULL,
	[StudentEmail] [nvarchar](max) NULL,
	[StudentMobile] [bigint] NULL,
 CONSTRAINT [PK_studentDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Age] [int] NULL,
	[Country] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateEmployee]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_CreateEmployee]
@emp_name varchar(100),
@emp_email varchar(50),
@emp_mobile bigint,
@emp_salary money

AS
BEGIN

insert into employees ([emp_name], [emp_email], [emp_mobile], [emp_salary]) 
select 
@emp_name 
,@emp_email 
,@emp_mobile
,@emp_salary

ENd
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteEmployee]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_DeleteEmployee]
@emp_id int

AS
BEGIN

delete from employees where emp_id=@emp_id

ENd
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllEmployee]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_GetAllEmployee]
AS
BEGIN

select [emp_id], [emp_name], [emp_email], [emp_mobile], [emp_salary] from employees

ENd
GO
/****** Object:  StoredProcedure [dbo].[usp_GetEmployeeById]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_GetEmployeeById]
@emp_id int

AS
BEGIN

select [emp_id], [emp_name], [emp_email], [emp_mobile], [emp_salary] from employees where emp_id=@emp_id

ENd
GO
/****** Object:  StoredProcedure [dbo].[usp_VlidateUser]    Script Date: 12/30/2023 1:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_VlidateUser]
@userName varchar(50),
@pass varchar(50)
AS
BEGIN
select 1 from UserLogin where UserName=@userName and password=@pass
END
GO
USE [master]
GO
ALTER DATABASE [demoDB] SET  READ_WRITE 
GO
