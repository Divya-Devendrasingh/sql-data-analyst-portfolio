/*
===========================================================
09_gap_and_island_practice.sql

Topic      : Gap & Island Problems
Questions  : 10

Concepts   :
✓ ROW_NUMBER()
✓ CTE
✓ GROUP BY
✓ HAVING
✓ MIN()
✓ MAX()
===========================================================
*/

------------------------------------------------------------
DATASET
------------------------------------------------------------

Login

| login_id | user_id | login_date |
|----------|---------|------------|
| 1 | U1 | 2024-01-01 |
| 2 | U1 | 2024-01-02 |
| 3 | U1 | 2024-01-03 |
| 4 | U1 | 2024-01-05 |
| 5 | U1 | 2024-01-06 |
| 6 | U2 | 2024-01-01 |
| 7 | U2 | 2024-01-04 |
| 8 | U2 | 2024-01-05 |
| 9 | U3 | 2024-01-02 |
|10 | U3 | 2024-01-03 |

============================================================
Question 1
============================================================

Question:
Find users who logged in for at least 3 consecutive days.

Solution:

WITH LoginCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY login_date
) AS rn
FROM Login
),
IslandCTE AS
(
SELECT *,
login_date - rn AS island_group
FROM LoginCTE
)

SELECT
user_id,
COUNT(*) AS consecutive_days
FROM IslandCTE
GROUP BY user_id,island_group
HAVING COUNT(*)>=3;

============================================================
Question 2
============================================================

Question:
Display every consecutive login streak.

Solution:

WITH LoginCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY login_date
) rn
FROM Login
),
IslandCTE AS
(
SELECT *,
login_date-rn AS island_group
FROM LoginCTE
)

SELECT
user_id,
COUNT(*) AS streak
FROM IslandCTE
GROUP BY user_id,island_group;

============================================================
Question 3
============================================================

Question:
Display streak start date and end date.

Solution:

WITH LoginCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY login_date
) rn
FROM Login
),
IslandCTE AS
(
SELECT *,
login_date-rn AS island_group
FROM LoginCTE
)

SELECT
user_id,
MIN(login_date) AS start_date,
MAX(login_date) AS end_date,
COUNT(*) streak
FROM IslandCTE
GROUP BY user_id,island_group;

============================================================
Question 4
============================================================

Question:
Find the longest login streak for every user.

Solution:

WITH LoginCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY login_date
) rn
FROM Login
),
IslandCTE AS
(
SELECT *,
login_date-rn AS island_group
FROM LoginCTE
),
StreakCTE AS
(
SELECT
user_id,
COUNT(*) streak
FROM IslandCTE
GROUP BY user_id,island_group
)

SELECT
user_id,
MAX(streak) longest_streak
FROM StreakCTE
GROUP BY user_id;

============================================================
Question 5
============================================================

Question:
Find the user having the longest login streak.

Solution:

WITH LoginCTE AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY login_date
) rn
FROM Login
),
IslandCTE AS
(
SELECT *,
login_date-rn island_group
FROM LoginCTE
),
StreakCTE AS
(
SELECT
user_id,
COUNT(*) streak
FROM IslandCTE
GROUP BY user_id,island_group
)

SELECT *
FROM StreakCTE
ORDER BY streak DESC
LIMIT 1;
