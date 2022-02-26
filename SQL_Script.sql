
--- SQL script for transforming the data according to the business needs on SQL Server Management Studio



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
   ,Name AS 'Competitor Name'--Renaming column

      ,CASE WHEN Sex='M' THEN 'MALE'
	        ELSE  'Female'END AS Sex -- For better understanding in visualization


      ,[Age], 
	  CASE
	  WHEN [Age] < 18 THEN 'under 18'
	  WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
	  WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
	  WHEN [Age] > 30 THEN 'over 30'  END AS [Age Grouping]
	  

      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code' -- abbreviation

  --  ,[Games]

	 ,LEFT(Games, CHARINDEX(' ',Games)-1) AS 'Year' --- -- Split column to isolate Year, based on space
	  , RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1)  AS 'Season'---  Split column to isolate Season, based on space

   -- ,[City]

      ,[Sport]
      ,[Event]
	  ,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal -- Replaced NA with Not Registered
     
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1) = 'Summer'  -------- Where Clause to isolate Summer Season
  
