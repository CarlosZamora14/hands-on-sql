/*
 * NAME: Carlos Zamora
 * DATE: 04/04/2024
 */

-- Query #1
-- DESCRIPTION: Find information about customers living in New York City
SELECT
  id AS 'Customer ID',
  firstname AS 'First Name',
  lastname AS 'Last Name',
  city AS City,
  age AS Age
FROM
  customer_details
WHERE
  city = 'New York City'
ORDER BY
  city;

-- Query #2
-- DESCRIPTION: Find anyone who flew to New York City before the date of the crime
SELECT
  customer_id AS 'Customer ID',
  cusfname AS 'First Name',
  cuslname AS 'Last Name',
  start_city AS 'Departure City',
  dest_city AS 'Destination City',
  flightdate AS 'Flight Date'
FROM
  flight_details
WHERE
  dest_city = 'New York City'
  AND flightdate >= '2021-10-23';

-- Query #3
-- DESCRIPTION: Find anyone who flew from New York City after the painting was stolen
SELECT
  customer_id AS 'Customer ID',
  cusfname AS 'First Name',
  cuslname AS 'Last Name',
  start_city AS 'Departure City',
  dest_city AS 'Destination City',
  flightdate AS 'Flight Date'
FROM
  flight_details
WHERE
  start_city = 'New York City'
  AND flightdate >= '2021-10-23';

-- Query #4
-- DESCRIPTION: Messages sent a few days before and after the theft occurred
SELECT
  sender_id AS 'Sender ID',
  senderfname AS 'Sender First Name',
  senderlname AS 'Sender Last Name',
  receiver_id AS 'Recipient ID',
  recieverfname AS 'Recipient First Name',
  recieverlname AS 'Recipient Last Name',
  message AS 'Text Message',
  sent AS 'Date Sent'
FROM
  text_messages
WHERE
  sent BETWEEN '2021-10-20' AND '2021-10-25'
ORDER BY
  sent;

-- Query #5
-- DESCRIPTION: Messages sent by people on the list of suspects
SELECT
  sender_id AS 'Sender ID',
  senderfname AS 'Sender First Name',
  senderlname AS 'Sender Last Name',
  receiver_id AS 'Recipient ID',
  recieverfname AS 'Recipient First Name',
  recieverlname AS 'Recipient Last Name',
  message AS 'Text Message',
  sent AS 'Date Sent'
FROM
  text_messages
WHERE
  sender_id IN (32, 38, 100, 105, 106)
  AND sent BETWEEN '2021-10-20' AND '2021-10-25'
ORDER BY
  sent;
