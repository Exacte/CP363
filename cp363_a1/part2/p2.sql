SELECT 
    P.pname
FROM
    parts AS P
WHERE
    EXISTS( SELECT 
            *
        FROM
            catalog AS C
        WHERE
            C.pid = P.pid);

SELECT 
    S.sname
FROM
    suppliers AS S,
    parts AS P,
    catalog AS C
WHERE
    P.colour = 'green' AND P.pname = 'bolt'
        AND C.pid = P.pid
        AND C.sid = S.sid;

SELECT DISTINCT
    sid
FROM
    ((suppliers
    NATURAL JOIN catalog)
    NATURAL JOIN parts)
WHERE
    colour = 'red'
        AND sid NOT IN (SELECT 
            sid
        FROM
            ((suppliers
            NATURAL JOIN catalog)
            NATURAL JOIN parts)
        WHERE
            colour <> 'red');

SELECT 
    sname
FROM
    suppliers AS s
WHERE
    NOT EXISTS( SELECT 
            pid
        FROM
            parts AS P
        WHERE
            P.pid NOT IN (SELECT 
                    pid
                FROM
                    catalog AS C
                WHERE
                    S.sid = C.sid));
                    
                    
SELECT 
    s.sname
FROM
    Suppliers AS s,
    Catalog AS c,
    Parts AS p
WHERE
    s.sid = c.sid AND p.pid = c.pid
        AND p.colour = 'red'
GROUP BY s.sname
HAVING COUNT(*) = (SELECT 
        COUNT(*)
    FROM
        Parts AS p1
    WHERE
        p1.colour = 'red');

SELECT 
    pname
FROM
    ((suppliers
    NATURAL JOIN catalog)
    NATURAL JOIN parts)
WHERE
    sname = 'jones'
        AND pname NOT IN (SELECT 
            pname
        FROM
            ((suppliers
            NATURAL JOIN catalog)
            NATURAL JOIN parts)
        WHERE
            sname <> 'jones');
            
SELECT 
    P.pid, S.sname
FROM
    parts AS P,
    suppliers AS S,
    catalog AS C
WHERE
    C.pid = P.pid AND C.sid = S.sid
        AND C.cost = (SELECT 
            MIN(C1.cost)
        FROM
            catalog AS C1
        WHERE
            C1.pid = P.pid);

SELECT 
    S.sname, COUNT(*) AS PartCount
FROM
    ((suppliers AS S
    NATURAL JOIN catalog AS C)
    NATURAL JOIN parts AS P)
WHERE
    colour = 'green'
        AND sid NOT IN (SELECT 
            sid
        FROM
            ((suppliers
            NATURAL JOIN catalog)
            NATURAL JOIN parts)
        WHERE
            colour <> 'green')
GROUP BY S.sname , S.sid;