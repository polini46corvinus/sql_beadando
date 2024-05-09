SELECT 
    MONTH(Datum) AS Honap,
    Szamla_ID,
    Osszeg_HUF,
    Datum,
    Vevo_FK,
    Auto_FK
FROM Eladas
WHERE Osszeg_HUF > 4000000 AND MONTH(Datum) IN (
        SELECT MONTH(Datum)
        FROM Eladas
        WHERE Osszeg_HUF > 4000000)
ORDER BY Honap;