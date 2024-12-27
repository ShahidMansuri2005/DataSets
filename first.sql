-- use the amazon_temp database 
USE amazon_temp ;

-- 				Constraints : it resistricts the data that you are inseting 
-- NOTE : later we will study forgin key 
-- NOTE:  primary key is one but we have multiple unique keys 
-- in UNIQUE we can fill null value but in primary key ,follow unique property and not contain null value.
drop table amazon;
CREATE TABLE amazon
(
order_id INT NOT NULL UNIQUE, -- it will not except value null ,if null then error      not null , unique constraints
order_date DATETIME,
product_name VARCHAR(50) default "temp",          -- default constraint
total_price DECIMAL(8,2) , 
payment_mode VARCHAR(30) CHECK (payment_mode in ('UPI','COD','EMI','DEBIT'))  -- CHECK 
-- primary key can be a combination as primary key (order_id , customer_id)
);

INSERT INTO amazon values (1,'2023-4-23 09:02:34','Shoes',1999,'UPI'),
(3,'2022-5-23 02:34:56',"Mustard Oil",479.34,'COD'),
(34,'162023-8-23 04:02:34',"Oninon",199,'EMI'),
(42,'2023-8-23 10:10:12',"Copy",699,'COD'),
(4,'2023-8-23 11:07:03',"Laptop",78479.40,'UPI'),
(5,'2024-1-23 09:03:19',"T-shirt",305.40,'DEBIT') ;

select * from amazon;
-- not null
 INSERT INTO amazon values (null,'2023-4-23 09:02:34','Shoes',1999,'UPI'); -- give ERROR bcz order-id not except null value
-- check
INSERT INTO amazon values (78,'2020-4-23 04:02:30','Eye Drop',168.50,'xyz'); -- Error bcz payment method check accept value
INSERT INTO amazon values (78,'2020-4-23 04:02:30','Eye Drop',168.50,'UPI');
-- unique
INSERT INTO amazon values (1,'2020-4-23 04:02:30','Eye Drop',168.50,'UPI'); -- Error due to 1 id already present in table
INSERT INTO amazon values (69,'2020-4-23 04:02:30','Eye Drop',168.50,'EMI'); -- run bcz id is unique

-- default : dealing with default we mention what columns corresponding values we are inserting or write default
INSERT INTO amazon(order_id,order_date,total_price,payment_mode) values (60,'2020-4-23 14:02:30',00,'EMI'); 
-- or
INSERT INTO amazon values (12,'2020-4-23 04:02:30',default,199,'UPI'); 

-- Delete specific row
delete from amazon where order_id = 12;  -- DML command

-- --------UPDATE-----------
update amazon set payment_mode = 'COD' where order_id=78; -- DML
-- if condition not met then nothing happen