create table product_info(
id integer primary key,
prod_id varchar(10) not null, 
prod_name char(20) not null, 
prod_price integer not null,
prod_quantity integer not null, 
created_date date not null,
updated_date date not null,
created_by varchar(20) not null,
updated_by varchar(20) not null)

create table product_specification(
id integer,
prod_colour char(10) not null, 
prod_name char(20) not null, 
prod_weight integer not null,
created_date date not null,
updated_date date not null,
created_by varchar(20) not null,
updated_by varchar(20) not null,
primary key (id),
foreign key (id) references product_info(id))

create table product_purchase(
id integer,
purchase_id varchar(10) not null, 
purchase_quantity integer not null, 
created_date date not null,
created_by varchar(20) not null,
primary key (id),
foreign key (id) references product_info(id))

INSERT INTO public.product_info
(id, prod_id, prod_name, prod_price, prod_quantity, created_date, updated_date, created_by, updated_by)
VALUES(1, 'P-01', 'iPhone', 100000, 10, '2023/10/20', '2023/12/02', 'Vignan', 'Subha');

INSERT INTO public.product_info
(id, prod_id, prod_name, prod_price, prod_quantity, created_date, updated_date, created_by, updated_by)
VALUES(2, 'P-02', 'Watch', 20000, 20, '2023/11/11', '2023/11/20', 'Vignan', 'Subha');

INSERT INTO public.product_info
(id, prod_id, prod_name, prod_price, prod_quantity, created_date, updated_date, created_by, updated_by)
VALUES(3, 'P-03', 'Shoes', 3000, 15, '2023/09/12', '2023/10/30', 'Vignan','Subha');

INSERT INTO public.product_purchase
(id, purchase_id, purchase_quantity, created_date, created_by)
VALUES(1, 'S-100', 2, '2023/12/03', 'Vignan');

INSERT INTO public.product_purchase
(id, purchase_id, purchase_quantity, created_date, created_by)
VALUES(3, 'S-204', 4, '2023/11/02', 'Vignan');

INSERT INTO public.product_specification
(id, prod_colour, prod_name, prod_weight, created_date, updated_date, created_by, updated_by)
VALUES(1, 'White', 'iPhone', 221, '2023/10/20', '2023/12/02', 'Vignan', 'Subha');

INSERT INTO public.product_specification
(id, prod_colour, prod_name, prod_weight, created_date, updated_date, created_by, updated_by)
VALUES(2, 'Blue', 'Watch', 56, '2023/11/11', '2023/11/20', 'Vignan', 'Subha');

INSERT INTO public.product_specification
(id, prod_colour, prod_name, prod_weight, created_date, updated_date, created_by, updated_by)
VALUES(3, 'Black', 'Shoes', 900, '2023/09/12', '2023/10/30', 'Vignan','Subha');

create index index_colour on product_specification(prod_colour);

alter table product_specification alter column prod_weight type varchar(6);

alter table product_purchase add column p_name char(20);

--Product colour of purchased products
select product_purchase.purchase_id, product_specification.prod_colour, 
product_specification.prod_name from product_purchase
inner join product_specification on product_purchase.id = product_specification.id;

--Rounding of the average price of all the products
select round(avg(prod_price),2) avg_price from product_info;

--Quantity of specific products of purchased products
select product_info.prod_id, product_info.prod_name, sum(product_info.prod_quantity) as total_quantity
from product_info
right join product_purchase on product_purchase.id = product_info.id
group by product_info.prod_id, product_info.prod_name;
