use less_5;
CREATE TABLE car_brands (
  Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Cost INT
);

INSERT INTO car_brands (Id, Name, Cost) VALUES
(1, 'Audi', 52642),
(2, 'Mercedes', 57127),
(3, 'Skoda', 9000),
(4, 'Volvo', 29000),
(5, 'Bentley', 350000),
(6, 'Citroen', 21000),
(7, 'Hummer', 41400),
(8, 'Volkswagen', 21600);

create view cheap_car 
as select * from car_brands where cost < 25000;

select * from cheap_car;

alter view cheap_car as
select * from car_brands
where cost < 30000;

select * from cheap_car;

create view skau_cars 
as select * from car_brands 
where car_brands.Name = 'Skoda' or car_brands.Name = 'Audi';

select * from skau_cars;

select an_name, an_price
from Analysis
join Orders on Analysis.an_id = Orders.ord_an
where ord_datetime >= '2020-02-05' and ord_datetime < '2020-02-12';

CREATE TABLE train_schedule (
  train_id integer,
  station character varying(20),
  station_time time
  );

INSERT INTO train_schedule (train_id, station, station_time) VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

select * from train_schedule;

SELECT 
	train_id, 
    station, 
    station_time, 
    LEAD(station_time) OVER (ORDER BY station_time) - station_time as time_to_next_station
FROM train_schedule;
