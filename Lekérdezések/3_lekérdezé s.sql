SELECT gy.gyarto_nev, t.tipus_nev ,a.Alvazszam, a.Rendszam, a.Listaar
FROM Auto a LEFT JOIN Eladas e ON a.Auto_ID = e.Auto_FK
				join gyarto gy on gy.gyarto_id = a.gyarto_fk
                join tipus t on t.tipus_id = a.tipus_fk
WHERE e.Szamla_ID IS NULL;
