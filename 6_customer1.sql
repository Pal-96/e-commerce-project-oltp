alter session set current_schema=App_admin;

SET SERVEROUTPUT ON

select * from vw_product_category;

select * from vw_product;

select * from customer1_view;

--1) Successfull order placed and inventory quantity deducted.
DECLARE
    v_latest_order_id NUMBER;
BEGIN

DBMS_OUTPUT.PUT_LINE('TEST CASE 1');

EXEC add_order(2 , 'Pending');


    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;
    
DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

EXEC add_user_product(1, 2, 24); 
add_user_product(2, v_latest_order_id, 12); 

--add_payment(v_latest_order_id, 'Credit Card', 'Failed');
EXEC add_payment(2, 'Credit Card', 'Completed');


END;
/

--select * from customer1_view;
--select * from customer2_view;
-----------------------------------------------------------------
-- 2) Payment Failed

DECLARE
    v_latest_order_id NUMBER;

BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 2');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 13); 
    add_user_product(2, v_latest_order_id, 14);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    --add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/
--EXEC add_payment(2, 'Credit Card', 'Completed');

-- 3) Placing order above the product quantity available.

DECLARE
    v_latest_order_id NUMBER;

BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 3');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 25); 
    add_user_product(2, v_latest_order_id, 25);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 4) Out of stock in warehouse1. Loop and take in products from the next warehouse to refill.

DECLARE
    v_latest_order_id NUMBER;

BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 4');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 18); 
    add_user_product(2, v_latest_order_id, 19);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 5) 

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 5');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(5, v_latest_order_id, 9);
    add_user_product(6, v_latest_order_id, 10);

    --add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 6)


DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 6');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(9, v_latest_order_id, 9); 
    add_user_product(10, v_latest_order_id, 10);

    --add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

20,20
25 - 11,10 
26 - error (12,12)
27 - (9,7)--17,18
28 - (12,12) --20, 21



-- 7)

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 7');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 6);
    add_user_product(2, v_latest_order_id, 6);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 8)

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 8');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 25);
    add_user_product(2, v_latest_order_id, 25);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 9)


DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 9');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 15);
    add_user_product(2, v_latest_order_id, 15);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 10)

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 10');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 10);
    add_user_product(2, v_latest_order_id, 10);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 11)

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 11');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 9);
    add_user_product(2, v_latest_order_id, 5);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/

-- 12)

DECLARE
    v_latest_order_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TEST 12');

    add_order(2 , 'Pending');

    -- Fetch the latest order_id for user_id = 2
    SELECT MAX(order_id) INTO v_latest_order_id
    FROM customer1_view;

    DBMS_OUTPUT.PUT_LINE('Latest Order ID: ' || v_latest_order_id);

    add_user_product(1, v_latest_order_id, 9);
    add_user_product(2, v_latest_order_id, 5);

    add_payment(v_latest_order_id, 'Credit Card', 'Failed');
    add_payment(v_latest_order_id, 'Credit Card', 'Completed');
END;
/