begin
    execute immediate 'drop user product_manager cascade';
    execute immediate 'drop user inventory_manager cascade';
    execute immediate 'drop user customer1 cascade';
    execute immediate 'drop user customer2 cascade';
exception
    when others then
        if sqlcode != -1918 then
            raise;
        end if;    
end;
/


--product_manager
create user product_manager identified by PasswordMaverick2;
grant create session to product_manager;
grant execute on add_product_category to product_manager;
grant execute on add_product to product_manager;
--grant execute on add_user_product to product_manager;
--grant execute on add_payment to product_manager;
--grant execute on add_order to product_manager;
grant select on vw_product_category to product_manager;
grant select on vw_product to product_manager;
grant select on vw_user_product to product_manager;
grant select on vw_payment to product_manager;
grant select on vw_order_table to product_manager;

--revoke select on product from product_manager;
--revoke select on product_category from product_manager;
--revoke select on user_product from product_manager;
--revoke select on payment from product_manager;
--revoke select on order_table from product_manager;

--select * from PRODUCT;
----
----
----
--inventory_manager
create user inventory_manager identified by PasswordMaverick3;
grant create session to inventory_manager;
grant execute on add_warehouse to inventory_manager;
grant execute on add_ware_product to inventory_manager;
grant select on vw_product to inventory_manager;
grant select on vw_product_category to inventory_manager;
grant select on vw_ware_product to inventory_manager;
grant select on vw_warehouse to inventory_manager;
--grant select on vw_inventory_out_of_stock to inventory_manager;

--revoke select on product from inventory_manager;
--revoke select on product_category from inventory_manager;
--revoke select on ware_product from inventory_manager;
--revoke select on warehouse from inventory_manager;
-----
-----
-----
--customer1
create user customer1 identified by PasswordMaverick4;
grant create session to customer1;
grant execute on add_user_product to customer1;
grant execute on add_payment to customer1;
grant execute on add_order to customer1;
grant select on customer1_view to customer1;
grant select on vw_product to customer1;
grant select on vw_product_category to customer1;
----

--customer2
create user customer2 identified by PasswordMaverick5;
grant create session to customer2;
grant execute on add_user_product to customer2;
grant execute on add_payment to customer2;
grant execute on add_order to customer2;
grant select on customer2_view to customer2;
grant select on vw_product to customer2;
grant select on vw_product_category to customer2;

--customer3
create user customer3 identified by PasswordMaverick6;
grant create session to customer3;
grant execute on add_user_product to customer3;
grant execute on add_payment to customer3;
grant execute on add_order to customer3;
grant select on customer3_view to customer3;
grant select on vw_product to customer3;
grant select on vw_product_category to customer3;

--customer4
create user customer4 identified by PasswordMaverick7;
grant create session to customer4;
grant execute on add_user_product to customer4;
grant execute on add_payment to customer4;
grant execute on add_order to customer4;
grant select on customer4_view to customer4;
grant select on vw_product to customer4;
grant select on vw_product_category to customer4;


create user customer5 identified by PasswordMaverick4;
grant create session to customer5;
grant execute on add_user_product to customer5;
grant execute on add_payment to customer5;
grant execute on add_order to customer5;
grant select on customer5_view to customer5;
grant select on vw_product to customer5;
grant select on vw_product_category to customer5;

SELECT * FROM USER_PRODUCT;



CREATE OR REPLACE PROCEDURE UPSERT_DEPT(PI_DNAME IN DEPARTMENT.DEPT_NAME%TYPE, PI_DLOC IN DEPARTMENT.DEPT_LOCATION%TYPE)
AS
    E_EXISTS EXCEPTION;
    V_EXISTS VARCHAR(10):='N';
    V_DEPTLOC DEPARTMENT.DEPT_LOCATION%TYPE;
    V_DNAME DEPARTMENT.DEPT_NAME%TYPE;
BEGIN
    SELECT DEPT_NAME, DEPT_LOCATION
    INTO V_DNAME, V_DEPTLOC
    FROM DEPARTMENT
    WHERE DEPT_NAME=INITCAP(PI_DNAME);
   
    IF(V_DNAME=INITCAP(PI_DNAME) AND V_DEPTLOC!=PI_DLOC AND PI_DLOC IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH')) THEN
        UPDATE DEPARTMENT
        SET DEPT_LOCATION=PI_DLOC
        WHERE DEPT_NAME=INITCAP(PI_DNAME);
        DBMS_OUTPUT.PUT_LINE('Department modified');
        COMMIT;
    ELSIF(V_DNAME=INITCAP(PI_DNAME) AND V_DEPTLOC=PI_DLOC) THEN
        DBMS_OUTPUT.PUT_LINE('Department record already exists.');
    ELSIF(V_DEPTLOC!=PI_DLOC AND PI_DLOC NOT IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH')) THEN
        DBMS_OUTPUT.PUT_LINE('Invalid department location'); 
    END IF;   
EXCEPTION
    WHEN NO_DATA_FOUND THEN      
        IF(LENGTH(PI_DNAME)>20) THEN
            DBMS_OUTPUT.PUT_LINE('Department name is more that 20 characters');      
        ELSIF(PI_DNAME IS NULL OR LENGTH(PI_DNAME)=0) THEN
            DBMS_OUTPUT.PUT_LINE('Department name is null or length is 0. Enter a valid department name');        
        ELSIF(REGEXP_LIKE(PI_DNAME, '^[0-9]+$')) THEN 
            DBMS_OUTPUT.PUT_LINE('Department name cannot be numeric');
        ELSIF (PI_DLOC NOT IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH')) THEN
            DBMS_OUTPUT.PUT_LINE('Invalid department location');    
        ELSIF (PI_DLOC IN ('MA', 'TX', 'IL', 'CA', 'NY', 'NJ', 'NH', 'RH')) THEN
            INSERT INTO DEPARTMENT VALUES (D_SEQ.NEXTVAL, INITCAP(PI_DNAME), PI_DLOC );
            DBMS_OUTPUT.PUT_LINE('Department added');
            COMMIT;
        END IF;
END UPSERT_DEPT;
/