create database billingsoftwaredb;

use billingsoftwaredb;

create table product (
   product_id int primary key AUTO_INCREMENT ,
   product_name varchar(50),
   product_category_id int,
   product_quantity int,
   product_price decimal(10,2),
   foreign key(product_category_id) references master_product_category(product_category_id)
);

create table master_product_category(
   product_category_id int primary key,
   product_category_name varchar(50)
);


create table invoice(
   invoice_id int primary key AUTO_INCREMENT ,
   product_name varchar(30),
   hsn_bac varchar(15),
   product_price decimal(10,2),
   product_gst varchar(5),
   price_after_gst decimal(10,2),
   product_quantity int,
   product_rate decimal(10,2)
);

drop table product;

drop table master_product_category;

insert into master_product_category values(1, "Mixer");
insert into master_product_category values(2, "TV");
insert into master_product_category values(3, "Washing machine");
insert into master_product_category values(4, "Laptop");
insert into master_product_category values(5, "Tab");
insert into master_product_category values(6, "Mobile");



----------------------------------------------------------------

CREATE TABLE PRODUCT1(
   product_id int primary key AUTO_INCREMENT ,
   product_name varchar(30),
   product_price decimal(10,2));
)

insert into PRODUCT1 VALUES (1,"PRINTER",5000);
insert into PRODUCT1 VALUES (2,"KEMMYBOARD",1000);
insert into PRODUCT1 VALUES (3,"LAPTOP",30000);
insert into PRODUCT1 VALUES (4,"IPHONE 7",50000);

commit;
