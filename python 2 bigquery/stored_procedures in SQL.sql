delimiter //

CREATE PROCEDURE citycount (IN country CHAR(3), OUT cities INT)
	BEGIN
		SELECT COUNT(*) INTO cities FROM world.city
		WHERE CountryCode = country;
	END//
    
delimiter ;

CALL citycount('JPN', @cities);

SELECT COUNT(*) AS cities 
FROM world.city
WHERE CountryCode = 'JPN';




-- set @cities = 0;

CALL citycount('JPN', @cities);
select @cities;

call world.citycount('JPN', @cities);
select @cities;


DELIMITER $$
 CREATE PROCEDURE remove_duplicates()
BEGIN        
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY FIRST_NAME ORDER BY FIRST_NAME) AS rn
    FROM CUSTOMERS
)
DELETE FROM CUSTOMERS 
	WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM CTE WHERE rn > 1);            
END$$
DELIMITER ;


CALL remove_duplicates();

SELECT * FROM CUSTOMERS;