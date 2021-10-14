
--The dataset comes from Onyx Data which is created with the name DataDNA Dataset Challange October 2021 - Marvel Vs DC ,
-- Data has been cleaned using Sheets, Excel, And PowerBI

/*
Marvel Vs DC Data Exploration
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

Select *
From PortfolioProject..MarvelvsDC


-- Select Data that we are going to be starting with

Select Movie, Genre, Year, [RunTime], IMDB_Score, Metascore, Votes, USA_Gross
From PortfolioProject..MarvelvsDC
Order by Movie

--Marvel vs DC 
--Calculation Data with COUNT,SUM, AVG show different wihout duplicate data

Select COUNT(Movie) as "Total Movie"
From PortfolioProject..MarvelvsDC

Select COUNT(Movie) as "Marvel Movie" 
From PortfolioProject..MarvelvsDC
Where Category Like 'Marvel'

Select COUNT(Movie) as "DC Movie"
From PortfolioProject..MarvelvsDC
Where Category Like 'DC'

Select COUNT(DISTINCT Genre) as "Total Genre"
From PortfolioProject..MarvelvsDC

-- Runtime Marvel vs DC
Select SUM ([RunTime]) as "Total RunTime", AVG ([RunTime]) as "Average RunTime" 
From PortfolioProject..MarvelvsDC

Select SUM ([RunTime]) as "Total RunTime", AVG ([RunTime]) as "Average Marvel RunTime"
From PortfolioProject..MarvelvsDC
Where Category = 'Marvel'

Select SUM ([RunTime]) as "Total DC RunTime", AVG ([RunTime]) as "Average DC RunTime"
From PortfolioProject..MarvelvsDC
Where Category = 'DC'

-- IMDB Score Marvel vs DC
Select SUM (IMDB_Score) as "Total IMDB Score", AVG (IMDB_Score) as "Average IMDB Score"
From PortfolioProject..MarvelvsDC

Select SUM (IMDB_Score) as "Total Marvel IMDB Score", AVG (IMDB_Score) as "Average Marvel IMDB Score"
From PortfolioProject..MarvelvsDC
Where Category = 'Marvel'

Select SUM (IMDB_Score) as "Total DC IMDB Score", AVG (IMDB_Score) as "Average DC IMDB Score"
From PortfolioProject..MarvelvsDC
Where Category = 'DC'

-- Metascore Marvel vs DC
Select SUM (Metascore) as "Total Metascore", AVG (Metascore) as "Average Metascore"
From PortfolioProject..MarvelvsDC

Select SUM (Metascore) as "Total Marvel Metascore", AVG (Metascore) as "Average Marvel Metascore"
From PortfolioProject..MarvelvsDC
Where Category = 'Marvel'

Select SUM (Metascore) as "Total DC Metascore", AVG (Metascore) as "Average DC Metascore"
From PortfolioProject..MarvelvsDC
Where Category = 'DC'

-- Votes Marvel vs DC
Select SUM (Votes) as "Total Votes", AVG (Votes) as "Average Votes"
From PortfolioProject..MarvelvsDC

Select SUM (Votes) as "Total Marvel Votes", AVG (Votes) as "Average Marvel Votes"
From PortfolioProject..MarvelvsDC
Where Category = 'Marvel'

Select SUM (Votes) as "Total DC Votes", AVG (Votes) as "Average DC Votes"
From PortfolioProject..MarvelvsDC
Where Category = 'DC'

--Gross Income Marvel vs DC
Select SUM (USA_Gross) as "Total Gross Income", AVG (USA_Gross) as "Average Gross Income" 
From PortfolioProject..MarvelvsDC

Select SUM (USA_Gross) as "Total Marvel Gross Income", AVG (USA_Gross) as "Average Marvel Gross Income"
From PortfolioProject..MarvelvsDC
Where Category = 'Marvel'

Select SUM (USA_Gross) as "Total DC Gross Income", AVG (USA_Gross) as "Average DC Gross Income"
From PortfolioProject..MarvelvsDC
Where Category = 'DC'

-- IMDB_Score vs Metascore
-- Shows different score to compares the different

Select IMDB_Score, Metascore
From PortfolioProject..MarvelvsDC
Order by IMDB_Score Desc

Select Metascore, IMDB_Score
From PortfolioProject..MarvelvsDC
Order by Metascore Desc


-- Exploration Movies with Highest Variable
-- Movies with Highest IMDB

Select Movie, IMDB_Score 
From PortfolioProject..MarvelvsDC
Where Movie is not null
Order by IMDB_Score Desc

-- Movies with Highest Metascore

Select Movie, Metascore 
From PortfolioProject..MarvelvsDC
Where Movie is not null
Order by Metascore Desc

-- Movies with Highest Gross Income without duplicate Movie

Select Movie, USA_Gross as " Gross Income "
From PortfolioProject..MarvelvsDC
Where Movie is not null
Order by USA_Gross Desc

-- Genre with Highest Gross Income without duplicate Movie

Select Genre, USA_Gross as " Gross Income "
From PortfolioProject..MarvelvsDC
Where Genre is not null
Order bY USA_Gross Desc


-- GLOBAL NUMBERS

Select Movie, SUM([RunTime]) as "Total RunTime Minute", SUM (IMDB_Score) as "Total IMDB Score", SUM(Metascore) as "Total Metascore", SUM(Votes) as "Total Votes", SUM (USA_Gross) as "Total GrossIncome"
From PortfolioProject..MarvelvsDC
Group by Movie

Select Year, SUM([RunTime]) as "Total RunTime Minute", SUM (IMDB_Score) as "Total IMDB Score", SUM(Metascore) as "Total Metascore", SUM(Votes) as "Total Votes", SUM (USA_Gross) as "Total GrossIncome"
From PortfolioProject..MarvelvsDC
Group by Year
Order by Year Desc

Select Genre, SUM([RunTime]) as "Total RunTime Minute", SUM (IMDB_Score) as "Total IMDB Score", SUM(Metascore) as "Total Metascore", SUM(Votes) as "Total Votes", SUM (USA_Gross) as "Total GrossIncome"
From PortfolioProject..MarvelvsDC
Group by Genre

-- Total IMDB Score Vs Total Metascore
-- Shows Percentage of IMDB Score and Total Metascore by Movie 

Select Movie ,SUM(Metascore) as Metascore,SUM(IMDB_Score) as IMDB_Score, SUM(IMDB_Score)/SUM(Metascore) as "Score_Percentage %"
From PortfolioProject..MarvelvsDC
Where Metascore > 1 
Group by Movie
Order by "Score_Percentage %" Desc


-- Using CTE to perform Calculation on Partition By in previous query

-- Using Temp Table to perform Calculation on Partition By in previous query

-- Creating View to store data for later visualizations
