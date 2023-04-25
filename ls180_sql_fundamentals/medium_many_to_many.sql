/*1. Set Up Database*/
createdb ls180_exos_mtm_billing
psql -d ls180_exos_mtm_billing

CREATE TABLE customers (
    id serial PRIMARY KEY,
    name text NOT NULL,
    payment_token char(8) NOT NULL UNIQUE
                          CONSTRAINT payment_token_valid CHECK (payment_token SIMILAR TO '[A-Z]{8}')
                                          --LS solution: CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
    id serial PRIMARY KEY,
    description text NOT NULL,
    price decimal(10, 2) NOT NULL CONSTRAINT price_pos CHECK (price >= 0.00)
);

--tests that should return an error
INSERT INTO customers (name, payment_token)
  VALUES ('test', '');
INSERT INTO customers (name, payment_token)
  VALUES ('test', '12345678');
INSERT INTO customers (name, payment_token)
  VALUES ('test', 'ABCDEFG8');
INSERT INTO customers (name, payment_token)
  VALUES ('test', 'ABCD FGH');
INSERT INTO customers (name, payment_token)
  VALUES ('test', 'ABcDEFGH');
INSERT INTO customers (name, payment_token)
  VALUES ('test', 'ABCDEFG');
INSERT INTO customers (name, payment_token)
  VALUES ('test', 'ABCDEFGHI');

INSERT INTO services (description, price)
  VALUES ('test', -0.01);
--end tests that should return an error

INSERT INTO customers (name, payment_token)
  VALUES ('Pat Johnson', 'XHGOAHEQ'),
         ('Nancy Monreal', 'JKWQPJKL'),
         ('Lynn Blake', 'KLZXWEEE'),
         ('Chen Ke-Hua', 'KWETYCVX'),
         ('Scott Lakso', 'UUEAPQPS'),
         ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
  VALUES ('Unix Hosting', 5.95),
         ('DNS', 4.95),
         ('Whois Registration', 1.95),
         ('High Bandwidth', 15.00),
         ('Business Support', 250.00),
         ('Dedicated Hosting', 50.00),
         ('Bulk Email', 250.00),
         ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
    id serial PRIMARY KEY,
    customer_id integer NOT NULL REFERENCES customers (id) ON DELETE CASCADE,
    service_id integer NOT NULL REFERENCES services (id), --do not use ON DELETE CASCADE
    UNIQUE (customer_id, service_id)
);


INSERT INTO customers_services (customer_id, service_id)
  VALUES (1, 1), (1, 2), (1, 3),
         (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
         (4, 1), (4, 4),
         (5, 1), (5, 2), (5, 6),
         (6, 1), (6, 6), (6, 7);


/*2.Get Customers With Services*/

SELECT DISTINCT customers.*
  FROM customers
       INNER JOIN customers_services
       ON customers.id = customers_services.customer_id;

/*3.Get Customers With No Services*/

SELECT customers.*
  FROM customers
       LEFT OUTER JOIN customers_services
       ON customers.id = customers_services.customer_id
 WHERE service_id IS NULL;

-- Further Exploration: Can you write a query that displays all customers with no services and all services that currently don't have any customers? The output should look like this:
  /*
   id |     name      | payment_token | id |     description     | price
  ----+---------------+---------------+----+---------------------+--------
    2 | Nancy Monreal | JKWQPJKL      |    |                     |
      |               |               |  8 | One-to-one Training | 999.00
  (2 rows)
  */
SELECT customers.*, services.*
  FROM customers
       FULL OUTER JOIN customers_services -- LEFT OUTER JOIN works too
       ON customers.id = customers_services.customer_id
       FULL OUTER JOIN services  -- mandatory to have FULL here
       ON services.id = customers_services.service_id
 WHERE service_id IS NULL
    OR customer_id IS NULL;


/*4. Get Services With No Customers*/
SELECT services.description
  FROM customers_services
       RIGHT OUTER JOIN services
       ON services.id = customers_services.service_id
  WHERE customer_id IS NULL;


/*5. Services for each Customer*/
SELECT customers.name,
       string_agg(services.description, ', ') AS services
  FROM customers
       LEFT OUTER JOIN customers_services
       ON customers.id = customers_services.customer_id
       LEFT OUTER JOIN services
       ON services.id = customers_services.service_id
 GROUP BY customers.id
 ORDER BY customers.id;

/*Bonus: display customers with number of services, including 0*/
SELECT customers.name,
       COUNT(customers_services.id)
 FROM customers
      LEFT OUTER JOIN customers_services
      ON customers.id = customers_services.customer_id
GROUP BY customers.id
ORDER BY "count";

--Further exploration: display each services in a different row
/* start with
SELECT customers.name,
     lag(customers.name)
       OVER (ORDER BY customers.name)
       AS previous,
     services.description
FROM customers
     LEFT OUTER JOIN customers_services
     ON customer_id = customers.id
     LEFT OUTER JOIN services
     ON services.id = service_id;
*/

SELECT CASE WHEN customers.name =
                 lag(customers.name) OVER (ORDER BY customers.name)
            THEN NULL
            ELSE customers.name
       END,
       services.description
  FROM customers
       LEFT OUTER JOIN customers_services
       ON customer_id = customers.id
       LEFT OUTER JOIN services
       ON services.id = service_id;


/*6. Services With At Least 3 Customers*/
SELECT services.description, COUNT(customers_services.id)
  FROM services
       LEFT OUTER JOIN customers_services
       ON services.id = customers_services.service_id
 GROUP BY services.id
HAVING COUNT(customers_services.id) >= 3;


/*7. Total Gross Income*/
SELECT SUM(service_total_income) AS gross
  FROM (SELECT (COUNT(customers_services.id) * services.price) AS service_income--, services.description, services.price, COUNT(customers_services.id)
          FROM services
               LEFT OUTER JOIN customers_services
               ON services.id = customers_services.service_id
         GROUP BY services.id) AS each_services_income;

  /*LS solution*/
SELECT SUM(services.price)
  FROM services
       INNER JOIN customers_services
       ON services.id = customers_services.service_id;


/*8. Add New Customer*/
INSERT INTO customers (name, payment_token)
  VALUES ('John Doe', 'EYODHLCN');
/*John Doe's id: 7
Unix Hosting's id: 1; DNS' id: 2; Whois Registration's id: 3*/
INSERT INTO customers_services (customer_id, service_id)
  VALUES (7, 1), (7, 2), (7, 3);


/*9. Hypothetically*/
--1. expecting income for services costing > $100
SELECT SUM(services.price)
  FROM services
       INNER JOIN customers_services
       ON services.id = customers_services.service_id
 WHERE services.price > 100;
--2. hypothetical maximum for those services
SELECT ((SELECT COUNT(customers.id) FROM customers) *
        (SELECT SUM(services.price)
           FROM services
          WHERE services.price > 100)
       ) AS test;
/*LS solution*/
SELECT SUM(services.price)
  FROM services
       CROSS JOIN customers
 WHERE services.price > 100;


/*10. Deleting Rows*/
-- Write the necessary SQL statements to delete the "Bulk Email" service and customer "Chen Ke-Hua" from the database.
DELETE FROM customers_services
 WHERE service_id = 7;
DELETE FROM services
 WHERE id = 7;
DELETE FROM customers
 WHERE id = 4;