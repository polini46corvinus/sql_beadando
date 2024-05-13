SELECT gyarto_nev, COUNT(*) AS 'Eladások száma'
FROM eladas JOIN auto on auto.auto_id = eladas.auto_fk JOIN gyarto ON auto.gyarto_fk = gyarto.gyarto_id
GROUP BY gyarto_nev
HAVING COUNT(*) > (SELECT COUNT(*) FROM eladas JOIN auto on auto.auto_id = eladas.auto_fk JOIN gyarto ON auto.gyarto_fk = gyarto.gyarto_id WHERE gyarto_nev = 'Skoda');
