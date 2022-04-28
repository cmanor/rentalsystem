-- #1
INSERT INTO rental_records
VALUES
(
  NULL,
  'SBA1111A',
  (SELECT customer_id FROM customers WHERE name = 'Angel'),
  curdate(),
  date_add(curdate(),INTERVAL 10 DAY),
  NULL
  );
-- #2
INSERT INTO rental_records
VALUES
(
  NULL,
  'GA5555E',
  (SELECT customer_id FROM customers WHERE name = 'Kumar'),
  date_add(curdate(), INTERVAL 1 DAY),
  date_add(curdate(), INTERVAL 3 MONTH),
  NULL
  );
-- #3
SELECT r.start_date, r.end_date, r.veh_reg_no,
        v.brand,
        c.name
FROM rental_records AS r
  INNER JOIN vehicles as v USING (veh_reg_no)
  INNER JOIN customers as c using (customer_id)
ORDER BY v.category, start_date;
-- #4
SELECT * 
FROM rental_records
WHERE end_date < curdate();
-- #5
SELECT r.veh_reg_no,
        c.name,
        r.start_date,
        r.end_date
FROM rental_records AS r
  INNER JOIN customers AS c USING (customer_id)
WHERE '2012-01-10'
BETWEEN start_date AND end_date;
-- #6
SELECT DISTINCT r.veh_reg_no,
        c.name,
        r.start_date,
        r.end_date
FROM rental_records AS r
  INNER JOIN customers AS c USING (customer_id)
WHERE curdate()
BETWEEN start_date AND end_date;
-- #7
SELECT *
FROM rental_records
WHERE '2012-01-03'
BETWEEN start_date
AND end_date
OR '2012-01-18'
BETWEEN start_date
AND end_date;
-- #8
SELECT DISTINCT v.veh_reg_no, v.brand, v.desc,
                r.start_date, r.end_date
FROM vehicles AS v
INNER JOIN rental_records AS r USING (veh_reg_no)
WHERE '2012-01-10'
BETWEEN start_date AND end_date;

-- #9
SELECT DISTINCT v.veh_reg_no, v.brand, v.desc,
                r.start_date, r.end_date
FROM vehicles AS v
INNER JOIN rental_records AS r USING (veh_reg_no)
WHERE '2012-01-03'
NOT BETWEEN start_date
AND end_date
OR '2012-01-18'
NOT BETWEEN start_date
AND end_date;

-- #10
SELECT DISTINCT v.veh_reg_no, v.brand, v.desc,
                r.start_date, r.end_date
FROM vehicles AS v
INNER JOIN rental_records AS r USING (veh_reg_no)
WHERE 'curdate()'
NOT BETWEEN start_date
AND end_date
OR 'date_add(curdate(),INTERVAL 10 DAY)'
NOT BETWEEN start_date
AND end_date;