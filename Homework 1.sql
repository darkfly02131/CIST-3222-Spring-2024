ALTER SESSION SET CURRENT_SCHEMA= CAPECODD;


/* Question Number One*/
SELECT SKU_Description, SKU
FROM INVENTORY;

/* Question Number Two*/
SELECT DISTINCT WAREHOUSEID
FROM INVENTORY;


/*Question Number Three*/
SELECT *
FROM INVENTORY;

/* Question Number Four*/
SELECT SKU, SKU_Description, WAREHOUSEID
FROM  INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WAREHOUSEID ASC;

/* Question Number Five*/
SELECT SKU, SKU_Description, WAREHOUSEID
FROM  INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WAREHOUSEID DESC, SKU ASC;

/* Question Number Six*/
SELECT SKU, SKU_Description, WAREHOUSEID
FROM  INVENTORY
WHERE QuantityOnHand = 0 AND quantityonorder > 0
ORDER BY WAREHOUSEID DESC, SKU ASC;


/* Question Number Seven*/
SELECT SKU, SKU_Description, WAREHOUSEID
FROM  INVENTORY
WHERE QuantityOnHand = 0 OR quantityonorder = 0
ORDER BY WAREHOUSEID DESC, SKU ASC;


/* Question Number Eight*/
SELECT SKU, SKU_Description, WAREHOUSEID, QuantityOnHand
FROM  INVENTORY
WHERE QuantityOnHand > 1 AND quantityonhand < 10;

/* Question Number Nine*/
SELECT SKU, SKU_Description, WAREHOUSEID, QuantityOnHand
FROM  INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 9;

/* Question Number Ten*/
SELECT  DISTINCT SKU, SKU_Description
FROM  INVENTORY
WHERE SKU_Description LIKE '%Climb%';


/* Question Number Eleven*/
SELECT DISTINCT SKU, SKU_Description
FROM  INVENTORY
WHERE SKU_Description LIKE '__d%';


/* Question Number Twelve*/
SELECT  DISTINCT SKU, SKU_Description
FROM  INVENTORY
WHERE SKU_Description LIKE 'Half-dome%';

