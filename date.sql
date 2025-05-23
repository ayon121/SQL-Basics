-- showing timezonw
SHOW TIMEZONE
-- Asia/Dhaka



-- showing timestant
SELECT now();
-- Result : 2025-05-24 02:20:15.361556+06


-- getting only date
SELECT CURRENT_DATE;
-- Result : 2025-05-24


-- TO_CHAR() is a very common function used to format dates and times as strings in a custom format.
SELECT TO_CHAR(now(), 'DD-MM-YYYY')
-- Result 24-05-2025




------------------------------------------------------------------------------------------------------------
-- INTERVAL keyword is used to represent a duration of time — like 5 days, 2 hours, 30 minutes, etc.
--  You can use it to add or subtract time from DATE, TIME, or TIMESTAMP values

-- Add 7 Days to Today
SELECT NOW() + INTERVAL '7 days' AS next_week;


-- Subtract 2 Hours from Current Time
SELECT NOW() - INTERVAL '2 hours' AS two_hours_ago;

-- Add a Complex Interval
SELECT NOW() + INTERVAL '1 month 10 days 3 hours' AS future_time;
------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------
-- The EXTRACT function in SQL (especially in PostgreSQL) is used to pull out a
--  specific part of a date/time value, like the year, month, day, hour, etc.


-- Extract Month from Current Date
SELECT EXTRACT(MONTH FROM NOW()) AS current_month;

-- Extract Day from Interval
SELECT EXTRACT(DAY FROM INTERVAL '3 days 5 hours') AS days_only;
------------------------------------------------------------------------------------------------------------



