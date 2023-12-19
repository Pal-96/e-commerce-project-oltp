alter session set current_schema=App_admin;

SET SERVEROUTPUT ON

----Warehouse:
EXEC add_warehouse('Amazon', 50, '789 Baker Street', '54321', 'Boston', 'Massachusetts', 'USA');
EXEC add_warehouse('Flipkart', 50, '123 Beckon St', '12345', 'Atlanta', 'Georgia', 'USA');
EXEC add_warehouse('Alibaba', 50, '789 Bolyston st', '67890', 'Newyork', 'Newyork', 'USA');
EXEC add_warehouse('Reliance', 50, '123 Harbour Street', '11223', 'Sydney', 'Sydney', 'Australia');
EXEC add_warehouse('Tata', 50, '789 Sakura Avenue', '33445', 'Tokyo', 'Tokyo', 'Japan');


------------------------------------------
--Warehouse 1
EXEC add_ware_product(1, 99, 30);
EXEC add_ware_product(1, 2, 30);
EXEC add_ware_product(1, 3, 30);
EXEC add_ware_product(1, 4, 30);
EXEC add_ware_product(1, 5, 5);
EXEC add_ware_product(1, 6, 5);
EXEC add_ware_product(1, 7, 30);
EXEC add_ware_product(1, 8, 30);
EXEC add_ware_product(1, 9, 30);
EXEC add_ware_product(1, 10, 30);

SELECT * FROM VW_PRODUCT;
-------------------------------------
--Warehouse 2
EXEC add_ware_product(2, 1, 30);
EXEC add_ware_product(2, 2, 30);
EXEC add_ware_product(2, 3, 30);
EXEC add_ware_product(2, 4, 30);
EXEC add_ware_product(2, 5, 30);
EXEC add_ware_product(2, 6, 30);
EXEC add_ware_product(2, 7, 30);
EXEC add_ware_product(2, 8, 30);
EXEC add_ware_product(2, 9, 30);
EXEC add_ware_product(2, 10, 30);

--------------------------------------
--Warehouse 3
EXEC add_ware_product(3, 1, 30);
EXEC add_ware_product(3, 2, 30);
EXEC add_ware_product(3, 3, 30);
EXEC add_ware_product(3, 4, 30);
EXEC add_ware_product(3, 5, 30);
EXEC add_ware_product(3, 6, 30);
EXEC add_ware_product(3, 7, 30);
EXEC add_ware_product(3, 8, 30);
EXEC add_ware_product(3, 9, 30);
EXEC add_ware_product(3, 10, 30);






--select * from vw_product_category;
--select * from vw_product;
select * from vw_ware_product;
--select * from vw_warehouse;