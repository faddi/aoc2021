create table lines (x1 INT,y1 INT,x2 INT,y2 INT);
.mode csv
.header off
.import ./input.processed.csv lines

-- walk from starting point to end point
WITH RECURSIVE make_points(x1, y1, x2, y2)
    AS (
        -- start condition, only horizontal or vertical
        SELECT x1, y1, x2, y2 from (select * from lines where (x1 = x2 or y1 = y2) )
        UNION ALL
        SELECT x1 + 1, y1, x2, y2 from make_points
        WHERE x1 < x2
        UNION ALL
        SELECT x1 - 1, y1, x2, y2 from make_points
        WHERE x1 > x2
        UNION ALL
        SELECT x1, y1 + 1, x2, y2 from make_points
        WHERE y1 < y2
        UNION ALL
        SELECT x1, y1 - 1, x2, y2 from make_points
        WHERE y1 > y2
    )

-- count generated points with more than 1 occurance
select count(*) from (SELECT x1, y1 from make_points group by x1, y1 having count(*) > 1);