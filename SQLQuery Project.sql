SELECT *
FROM Portfolio_Project..CovidData
where continent is not null
Order by 3, 4

--SELECT *
--FROM Portfolio_Project..Covid_Vacinations
--Order by 3, 4


--Select Data that we are going to use

Select Location, date, cast(total_cases as int), new_cases, total_deaths, population
FROM Portfolio_Project..CovidData
order by 1,2

---- Looking at New Cases vs New Deaths

Select Location, date, new_cases, new_deaths, (CONVERT(float,new_deaths))/NULLIF(CONVERT(float,new_cases), 0)*100 as DeathPercentage
FROM Portfolio_Project..CovidData
WHERE Location LIKE '%AFRICA%'
order by 1,2

-- Looking at new cases vs Population


Select Location, date, new_cases, population, (CONVERT(float,new_cases))/NULLIF(CONVERT(float,population), 0)*100 as NEWPopulation
FROM Portfolio_Project..CovidData
order by 1,2

--- Looking at countries with highest infection rate

Select Location, population , MAX(new_cases) as MaximumNewCases, MAX((new_cases)/(population))*100 as PercentagePopluationCases
FROM Portfolio_Project..CovidData
Group By location, population
order by PercentagePopluationCases desc

--  DeathCount vs Percentage

Select location , MAX(new_deaths) as MaximumNewDeaths
FROM Portfolio_Project..CovidData
Group By location
order by MaximumNewDeaths desc
