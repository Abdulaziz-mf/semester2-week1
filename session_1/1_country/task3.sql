-- Task 3

-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read task3.sql
-- 3. Exit SQLite: .exit


-- write your sql code here
-- 1. Count the total number of countries in the dataset.
-- 2. Find how many countries belong to each continent.
-- 3. Calculate the total population for each continent.
-- 4. Find the average GDP per capita for each continent.
-- 5. Find continents that have more than 5 countries.
-- 6. Find continents where the total population is greater than 1 billion.
-- 7. Find the country with the highest population in each continent.
-- 8. For each continent, find the average population density, the highest population, and the lowest GDP per capita.
-- 9. Find continents where the average population density is greater than 100 and the total GDP per capita is greater than 5000.
-- 10. For each continent, calculate the total area, the total arable percentage, and the average birthrate for countries with a population greater than 10 million.

SELECT COUNT(Country) FROM countries;
SELECT continent, COUNT(*) AS total_countries FROM countries GROUP BY continent;
SELECT continent, SUM(Population) AS total_population FROM countries GROUP BY continent;
SELECT continent, AVG(GDPPerCapita) AS avg_GDP FROM countries GROUP BY continent;
SELECT continent, COUNT(*) AS total_countries FROM countries GROUP BY continent HAVING COUNT(*) > 5;
SELECT continent, SUM(population) as total_population FROM countries GROUP BY continent HAVING SUM(population) > 1000000000;
SELECT continent, country, population FROM countries c1 WHERE population = (SELECT MAX(population) FROM countries c2 WHERE c2.continent = c1.continent);
SELECT continent, AVG(PopDensityPerSqMi), MAX(population), MIN(GDPPerCapita) FROM countries GROUP BY continent;
-- 9. Find continents where the average population density is greater than 100 and the total GDP per capita is greater than 5000.
SELECT continent, AVG(PopDensityPerSqMi), SUM(GDPPerCapita) FROM countries GROUP BY continent HAVING AVG(PopDensityPerSqMi) > 100 AND SUM(GDPPerCapita) > 5000;
SELECT continent, SUM(AreaSqMi), SUM(ArablePercent), AVG(birthrate) FROM countries WHERE population > 10000000 GROUP BY continent;