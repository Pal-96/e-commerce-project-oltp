alter session set current_schema=App_admin;

SET SERVEROUTPUT ON

----Product Category:
EXEC add_product_category('Phones');
EXEC add_product_category('Laptops');
EXEC add_product_category('Earphones');
EXEC add_product_category('Smartwatches');
EXEC add_product_category('Books');


----Product:

EXEC add_product(99, 'IPHONE 14', 'Latest model with advanced features', 20, 100);
EXEC add_product(1, 'Samsung Galaxy S21', 'High-performance Android smartphone', 20, 200);
EXEC add_product(2, 'Dell XPS 13', 'Powerful and portable laptop', 20, 300);
EXEC add_product(2, 'MacBook Pro', 'Premium Apple laptop', 20, 400);
EXEC add_product(3, 'JBL Free X Earphones', 'Wireless in-ear headphones', 20, 500);
EXEC add_product(3, 'Sony WH-1000XM4', 'Noise-canceling over-ear headphones', 20, 600);
EXEC add_product(4, 'Fitbit Versa 3', 'Fitness and health smartwatch', 20,150);
EXEC add_product(4, 'Apple Watch Series 7', 'Advanced Apple smartwatch', 20, 250);
EXEC add_product(5, 'Harry Potter ', 'Fantasy novel by J.K. Rowling', 20, 350);
EXEC add_product(5, 'The Alchemist', 'Philosophical novel by Paulo Coelho', 20, 550);

select * from user_product;

--select * from vw_product_category;
--select * from vw_product;