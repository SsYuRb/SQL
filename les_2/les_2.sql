use les_1;
create table sales (
id serial,
order_date date,
count_product int
);
insert into sales (order_date, count_product)
values 
('2022-01-01', 156), ('2022-01-02', 180), ('2022-01-03', 21), ('2022-01-04', 124), ('2022-01-05', 341);

alter table sales
add column type_of_order varchar(50);

insert into sales (type_of_order)
Select
	case
		when count_product < 100 THEN 'Маленький заказ'
		when (count_product  between 100 and 300) THEN 'Средний заказ'
		when count_product > 300 THEN 'Большой заказ'
		else 'Не определено'
    end as 'Тип заказа'
from sales;

use les_1;
create table orders (
id serial,
employee_id varchar(50),
amount float, 
order_status varchar(10)
);

insert into orders (employee_id, amount, order_status)
values ('e03', 15.00, 'OPEN'), ('e01', 25.50, 'OPEN'), ('e05', 100.70, 'CLOSED'), ('e02', 22.18, 'OPEN'), ('e04', 9.50, 'CANCELLED');

select *,
	case 
		when order_status = 'OPEN' then 'Order is in open state'
        when order_status = 'CLOSED' then 'Order is closed'
        when order_status = 'CANCELLED' then 'Order is cancelled'
	end as 'Статус заказа'
from orders;