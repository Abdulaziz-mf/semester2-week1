-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 countries.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

-- 1. Find the average population for each continent.
SELECT Continent, AVG(Population) FROM countries GROUP BY Continent;
-- 2. Find the total population of each continent.
SELECT Continent, SUM(Population) FROM countries GROUP by Continent;
-- 3. Find the largest population of any country in each continent.
SELECT MAX(Population), Continent FROM countries GROUP BY Continent;
-- 4. Find the smallest land area (AreaSqMi) of any country in each continent.
SELECT MIN(AreaSqMi), Continent FROM countries group by Continent;
-- 5. Count how many countries there are in each continent.
SELECT COUNT(Country), Continent from countries group by Continent;
-- 6. List continents ordered by their average GDP per capita, highest first.
select AVG(GDPPerCapita) as average_GDP, Continent from countries group by continent order by AVG(GDPPerCapita) DESC; 
-- 7. Show the top 5 most populous countries.
SELECT Country, Population from countries order by Population DESC LIMIT 5;
-- 8. Show the 5 countries with the lowest infant mortality rate.
SELECT InfantMortalityPer1000, Country from countries order by InfantMortalityPer1000 ASC LIMIT 5;
-- 9. Find the average literacy rate per continent, ordered from lowest to highest.
SELECT AVG(LiteracyPercent), Continent from countries group by Continent order by AVG(LiteracyPercent) ASC;
-- 10. Show the 3 continents with the highest total population.
SELECT SUM(Population), Continent from countries GROUP BY continent ORDER BY SUM(Population) DESC LIMIT 3;
-- 11. Find the average population per continent, considering only countries with a population greater than 10 million.
SELECT AVG(population), Continent from countries WHERE Population > 10000000 GROUP BY continent;

-- 12. Find the average GDP per capita per continent, considering only countries where literacy is above 80%.
select avg(GDPPerCapita), Continent from countries where LiteracyPercent > 80 GROUP BY continent;
-- 13. For each continent, find the maximum birthrate of countries which an infant mortality below 30 per 1000 births.
select continent, MAX(birthrate) from countries where InfantMortalityPer1000 < 30 group by continent;
-- 14. Find continents where the average GDP per capita is greater than 10,000, considering only countries with a literacy rate above 80%, and order the results from highest to lowest average GDP per capita.
select continent, avg(GDPPerCapita) from countries where LiteracyPercent > 80 group by continent having AVG(GDPPerCapita) > 10000 order by AVG(GDPPerCapita) DESC;
-- 15. Find continents that have a total population greater than 500 million, but only include countries where the birthrate is below 20, order the results by total population (largest first), and limit the output to 3 results.
select continent, sum(population) from countries where birthrate < 20 group by continent having sum(population) > 500000000 order by sum(population) desc limit 3;
