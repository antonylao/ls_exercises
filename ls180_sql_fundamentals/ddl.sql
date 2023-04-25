/*1. Create an Extrasolar Planetary Database*/
createdb extrasolar
psql -d extrasolar
CREATE TABLE stars (
    id serial PRIMARY KEY,
    name varchar(25) UNIQUE NOT NULL,
    distance integer NOT NULL CONSTRAINT distance_strict_pos CHECK (distance > 0),
    spectral_type char(1),
    companions integer NOT NULL CONSTRAINT companions_pos CHECK (companions >= 0)
    /* alternatives for constraints
    CONSTRAINT distance_strict_pos CHECK (distance > 0),
    CONSTRAINT companions_pos CHECK (companion >= 0)
    */
    -- constraint for spectral_type: must be O, B, A, F, G, K, or M
);

CREATE TABLE planets (
    id serial PRIMARY KEY,
    designation char(1) UNIQUE,
    mass integer
    -- constraint for designation: must be lowercase
);

/*2. Relating Stars and Planets*/
ALTER TABLE planets
  ADD COLUMN star_id integer NOT NULL REFERENCES stars (id);
/* NB: we can add NOT NULL constraint here because there is no data yet in the 'planets' table */

/*3. Increase Star Name Length*/
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

--Further exploration
/* Answer: If the stars table contains data already, changing from varchar(25) to varchar(50) is allowed. However, changing varchar(25) to say, varchar(10) would result in an error. You can use USING to specify how you want the conversion to be made. */

/*4. Stellar Distance Precision*/
ALTER TABLE stars
ALTER COLUMN distance TYPE decimal;
--Warning: from the SQL standard, it would make it scale (total nb of digits) to 0 (used in SQLServer, MySQL)

--Further exploration
/* Answer: If the stars table contains data already, changing from integer to numeric is supported without the USING clause. If we go the other way, the numbers are truncated (you can use USING to round it the the closest integer). */

/*5. Check Values in List*/
ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL;
ALTER TABLE stars
  ADD CONSTRAINT spectral_type_valid
/*(LS Solution)*/ CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));
 -- (my solution) CHECK ('{O, B, A, F, G, K, M}' @> ARRAY[spectral_type]);

/*test*/
INSERT INTO stars (name, distance, spectral_type, companions)
  VALUES ('Orion', 2.6, 'a', 2);

--Further exploration
/* setup */
ALTER TABLE stars
 DROP CONSTRAINT spectral_type_valid,
ALTER COLUMN spectral_type
 DROP NOT NULL;
INSERT INTO stars (name, distance, companions)
           VALUES ('Epsilon Eridani', 10.5, 0);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, 'X', 0);

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;
/* ERROR:  column "spectral_type" contains null values */

DELETE FROM stars
 WHERE name = 'Epsilon Eridani'; /* make sure there is only one entry */
ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;
/* ERROR:  check constraint "stars_spectral_type_check" is violated by some row */

/* Answer: the solution would be to update the rows not conforming, are delete them like so: */
DELETE FROM stars WHERE spectral_type NOT IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')
OR spectral_type IS NULL;
ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL,
  ADD CONSTRAINT spectral_type_valid
      CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));
-- (end further exploration)

/*6. Enumerated Types*/
ALTER TABLE stars
 DROP CONSTRAINT spectral_type_valid;
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
ALTER TABLE stars
ALTER COLUMN spectral_type
             TYPE spectral_type_enum
             USING spectral_type::spectral_type_enum;

/*7. Planetary Mass Precision*/
ALTER TABLE planets
ALTER COLUMN mass SET NOT NULL,
ALTER COLUMN mass TYPE decimal,
  ADD CONSTRAINT mass_strict_pos
      CHECK (mass > 0.0);
ALTER TABLE planets
ALTER COLUMN designation SET NOT NULL;

/*8. Add a Semi-Major Axis Column*/
ALTER TABLE planets
  ADD COLUMN semi_major_axis decimal NOT NULL;

--Further exploration
/* Answer: if the planets table already has rows of data, running the command will result in an error. We can set the NOT NULL constraint after having entered values for the new column, or set a default value for the new column */

/*setup*/
ALTER TABLE planets
 DROP COLUMN semi_major_axis;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
/*assumes the new row in 'stars' has an id of 1*/
INSERT INTO planets (designation, mass, star_id)
            VALUES ('b', 0.0036, 1);

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;
/* ERROR:  column "semi_major_axis" contains null values */
/* Solution */
ALTER TABLE planets
ADD COLUMN semi_major_axis decimal;
UPDATE planets
   SET semi_major_axis = 0.04
 WHERE designation = 'b';
ALTER TABLE planets
ALTER COLUMN semi_major_axis
             SET NOT NULL;
-- (end further exploration)

/*9.Add a Moons Table*/
CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CONSTRAINT designation_valid CHECK (designation > 0),
  semi_major_axis decimal CONSTRAINT semi_major_axis_strict_pos CHECK (semi_major_axis > 0.0),
  mass decimal CONSTRAINT mass_strict_pos CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets (id)
);

/*10.Delete the Database*/
/* We may want to create a dump before deleting the database: didn't do */
\c ec2-user
DROP DATABASE extrasolar;