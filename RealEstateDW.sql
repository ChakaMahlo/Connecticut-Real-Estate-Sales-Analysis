 CREATE SCHEMA [RealEstateSales]
  GO
  
  	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dim_Date' AND
	SCHEMA_NAME(schema_id)='RealEstateSales')
	
		CREATE TABLE RealEstateSales.Dim_Date(
			
			[DateID] INT NOT NULL,
			[FullDate] datetime NUll,
			[Month_Name] char(10) NULL,
			[CalendarYear] int NULL,
			[CalendarMonth] int NULL,
			[WeekNum]int NULL,
			[WeekDay] char(15) NULL,
			[WeekDayNum] int NULL,
			PRIMARY KEY([DateID])
		
		);
		
  
  	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dim_Location' AND
	SCHEMA_NAME(schema_id)='RealEstateSales')
	
		CREATE TABLE RealEstateSales.Dim_Location(
			
			LocationID INT IDENTITY(1,1) PRIMARY KEY,
			Town VARCHAR(255) NOT NUll,
			Address_ VARCHAR(255) NOT NULL
		
		);
		
		
  	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dim_Value' AND
	SCHEMA_NAME(schema_id)='RealEstateSales')
	
		CREATE TABLE RealEstateSales.Dim_Value(
			
			ValueID INT IDENTITY(1,1) PRIMARY KEY,
			AssessedValue INT NOT NUll,
			SaleAmount INT NOT NULL
		
		);
		

		
  	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dim_AssessorRemarks' AND
	SCHEMA_NAME(schema_id)='RealEstateSales')
	
		CREATE TABLE RealEstateSales.Dim_AssessorRemarks(
			
			AssessorRemarksID INT IDENTITY(1,1) PRIMARY KEY,
			AssessorRemarks VARCHAR(255) NOT NUll
		
		);

		
  	IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dim_Residential' AND
	SCHEMA_NAME(schema_id)='RealEstateSales')
	
		CREATE TABLE RealEstateSales.Dim_Residential(
			
			ResidentialID INT IDENTITY(1,1) PRIMARY KEY,
			ResidentialType VARCHAR(255) NOT NUll
		
		);


  IF NOT EXISTS(SELECT * FROM sys.tables WHERE name='Fact_Sales' AND
  SCHEMA_NAME(schema_id)='RealEstateSales')
        CREATE TABLE RealEstateSales.Fact_Sales(

		   Serial_Number INT NOT NULL,
		   Listed_Year INT NOT NULL,
		   Date_Sold DATE NULL,
		   Assessed_Value INT NOT NULL,
		   Sale_Amount int NOT NULL,
		   DateID int NOT NULL,
		   LocationID INT NOT NULL, 
		   AssessorRemarksID INT NOT NULL,
		   ResidentialID INT NOT NULL
		   
  );