SELECT
	gy.gyarto_nev,
    t.tipus_nev,
    a.Alvazszam,
    a.Motorszam,
    a.Rendszam,
    a.Listaar,
    a.Gyartas_datuma,
    CASE 
        WHEN DATEDIFF(YEAR, a.Gyartas_datuma, GETDATE()) >= 15 THEN 'Öreg'
        WHEN DATEDIFF(YEAR, a.Gyartas_datuma, GETDATE()) BETWEEN 6 AND 14 THEN 'Középkorú'
        WHEN DATEDIFF(YEAR, a.Gyartas_datuma, GETDATE()) BETWEEN 3 AND 5 THEN 'Fiatal'
        ELSE 'Új'
    END AS Korosztaly
FROM
    Auto a  join gyarto gy on gy.gyarto_id = a.gyarto_fk
                join tipus t on t.tipus_id = a.tipus_fk