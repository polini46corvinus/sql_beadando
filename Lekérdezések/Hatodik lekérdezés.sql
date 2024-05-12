select  gyarto_nev as 'Gyártó neve',
		rendszam as 'Rendszám',
        kobcenti as 'Köbcenti',
        dense_rank() over(order by kobcenti AsC, kobcenti) as 'Helyezés'
from auto JOIN gyarto ON auto.gyarto_fk = gyarto_id
group by gyarto_nev,rendszam,kobcenti