/*1. Set Up Database*/
CREATE DATABASE ls180_exos_dml_workshop;
\c ls180_exos_dml_workshop
CREATE TABLE devices (
    id serial PRIMARY KEY,
    name text NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE parts (
/* many to one relationship with devices */
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices (id)
);

/*2.Insert Data for Parts and Devices*/
INSERT INTO devices (name)
            VALUES ('Accelerometer'),
                   ('Gyroscope');
/* Accelerometer id: 1, Gyroscope id: 2 */
INSERT INTO parts (part_number, device_id)
            VALUES (12, 1), (14, 1), (16, 1),
                   (31, 2), (33, 2), (35, 2), (37, 2), (39, 2),
                   (50, NULL), (54, NULL), (58, NULL);

/*3.INNER JOIN*/
SELECT devices.name, parts.part_number
  FROM devices
       INNER JOIN parts
       ON devices.id = parts.device_id;

/*4. SELECT part_number*/
SELECT * FROM parts
 WHERE substring(part_number::text from 1 for 1) = '3';
/*or*/
SELECT * FROM parts
 WHERE part_number::text LIKE '3%';

/*5. Aggregate Functions*/
SELECT devices.name, COUNT(parts.id) AS number_of_parts
  FROM devices
       LEFT OUTER JOIN parts
       ON devices.id = parts.device_id
  GROUP BY devices.name
/*6. ORDER BY*/
  ORDER BY devices.name DESC;

/*7. IS NULL and IS NOT NULL*/
-- Doesn't belong to a device
SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NOT NULL;
-- Does belong to a device
SELECT part_number, device_id
  FROM parts
 WHERE device_id IS NULL;

/*8. Oldest Device*/
/*setup*/
INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);
/*end setup*/

SELECT name AS oldest_device
  FROM devices
 ORDER BY created_at
 LIMIT 1;

/*9. UPDATE device_id*/
UPDATE parts
   SET device_id = 1
 WHERE part_number IN (37, 39);
/*or*/
UPDATE parts
   SET device_id = 1
 WHERE part_number IN (
       SELECT part_number
         FROM parts
        WHERE device_id = 2
        ORDER BY part_number DESC
        LIMIT 2
       );
--Further exploration
/*set the smallest part_number to Gyroscope*/
/*Gyroscope id: 2*/
UPDATE parts
   SET device_id = 2
 WHERE part_number =
       (SELECT min(part_number)
          FROM parts);

/*10. Delete Accelerometer*/
DELETE FROM devices
 WHERE id = 1;
/*
ERROR:  update or delete on table "devices" violates foreign key constraint "parts_device_id_fkey" on table "parts"
DETAIL:  Key (id)=(1) is still referenced from table "parts".
*/
DELETE FROM parts
 WHERE device_id = 1;
DELETE FROM devices
 WHERE id = 1;

--Further exploration
ALTER TABLE parts
 DROP CONSTRAINT parts_device_id_fkey,
  ADD CONSTRAINT parts_device_id_fkey
      FOREIGN KEY (device_id)
      REFERENCES devices (id)
      ON DELETE CASCADE;
DELETE FROM devices
 WHERE id = 1;

