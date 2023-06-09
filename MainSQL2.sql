USE [master]
GO
/****** Object:  Database [HEQUANTRICOSODULIEU]    Script Date: 4/12/2023 12:03:55 PM ******/
CREATE DATABASE [HEQUANTRICOSODULIEU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HEQUANTRICOSODULIEU', FILENAME = N'E:\Git\Project DBMS\DTB\HEQUANTRICOSODULIEU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HEQUANTRICOSODULIEU_log', FILENAME = N'E:\Git\Project DBMS\DTB\HEQUANTRICOSODULIEU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HEQUANTRICOSODULIEU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ARITHABORT OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET RECOVERY FULL 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET  MULTI_USER 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HEQUANTRICOSODULIEU', N'ON'
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET QUERY_STORE = OFF
GO
USE [HEQUANTRICOSODULIEU]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[employeeID] [int] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[sex] [varchar](6) NOT NULL,
	[formatName] [varchar](10) NOT NULL,
	[wage] [float] NOT NULL,
	[employeeImage] [varbinary](max) NULL,
	[phoneNumber] [varchar](10) NOT NULL,
	[Em_address] [varchar](255) NULL,
	[citizenID] [varchar](12) NOT NULL,
	[commissionRate] [float] NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[age] [int] NULL,
	[statusJob] [varchar](255) NULL,
	[authorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[employeeID] [int] NOT NULL,
	[emp_password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Account]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[View_Account]
AS
	SELECT a.employeeID, fullName, emp_password
	FROM ACCOUNT a, EMPLOYEE e
	WHERE a.employeeID = e.employeeID
GO
/****** Object:  Table [dbo].[VOUCHER_STATUS]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHER_STATUS](
	[voucherStatusID] [int] NOT NULL,
	[voucherStatusName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[voucherStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOUCHER]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHER](
	[voucherID] [varchar](15) NOT NULL,
	[voucherName] [varchar](255) NOT NULL,
	[percentReduction] [float] NOT NULL,
	[voucherStatusID] [int] NULL,
	[expiryDate] [datetime] NULL,
	[limitNumber] [int] NULL,
	[numberUsed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_VOUCHER]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- VIEW FINAL
CREATE VIEW [dbo].[VIEW_VOUCHER] AS
	SELECT voucherID , vc.voucherName as [Name Voucher], percentReduction as [Percent Reduction ] ,vcs.voucherStatusName as [Name of status] , expiryDate , limitNumber , numberUsed 
	FROM VOUCHER vc INNER JOIN VOUCHER_STATUS vcs
			ON vc.voucherStatusID = vcs.voucherStatusID;
GO
/****** Object:  UserDefinedFunction [dbo].[GetVoucherInfo]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetVoucherInfo]
(
    @voucherID VARCHAR(15) = NULL,
    @voucherName VARCHAR(255) = NULL,
    @percentReduction FLOAT = NULL,
    @statusVoucher VARCHAR(255) = NULL,
    @expiryDate DATETIME = NULL,
    @limitNumber INT = NULL,
    @numberUsed INT = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM VIEW_VOUCHER
    WHERE (@voucherID IS NULL OR voucherID = @voucherID)
        AND (@voucherName IS NULL OR [Name Voucher] = @voucherName)
        AND (@percentReduction IS NULL OR [Percent Reduction ] = @percentReduction)
        AND (@statusVoucher IS NULL OR [Name of status] = @statusVoucher)
        AND (@expiryDate IS NULL OR expiryDate = @expiryDate)
        AND (@limitNumber IS NULL OR limitNumber = @limitNumber)
        AND (@numberUsed IS NULL OR numberUsed = @numberUsed)
)
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[phoneNumber] [varchar](10) NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[cus_address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_CUSTOMER]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_CUSTOMER] AS 
	SELECT fullName as [Full Name] , phoneNumber as[Number Phone], cus_address as Address
	FROM CUSTOMER;
GO
/****** Object:  Table [dbo].[AUTHORIZATION_USER]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHORIZATION_USER](
	[authorID] [int] NOT NULL,
	[authorName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_EMPLOYEE]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_EMPLOYEE] AS
	SELECT em.employeeID , fullName , sex ,employeeImage,formatName ,phoneNumber ,
	Em_address As [Address] , citizenID ,wage ,dateOfBirth , age , statusJob , authorName as [role]
	FROM EMPLOYEE AS em
	INNER JOIN AUTHORIZATION_USER AS ath
    ON em.authorID = ath.authorID
GO
/****** Object:  Table [dbo].[PRODUCT_DETAIL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_DETAIL](
	[productID] [varchar](10) NOT NULL,
	[typeID] [varchar](10) NOT NULL,
	[brandID] [varchar](10) NOT NULL,
	[importPrice] [int] NOT NULL,
	[sellPrice] [int] NOT NULL,
	[descript] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILL_DETAIL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL_DETAIL](
	[billID] [varchar](20) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[COMPLETED_BILL_DETAIL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[COMPLETED_BILL_DETAIL] AS
	SELECT billID, pd.productID, number, sellPrice*number as totalMoney
	FROM BILL_DETAIL bd INNER JOIN PRODUCT_DETAIL pd
			ON bd.productID = pd.productID;
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[billID] [varchar](20) NOT NULL,
	[employeeID] [int] NOT NULL,
	[phoneNumber] [varchar](10) NULL,
	[billExportTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[COMPLETED_BILL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
CREATE VIEW [dbo].[COMPLETED_BILL] AS
	SELECT b.billID, b.employeeID, b.phoneNumber, b.billExportTime, SUM(cbd.totalMoney) as totalPay
	FROM BILL b INNER JOIN COMPLETED_BILL_DETAIL cbd
		ON b.billID = cbd.billID
	GROUP BY b.billID, b.employeeID, b.phoneNumber, b.billExportTime;
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[productID] [varchar](10) NOT NULL,
	[productName] [varchar](255) NOT NULL,
	[productImageURL] [varbinary](max) NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_PRODUCT]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VIEW_PRODUCT] AS 
	SELECT pd.productID, pd.productName, pd.productImageURL, pd.quantity
	FROM PRODUCT pd INNER JOIN PRODUCT_DETAIL pdt
	ON pd.productID = pdt.productID
	GROUP BY pd.productID, pd.productName, pd.productImageURL, pd.quantity;
GO
/****** Object:  Table [dbo].[WARRANTY_CARD]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WARRANTY_CARD](
	[productID] [varchar](10) NOT NULL,
	[warr_StatusID] [int] NOT NULL,
	[descript] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_WARRENTY]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_WARRENTY] AS
	SELECT wr.productID, wr.warr_StatusID, wr.descript
	FROM WARRANTY_CARD wr INNER JOIN BILL_DETAIL bld
	ON wr.productID = bld.productID
	GROUP BY wr.productID, wr.warr_StatusID, wr.descript;
GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[brandID] [varchar](10) NOT NULL,
	[brandName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMISSION_DETAIL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMISSION_DETAIL](
	[comAnaID] [int] NOT NULL,
	[brandID] [varchar](10) NOT NULL,
	[minCommission] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comAnaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMPORT]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMPORT](
	[importID] [varchar](20) NOT NULL,
	[employeeID] [int] NOT NULL,
	[importDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[importID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMPORT_DETAIL]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMPORT_DETAIL](
	[importID] [varchar](20) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[numberOfImport] [int] NOT NULL,
	[descript] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[importID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT_TYPE]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT_TYPE](
	[typeID] [varchar](10) NOT NULL,
	[typeName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOUCHER_APPLY]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHER_APPLY](
	[billID] [varchar](20) NOT NULL,
	[voucherID] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WARRANTY_STATUS]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WARRANTY_STATUS](
	[warr_StatusID] [int] NOT NULL,
	[statusName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[warr_StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORK_TIME]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORK_TIME](
	[employeeID] [int] NOT NULL,
	[checkIn] [datetime] NOT NULL,
	[checkOut] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC,
	[checkIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCOUNT] ([employeeID], [emp_password]) VALUES (1, N'admin123')
INSERT [dbo].[ACCOUNT] ([employeeID], [emp_password]) VALUES (2, N'B1B386')
INSERT [dbo].[ACCOUNT] ([employeeID], [emp_password]) VALUES (3, N'FCF4DE')
GO
INSERT [dbo].[AUTHORIZATION_USER] ([authorID], [authorName]) VALUES (1, N'Manager')
INSERT [dbo].[AUTHORIZATION_USER] ([authorID], [authorName]) VALUES (2, N'Cashier')
GO
INSERT [dbo].[EMPLOYEE] ([employeeID], [fullName], [sex], [formatName], [wage], [employeeImage], [phoneNumber], [Em_address], [citizenID], [commissionRate], [dateOfBirth], [age], [statusJob], [authorID]) VALUES (1, N'Nguyen Ngan', N'Female', N'Full Time', 27000, NULL, N'0123456799', N'Ho Chi Minh', N'050303116553', 0.5, CAST(N'2003-08-20' AS Date), 20, N'Active', 1)
INSERT [dbo].[EMPLOYEE] ([employeeID], [fullName], [sex], [formatName], [wage], [employeeImage], [phoneNumber], [Em_address], [citizenID], [commissionRate], [dateOfBirth], [age], [statusJob], [authorID]) VALUES (2, N'Nguyen Van Ba', N'Female', N'Part Time', 23000, NULL, N'0123409799', N'Ho Chi Minh', N'050303116663', 0.2, CAST(N'2003-08-20' AS Date), 20, N'Active', 2)
INSERT [dbo].[EMPLOYEE] ([employeeID], [fullName], [sex], [formatName], [wage], [employeeImage], [phoneNumber], [Em_address], [citizenID], [commissionRate], [dateOfBirth], [age], [statusJob], [authorID]) VALUES (3, N'Nguyen A', N'Female', N'Full Time', 21000, NULL, N'0123477799', N'Ho Chi Minh', N'050303110053', 0.4, CAST(N'2003-08-20' AS Date), 20, N'Active', 2)
GO
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'0DBE72', N'[VOUCHER CHUA DUOC DAT TEN]', 0, 2, NULL, NULL, NULL)
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'2D01B8', N'VOUCHER CHUA DUOC DAT TEN', 0, 2, NULL, NULL, NULL)
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'HDKF', N'CHAO HE', 30, 1, NULL, 30, 2)
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'HDKFM', N'CHAO HE', 30, 1, NULL, 30, 2)
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'HDKFMS', N'CHAO HE', 30, 1, CAST(N'1905-06-13T00:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[VOUCHER] ([voucherID], [voucherName], [percentReduction], [voucherStatusID], [expiryDate], [limitNumber], [numberUsed]) VALUES (N'HDKFMSR', N'CHAO HE', 30, 1, CAST(N'2003-11-23T00:00:00.000' AS DateTime), 30, 2)
GO
INSERT [dbo].[VOUCHER_STATUS] ([voucherStatusID], [voucherStatusName]) VALUES (1, N'Con HSD')
INSERT [dbo].[VOUCHER_STATUS] ([voucherStatusID], [voucherStatusName]) VALUES (2, N'Qua HSD')
GO
INSERT [dbo].[WARRANTY_STATUS] ([warr_StatusID], [statusName]) VALUES (1, N'NON-PROCESSED')
INSERT [dbo].[WARRANTY_STATUS] ([warr_StatusID], [statusName]) VALUES (2, N'PROCESSED')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EMPLOYEE__4849DA0185FB32D9]    Script Date: 4/12/2023 12:03:55 PM ******/
ALTER TABLE [dbo].[EMPLOYEE] ADD UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EMPLOYEE__E838FE00D865B665]    Script Date: 4/12/2023 12:03:55 PM ******/
ALTER TABLE [dbo].[EMPLOYEE] ADD UNIQUE NONCLUSTERED 
(
	[citizenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD FOREIGN KEY([employeeID])
REFERENCES [dbo].[EMPLOYEE] ([employeeID])
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([employeeID])
REFERENCES [dbo].[EMPLOYEE] ([employeeID])
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([phoneNumber])
REFERENCES [dbo].[CUSTOMER] ([phoneNumber])
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD FOREIGN KEY([billID])
REFERENCES [dbo].[BILL] ([billID])
GO
ALTER TABLE [dbo].[BILL_DETAIL]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[PRODUCT] ([productID])
GO
ALTER TABLE [dbo].[COMMISSION_DETAIL]  WITH CHECK ADD FOREIGN KEY([brandID])
REFERENCES [dbo].[BRAND] ([brandID])
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[AUTHORIZATION_USER] ([authorID])
GO
ALTER TABLE [dbo].[IMPORT]  WITH CHECK ADD FOREIGN KEY([employeeID])
REFERENCES [dbo].[EMPLOYEE] ([employeeID])
GO
ALTER TABLE [dbo].[IMPORT_DETAIL]  WITH CHECK ADD FOREIGN KEY([importID])
REFERENCES [dbo].[IMPORT] ([importID])
GO
ALTER TABLE [dbo].[IMPORT_DETAIL]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[PRODUCT] ([productID])
GO
ALTER TABLE [dbo].[PRODUCT_DETAIL]  WITH CHECK ADD FOREIGN KEY([brandID])
REFERENCES [dbo].[BRAND] ([brandID])
GO
ALTER TABLE [dbo].[PRODUCT_DETAIL]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[PRODUCT] ([productID])
GO
ALTER TABLE [dbo].[PRODUCT_DETAIL]  WITH CHECK ADD FOREIGN KEY([typeID])
REFERENCES [dbo].[PRODUCT_TYPE] ([typeID])
GO
ALTER TABLE [dbo].[VOUCHER]  WITH CHECK ADD FOREIGN KEY([voucherStatusID])
REFERENCES [dbo].[VOUCHER_STATUS] ([voucherStatusID])
GO
ALTER TABLE [dbo].[VOUCHER_APPLY]  WITH CHECK ADD FOREIGN KEY([billID])
REFERENCES [dbo].[BILL] ([billID])
GO
ALTER TABLE [dbo].[VOUCHER_APPLY]  WITH CHECK ADD FOREIGN KEY([voucherID])
REFERENCES [dbo].[VOUCHER] ([voucherID])
GO
ALTER TABLE [dbo].[WARRANTY_CARD]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[PRODUCT] ([productID])
GO
ALTER TABLE [dbo].[WARRANTY_CARD]  WITH CHECK ADD FOREIGN KEY([warr_StatusID])
REFERENCES [dbo].[WARRANTY_STATUS] ([warr_StatusID])
GO
ALTER TABLE [dbo].[WORK_TIME]  WITH CHECK ADD FOREIGN KEY([employeeID])
REFERENCES [dbo].[EMPLOYEE] ([employeeID])
GO
ALTER TABLE [dbo].[ACCOUNT]  WITH CHECK ADD CHECK  ((len([emp_password])>=(6)))
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD CHECK  ((len([citizenID])=(12)))
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD CHECK  ((len([phoneNumber])=(10)))
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[PRODUCT_DETAIL]  WITH CHECK ADD CHECK  (([importPrice]>=(0)))
GO
ALTER TABLE [dbo].[PRODUCT_DETAIL]  WITH CHECK ADD CHECK  (([sellPrice]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[Change_Password]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Change_Password] 
	@employeeID INT, 
	@newPassword VARCHAR(255), 
	@oldPassword VARCHAR(255)
AS
BEGIN
	DECLARE @oldPasswordData VARCHAR(255)
	SELECT @oldPasswordData = emp_password
	FROM ACCOUNT
	WHERE employeeID = @employeeID
	
	IF(@oldPassword = @oldPasswordData)
	BEGIN
		UPDATE ACCOUNT
		SET emp_password = @newPassword
		WHERE employeeID = @employeeID
		RETURN 1
	END
	ELSE
		RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[GenerateNewVoucherID]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateNewVoucherID]
	@id VARCHAR(6) OUTPUT
AS
BEGIN
	DECLARE @newID VARCHAR(6)
	SET @newID = SUBSTRING(CAST(NEWID() AS VARCHAR(36)), 1, 6)
	WHILE EXISTS(SELECT 1 FROM VOUCHER WHERE voucherID = @newID)
	BEGIN
		SET @newID = SUBSTRING(CAST(NEWID() AS VARCHAR(36)), 1, 6)
	END
	SET @id = @newID
END
GO
/****** Object:  StoredProcedure [dbo].[GetInforEmployeeByID]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetInforEmployeeByID] @employeeID  INT
AS
	SELECT *
	FROM VIEW_EMPLOYEE
	WHERE employeeID = @employeeID;
GO
/****** Object:  StoredProcedure [dbo].[GetInforVoucher]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInforVoucher]
@voucherID VARCHAR(15) = NULL,
@voucherName VARCHAR(255) = NULL,
@percent INT = NULL,
@statusVoucher VARCHAR(255) = NULL,
@expiryDate DATETIME = NULL,
@limitNumber INT = NULL,
@numberUsed INT = NULL
AS
BEGIN
	SELECT *
	FROM VIEW_VOUCHER
	WHERE   (@voucherID IS NULL OR voucherID = @voucherID)
		AND (@voucherName IS NULL OR [Name Voucher] = @voucherName)
		AND (@percent IS  NULL OR [Percent Reduction ] = @percent)
		AND (@statusVoucher IS NULL OR [Name of status] = @statusVoucher)
		AND (@expiryDate IS NULL OR expiryDate = @expiryDate)
 		AND (@limitNumber IS NULL OR limitNumber = @limitNumber)
		AND (@numberUsed IS NULL OR numberUsed = @numberUsed)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertVoucher]    Script Date: 4/12/2023 12:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertVoucher] 
@voucherID VARCHAR(15) = NULL,
@voucherName VARCHAR(255) = '[VOUCHER CHUA DUOC DAT TEN]',
@percent INT = 0,
@statusVoucher VARCHAR(255) = 'Qua HSD',
@expiryDate DATETIME = NULL,
@limitNumber INT = NULL,
@numberUsed INT = NULL
AS
BEGIN
	DECLARE @statusID INT = 2
	IF(@statusVoucher = 'Con HSD')
	BEGIN
		SET @statusID = 1
	END
	IF(@voucherID IS NULL)
	BEGIN
		EXEC GenerateNewVoucherID @id = @voucherID OUTPUT
		--INSERT INTO VOUCHER(voucherID, voucherName, percentReduction, voucherStatusID,expiryDate,limitNumber,numberUsed) VALUES (@autoID, @voucherName, @percent, @statusVoucher, @expiryDate, @limitNumber, @numberUsed)
	END
	INSERT INTO VOUCHER(voucherID, voucherName, percentReduction, voucherStatusID,expiryDate,limitNumber,numberUsed) VALUES (@voucherID, @voucherName, @percent, @statusID, @expiryDate, @limitNumber, @numberUsed)
END
GO
USE [master]
GO
ALTER DATABASE [HEQUANTRICOSODULIEU] SET  READ_WRITE 
GO
