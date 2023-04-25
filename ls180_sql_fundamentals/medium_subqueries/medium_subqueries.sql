/*1. Set Up the Database using \copy*/
CREATE DATABASE ls180_exos_subqueries_auction;
\c ls180_exos_subqueries_auction

CREATE TABLE bidders (
    id serial PRIMARY KEY,
    name text NOT NULL
);
CREATE TABLE items (
    id serial PRIMARY KEY,
    name text NOT NULL,
    initial_price decimal(6, 2) NOT NULL
      CHECK (initial_price BETWEEN 0.01 AND 1000.00),
    sales_price decimal(6, 2) --can be NULL
      CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);
CREATE TABLE bids (
    id serial PRIMARY KEY,
    bidder_id integer NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
    item_id integer NOT NULL REFERENCES items (id) ON DELETE CASCADE,
    amount decimal(6, 2) NOT NULL
      CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders (id, name) from bidders.csv csv header
\copy items (id, name, initial_price, sales_price) from items.csv csv header
\copy bids (id, bidder_id, item_id, amount) from bids.csv csv header
--(LS solution uses SQL syntax): \copy bidders FROM 'bidders.csv' WITH HEADER CSV


/*2. Conditional Subqueries: IN*/
SELECT name AS "Bid on Items"
  FROM items
 WHERE id IN
       (SELECT DISTINCT item_id
          FROM bids);

/*3. Conditional Subqueries: NOT IN*/
SELECT name AS "Not Bid On"
  FROM items
 WHERE id NOT IN
       (SELECT DISTINCT item_id
          FROM bids);

/*4. Conditional Subqueries: EXISTS*/
SELECT name
  FROM bidders
 WHERE EXISTS (SELECT 1 FROM bids WHERE bidder_id = bidders.id);
--Further exploration: using JOIN
/*DISTINCT would return the same results but in a different order; we can't use ORDER BY with DISTINCT, because the order can change depending on which of the duplicate rows are kept*/
SELECT bidders.name
  FROM bidders
       INNER JOIN bids
       ON bidders.id = bids.bidder_id
 GROUP BY bidders.id
 ORDER BY bidders.id; --this column must be used in the GROUP BY: it is possible to have several values for this column if grouped with a different one (not the case here because it is a primary key, but explains the error)

/*5. Query From a Transient Table*/
--1: subquery
SELECT COUNT(id) AS nb_of_bids
          FROM bids
         GROUP BY bidder_id;
--2
SELECT MAX(nb_of_bids)
  FROM (SELECT COUNT(id) AS nb_of_bids
          FROM bids
         GROUP BY bidder_id) AS nb_of_bids_for_each_bidders;

/*6. Scalar Subqueries*/
SELECT name,
       (SELECT COUNT(id)
          FROM bids
         WHERE item_id = items.id)
  FROM items;
--Further exploration
SELECT items.name, COUNT(bids.id)
  FROM items
       LEFT OUTER JOIN bids
       ON items.id = bids.item_id
 GROUP BY items.id
 ORDER BY items.id;

/*7. Row Comparison*/
-- We want to check that a given item is in our database. There is one problem though: we have all of the data for the item, but we don't know the id number. Write an SQL query that will display the id for the item that matches all of the data that we know, but does not use the AND keyword. Here is the data we know:

-- 'Painting', 100.00, 250.00
SELECT items.id
  FROM items
 WHERE ROW(name, initial_price, sales_price) =
       ROW('Painting', 100.00, 250.00);

/*8. EXPLAIN*/
-- First use just EXPLAIN, then include the ANALYZE option as well. For your answer, list any SQL statements you used, along with the output you get back, and your thoughts on what is happening in both cases.
EXPLAIN SELECT name FROM bidders
         WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
/*total cost: 61.54
EXPLAIN ANALYSE: time: 0.089*/
EXPLAIN SELECT bidders.name
          FROM bidders
               INNER JOIN bids
               ON bidders.id = bids.bidder_id
         GROUP BY bidders.id
         ORDER BY bidders.id;
/*total cost: 161.53
EXPLAIN ANALYSE: time: 0.105*/
EXPLAIN SELECT DISTINCT bidders.name
          FROM bidders
               INNER JOIN bids
               ON bidders.id = bids.bidder_id;
/*total cost: 87.74
EXPLAIN ANALYSE: time: 0.113 */
EXPLAIN ANALYSE SELECT bidders.name
         FROM bidders
        WHERE bidders.id IN (
              SELECT bidder_id
                FROM bids
              );
/*total cost: 61.54
EXPLAIN ANALYSE: time: 0.084 */


/*9. Comparing SQL Statements*/
EXPLAIN ANALYSE
  SELECT MAX(bid_counts.count) FROM
    (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
/*total cost: 36.26; time: 0.057
total time: 0.095*/
EXPLAIN ANALYSE
  SELECT COUNT(bidder_id) AS max_bid FROM bids
    GROUP BY bidder_id
    ORDER BY max_bid DESC
    LIMIT 1;
/*total cost: 34.75; time: 0.074
total time: 0.108*/

--Further exploration
EXPLAIN ANALYSE
SELECT name,
       (SELECT COUNT(id)
          FROM bids
         WHERE item_id = items.id)
  FROM items;
/*total cost: 24229.75; time: 0.095
total time: 0.130*/
EXPLAIN ANALYSE
SELECT items.name, COUNT(bids.id)
  FROM items
       LEFT OUTER JOIN bids
       ON items.id = bids.item_id
 GROUP BY items.id
 ORDER BY items.id;
/*total cost: 133.70; time: 0.135
total time: 0.184*/
