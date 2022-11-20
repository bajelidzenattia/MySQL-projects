
-- Looking at variety of cereals each manufacturer produces
-- Kellog and Nabisco have the biggest cereal portfolio range 

SELECT mfr, COUNT(DISTINCT name)
FROM cereals.cereal
GROUP BY mfr 
ORDER BY COUNT(name) DESC;

-- Looking at average calories by the type of cereals
-- On average cold cereals are higher in calories  

SELECT type, AVG(calories)
FROM cereals.cereal
GROUP BY type;


-- Determine which product is most nutritious, e.g. high in vitamins, low in sugar, good source of fiber and protein
-- Total Whole Grain by General Mills would be the best choice for a consumer considering above conditions 

SELECT name, mfr, vitamins, fiber, protein, sugars
from cereals.cereal
WHERE fiber >=3 AND protein >=3 AND sugars <= 10
ORDER by 3 DESC;

-- Looking at average shelf placement and average customer ratings for each manufacturer
-- N has lowest placement on a shelf and highest ratings 

SELECT mfr, AVG(shelf), AVG(rating)
FROM cereals.cereal
GROUP BY mfr 
ORDER BY 3 DESC;

-- Looking at whether there is correlation between shelf placement and average ratings of N products
-- From the observations the cereals of N is generally ranked high, no matter where its placed on a shelve 

SELECT name, AVG(shelf), AVG(rating)
FROM cereals.cereal
WHERE mfr = 'N'
GROUP by name;


-- Looking at product which has the highest number of serving  
-- Kix 

SELECT name,cups
FROM cereals.cereal 
WHERE CUPS = 
   ( SELECT MAX(cups) 
   FROM cereals.cereal);
   
-- Looking at whether customer ratings is connected to calories 
-- Overall average rating is higher for lower calorie option products

SELECT name, AVG(calories), AVG(rating)
FROM cereals.cereal
GROUP by name
ORDER BY 3 DESC;
