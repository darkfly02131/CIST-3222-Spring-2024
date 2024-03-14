ALTER SESSION SET CURRENT_SCHEMA= MI;


/*Question 1*/

SELECT SHIPMENTID, SHIPPERNAME, SHIPPERINVOICENUMBER
FROM SHIPMENT;

/*Question 2 */

SELECT SHIPMENTID, SHIPPERNAME, SHIPPERINVOICENUMBER
FROM SHIPMENT
WHERE insuredvalue > 10000.00;


/*Question 3 */
SELECT SHIPMENTID, SHIPPERNAME, SHIPPERINVOICENUMBER
FROM SHIPMENT
WHERE shippername LIKE 'AB%';

/*Question 4 */
SELECT MAX(insuredvalue) AS MaxInsuredValue, MIN(insuredvalue)AS MinInsuredValue
FROM SHIPMENT;

/*Question 5 */
SELECT ROUND(AVG(insuredvalue)) AS AVG_InsuredValue 
FROM SHIPMENT;

/*Question 6 */
SELECT COUNT(SHIPMENTID) AS NumberOfShipments
FROM SHIPMENT;

/*Question 7 */
SELECT ItemID, Description, Store, LocalcurrencyAmount * Exchangerate AS USCurrencyAmount
FROM ITEM;

/*Question 8 */

/*Question 9 */
SELECT ShipperName, ShipmentId, DepartureDate
FROM SHIPMENT
WHERE ShipmentID IN (
    SELECT shipmentid
    FROM SHIPMENT_ITEM
    WHERE VALUE >= 1000.00
)
ORDER BY ShipperName ASC, DepartureDate DESC;

/*Question 10 */
SELECT DISTINCT s.ShipperName, s.ShipmentID, s.Departuredate 
FROM SHIPMENT s
JOIN SHIPMENT_ITEM si ON s.ShipmentId = si.shipmentid
WHERE si.value >= 1000.00
ORDER BY s.ShipperName ASC, s.departuredate DESC;

/*Question 11 */
SELECT Shippername, Shipmentid, departuredate
FROM SHIPMENT
WHERE ShipmentID IN (
    SELECT si.ShipmentID
    FROM SHIPMENT_ITEM si
    WHERE si.itemid IN (
            SELECT i.itemid
            FROM ITEM i
            WHERE i.City = 'Singapore'
))
ORDER BY ShipperName ASC, DepartureDate DESC;

/*Question 12 */

SELECT DISTINCT s.Shippername, s.shipmentid, s.departuredate
FROM SHIPMENT s, SHIPMENT_ITEM si, ITEM i
WHERE s.Shipmentid = si.shipmentid
AND si.itemid = i.itemid
AND i.city = 'Singapore'
ORDER BY s.shippername ASC, s.departuredate DESC;

