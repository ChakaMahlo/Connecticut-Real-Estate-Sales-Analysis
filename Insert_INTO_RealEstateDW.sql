


----INSERTING INTO Dim_Location TABLE------
INSERT INTO RealEstateSales.Dim_Location(Town,Address_)
SELECT DISTINCT Town,Address
FROM dbo.real_Estate_Final


----INSERTING INTO Dim_AssessorRemarks TABLE------
INSERT INTO RealEstateSales.Dim_AssessorRemarks(AssessorRemarks)
SELECT DISTINCT Assessor_Remarks
FROM dbo.real_Estate_Final

----INSERTING INTO Dim_Residential Table------
INSERT INTO RealEstateSales.Dim_Residential(ResidentialType)
SELECT DISTINCT Residential_Type
FROM dbo.real_Estate_Final

----INSERTING INTO Dim_Residential Table------
INSERT INTO RealEstateSales.Dim_Value(AssessedValue,SaleAmount)
SELECT DISTINCT Assessed_Value,Sale_Amount
FROM dbo.real_Estate_Final

----INSERTING INTO Fact_Sales TABLE---
INSERT INTO [RealEstateSales].[Fact_Sales]([Serial_Number],[Listed_Year],[Date_Sold],[Assessed_Value],[Sale_Amount],[DateID],[LocationID],[AssessorRemarksID],[ResidentialID])
SELECT [Serial_Number],[List_Year],[Date_Recorded],[Assessed_Value],[Sale_Amount],[DateID],[LocationID],[AssessorRemarksID],[ResidentialID]
FROM [RealEstateSales].[StagingView]

----INSERTING INTO Dim_Date TABLE----------
DECLARE @start DATE = '2001-01-01'
DECLARE @end DATE = '2021-12-31'
WHILE @start <= @end
BEGIN
INSERT INTO [RealEstateSales].[Dim_Date](DateID,FullDate,Month_Name,CalendarYear,CalendarMonth,WeekNum,WeekDay,WeekDayNum)
SELECT DATEPART(YY, @start)*10000+DATEPART(mm, @start)*100+DATEPART(dd, @start) as [DateID]
	@start as [FullDate]
	SUBSTRING(DATENAME(mm, @start), 1, 3) as [Month_Name]
	DATEPART(YY, @start) as [CalendarYear]
	DATEPART(mm, @start) as [CalendarMonth]
	DATEPART(ww, @start) as [WeekNum]
	DATENAME(dw, @start) as [WeekDay]
	DATEPART(dw, @start) as [WeekDayNum]
 SET @start = DATEADD(dd, 1, @start)
END
	
