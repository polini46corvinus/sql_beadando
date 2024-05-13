SELECT auto_id,gyarto_nev, alvazszam,rendszam, datediff(year,gyartas_datuma,getdate()) as 'Ennyi éve gyártották',
		LAG(datediff(year,gyartas_datuma,getdate()),1,0) OVER(PARTITION BY gyarto_fk order by rendszam) as 'Előző autót ennyi ideje gyárották'
FROM auto JOIN gyarto ON auto.gyarto_fk = gyarto.gyarto_id
