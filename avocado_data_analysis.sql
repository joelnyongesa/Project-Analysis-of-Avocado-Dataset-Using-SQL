--An analysis of the avocado dataset in Bigquery.
--Objectives: 
--1. What is the average price of a single avocado?
SELECT
  ROUND(AVG(AveragePrice), 2) AS average_price_per_avocado
FROM
  avocado_data.avocado_prices;
--Results: The average price of an avocado is $1.41.

--2. Which type of avocado had the highest volumes sold?
--First, let us see the types of avocado that are present in dataset.
SELECT
  DISTINCT type AS types
FROM
  avocado_data.avocado_prices;
--There are 2 distinct types: Conventional and Organic avocados.

--Next, let us see the volumes of each types that were sold.
SELECT
  type,
  ROUND(SUM(Total_Volume), 2) AS total_number_of_avocados_sold,
FROM
  avocado_data.avocado_prices
GROUP BY
  type
ORDER BY
  total_number_of_avocados_sold DESC;
--Observations: conventional avocados sold more than the organic avocados.

-- Year with highest volume of avocado sold.
SELECT
  EXTRACT(YEAR  FROM date) AS year,
  SUM(Total_Volume) AS sum_of_avocados_sold
FROM
  avocado_data.avocado_prices
GROUP BY
  year
ORDER BY
  year DESC;

--3. Region with highest number of bags of avocados sold.
SELECT
  region,
  SUM(Total_Bags) AS total_bags
FROM
  avocado_data.avocado_prices
GROUP BY
  region
ORDER BY
  region DESC;
--The top 3 regions with highest number of bags sold are: WestTexNewMexico, West, and TotalUS.