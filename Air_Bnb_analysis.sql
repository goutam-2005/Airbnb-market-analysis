SELECT * FROM Airbnb_Open_Data_Cv ; 

SELECT count(*) from Airbnb_Open_Data_Cv ; 

-- pricing trends across neighbourhoods
-- Room type popularity 
-- Most behaviour & guest activity 
-- Booking patterns and availability 

-- pricing trends across neighbourhoods 

select neighbourhood_gr,avg(price) avg_price
from Airbnb_Open_Data_Cv
GROUP by 1
order by avg_price desc ;

-- insight - New drop and chelsea has the highest avg price and woodside has the lowest avg price 

-- which property is giving New drop and chelsea,Steaten Island highest price

select id,name,neighbourhood,price
from  Airbnb_Open_Data_Cv
where neighbourhood in ('New Drop','chelsea,Staten Isaland')
order by price asc ;

-- Most expensive properties :


-- Room type popularity 

select  room_type, count(DISTINCT id) as Count_properties, round(avg(review_rate_numb),3)  as avg_rating  ,
round(avg(price),3) as avg_price
from Airbnb_Open_Data_Cv
group by 1
order by Count_properties desc ;

-- most prefer putting entire room but Customer like hotel
-- hotel are good comapre to homes 

-- -- host behaviour & guest activity 

-- host identity

select host_identity_ve, count(DISTINCT id) as cnt_properties
from Airbnb_Open_Data_Cv
group by 1 ;

-- insight - half of the host is not confiremed

-- service fee

select count(case when service_fee > 500 then id end) as high_service ,
count(case when service_fee BETWEEN 200  and 500 then service_fee end) mid_service ,
count(case when service_fee < 200 then service_fee end) low_service 
from Airbnb_Open_Data_Cv ; 



-- instant_bookabke

select instant_bookable, count(DISTINCT id)
from Airbnb_Open_Data
group by instant_bookable ;

SELECT 
    instant_bookable,
    COUNT(DISTINCT id) AS total_properties,
    ROUND(
        COUNT(DISTINCT id) * 100.0 / 
        (SELECT COUNT(DISTINCT id) FROM Airbnb_Open_Data),
        2
    ) AS percentage
FROM Airbnb_Open_Data
GROUP BY instant_bookable;


-- “Nearly half of the properties are not instantly bookable.”
-- “Around 50% of listings do not support instant booking.”

-- cancellation_policy

select cancellation_pol,
count(DISTINCT id) as cnt_properties,
round(count(DISTINCT id) * 100.0 /
(select count(DISTINCT id) from Airbnb_Open_Data),2) as  percentage
from Airbnb_Open_Data 
group by cancellation_pol ; 

-- there are not insight


-- availability

SELECT 
    AVG(availability_365) AS avg_availability,
    MIN(availability_365) AS min_availability,
    MAX(availability_365) AS max_availability
FROM Airbnb_Open_Data;


SELECT 
count(CASE WHEN availability_365 >= 300 THEN id end) as 'High_availability',
count(case WHEN availability_365 BETWEEN 100 AND 300 THEN id end) as 'Medium_availability',
count(case WHEN availability_365 <= 100 THEN id end) as 'low_availability'
FROM Airbnb_Open_Data_Cv ; 

  
-- review_rate_numb

SELECT name ,max(review_rate_numb) as property_name ,
SUM(review_rate_numb) AS total_reviews,
round(AVG(review_rate_numb),3) AS avg_reviews_per_property
FROM Airbnb_Open_Data_cv  ;


-- Booking patterns and availability 

-- room type

select room_type,count(DISTINCT id)
from Airbnb_Open_Data_Cv
group by room_type ; 

-- most guest had booked entire room 




-- price category

-- > 800 -- high_room_price
-- between < 800 and > 500  high_room_price

select
count(case when price > 800 then price end) as high_room_price,
count(case when price between  400 and  800 then price end) as medium_room_price,
count(case when price < 400 then price end) as low_room_price
from Airbnb_Open_Data_Cv  ;


select host_name, count(DISTINCT id) as highest_property
from Airbnb_Open_Data_Cv
group by host_name
order by highest_property desc 
limit 5 ;

-- top 5 hosts have highest property  










