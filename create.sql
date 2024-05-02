CREATE TABLE szin (
    szin_id  INTEGER NOT NULL,
    szin_nev NVARCHAR(20) NOT NULL
);
ALTER TABLE szin ADD CONSTRAINT szin_pk PRIMARY KEY ( szin_id );
INSERT INTO szin(Szin_ID,Szin_nev)
VALUES
(0,'fekete'),
(1,'fehér'),
(2,'piros'),
(3,'kék'),
(4,'zöld'),
(5,'ezüst'),
(6,'citromsárga'),
(7,'narancs'),
(8,'lime'),
(9,'magenta'),
(10,'szürke'),
(11,'hupilila'),
(12,'indigókék'),
(13,'kékeszöld'),
(14,'zöldeskék'),
(15,'sötétkék'),
(16,'világoskék'),
(17,'bordó'),
(18,'sötétszürke')

CREATE TABLE tipus (
    tipus_id  INTEGER NOT NULL,
    tipus_nev NVARCHAR(20) NOT NULL
);
ALTER TABLE tipus ADD CONSTRAINT tipus_pk PRIMARY KEY ( tipus_id );
INSERT INTO tipus(Tipus_ID,Tipus_nev)
VALUES
(0,'Fabia'),
(1,'Civic'),
(2,'Corolla'),
(3,'Avensis'),
(4,'A4'),
(5,'A6'),
(6,'Astra'),
(7,'Insignia'),
(8,'Corsa'),
(9,'Vectra'),
(10,'Mokka'),
(11,'206'),
(12,'5008'),
(13,'Bora'),
(14,'Golf'),
(15,'Polo'),
(16,'Passat'),
(17,'Sharan'),
(18,'ASX'),
(19,'Outlander'),
(20,'I30'),
(21,'Panamera'),
(22,'Swift'),
(23,'Vitara'),
(24,'S-Cross'),
(25,'520d'),
(26,'740d'),
(27,'320i'),
(28,'Megane'),
(29,'Clio'),
(30,'Fiesta'),
(31,'Mondeo'),
(32,'Focus')


CREATE TABLE gyarto (
    gyarto_id  INTEGER NOT NULL,
    gyarto_nev NVARCHAR(20) NOT NULL
);
ALTER TABLE gyarto ADD CONSTRAINT gyarto_pk PRIMARY KEY ( gyarto_id );
ALTER TABLE gyarto ADD CONSTRAINT gyarto_gyarto_nev_un UNIQUE ( gyarto_nev );
INSERT INTO gyarto(Gyarto_ID,Gyarto_nev)
VALUES
(0,'Skoda'),
(1,'Honda'),
(2,'Toyota'),
(3,'Audi'),
(4,'Opel'),
(5,'Peugeot'),
(6,'Volkswagen'),
(7,'Mitsubishi'),
(8,'Hyundai'),
(9,'Porsche'),
(10,'Suzuki'),
(11,'BMW'),
(12,'Renault'),
(13,'Ford')


CREATE TABLE uzemanyag (
    uz_id  INTEGER NOT NULL,
    uz_nev NVARCHAR(20) NOT NULL
);
ALTER TABLE uzemanyag ADD CONSTRAINT uzemanyag_pk PRIMARY KEY ( uz_id );
ALTER TABLE uzemanyag ADD CONSTRAINT uzemanyag_uz_nev_un UNIQUE ( uz_nev );
INSERT INTO uzemanyag(Uz_ID,Uz_nev)
VALUES
(0,'benzin'),
(1,'dízel'),
(2,'elektromos'),
(3,'hybrid'),
(4,'plug-in hybrid'),
(5,'lpg')


CREATE TABLE auto (
    auto_id        INTEGER NOT NULL,
    alvazszam      NVARCHAR(40) NOT NULL,
    motorszam      NVARCHAR(40) NOT NULL,
    rendszam       NVARCHAR(7),
    km             INTEGER NOT NULL,
    kobcenti       INTEGER NOT NULL,
    listaar        INTEGER NOT NULL,
    gyartas_datuma DATE NOT NULL,
    uzemanyag_fk   INTEGER NOT NULL,
    gyarto_fk      INTEGER NOT NULL,
    tipus_fk       INTEGER NOT NULL,
    szin_fk        INTEGER NOT NULL
);
ALTER TABLE auto ADD CONSTRAINT auto_pk PRIMARY KEY ( auto_id );
ALTER TABLE auto ADD CONSTRAINT auto_rendszam_un UNIQUE ( rendszam );
ALTER TABLE auto ADD CONSTRAINT auto_alvazszam_un UNIQUE ( alvazszam );
ALTER TABLE auto ADD CONSTRAINT auto_motorszam_un UNIQUE ( motorszam );
ALTER TABLE auto
    ADD CONSTRAINT auto_gyarto_fk FOREIGN KEY ( gyarto_fk )
        REFERENCES gyarto ( gyarto_id );
ALTER TABLE auto
    ADD CONSTRAINT auto_szin_fk FOREIGN KEY ( szin_fk )
        REFERENCES szin ( szin_id );
ALTER TABLE auto
    ADD CONSTRAINT auto_tipus_fk FOREIGN KEY ( tipus_fk )
        REFERENCES tipus ( tipus_id );
ALTER TABLE auto
    ADD CONSTRAINT auto_uzemanyag_fk FOREIGN KEY ( uzemanyag_fk )
        REFERENCES uzemanyag ( uz_id );
INSERT INTO auto(Auto_ID,Alvazszam,Motorszam,Rendszam,Kobcenti,Listaar,Gyartas_datuma,Uzemanyag_FK,Szin_FK,Gyarto_FK,Tipus_FK,Km)
VALUES
(0,'C7TTPKCVHMCBVMV9','W0HJUYWREHDT','UAGQ568',1498,11900000,'2022.05.01',0,15,0,0,1504),
(1,'1CBASK8QHQ5PPESC','CPGPE1ZKY3RV','KAVE731',1339,3690000,'2012.09.01',2,1,1,1,195308),
(2,'Z6AAGQ24JCTJ8ZY3','KDNTPQVHT7F3','AQCW987',1995,3470000,'2011.02.01',0,5,12,28,360394),
(3,'M7UHS5TANPCDMTHV','E2R5J31GWD89','DPHC127',1586,5880000,'2017.05.01',2,4,10,23,288097),
(4,'8A9281YUQ7DCFPT1','T594FPYPPUEE','TCZG764',1598,2800000,'2010.06.01',0,1,6,14,284675),
(5,'XNE8LAM1ZKM58ZJF','R6NY56EXL6AU','AVWN911',1896,4510000,'2014.03.01',0,12,6,16,27634),
(6,'EWDMGNA6HMGX68UH','43WP0A38N6M6','VKFA084',1998,8290000,'2017.02.01',3,1,7,19,277024),
(7,'MG8K1NV479BX3MZA','3MCLPAP89QJ4','NBGP613',1995,10990000,'2018.12.01',5,0,11,25,73629),
(8,'4J0893BKKS827H9S','XGPKXDJVSL8E','EQRT148',1498,7850000,'2019.12.01',2,13,1,1,21404),
(9,'XHVGYLFE06GPHJSX','QA6BZBZFU8X6','VJKC839',999,5899000,'2023.02.01',1,17,12,29,2510),
(10,'9U00N6UEUSM7FCS9','QT4BQGYL50N6','TFER087',1968,7890000,'2016.09.01',4,5,3,4,221711),
(11,'9RSDC5MPAG2VTH0W','P13Z9GYKXBEE','TCRG578',1969,5999000,'2017.07.01',1,18,6,16,164893),
(12,'FSG6SCSU8Y17CQ2K','6FVCGRA4CJDB','MTTR530',973,299000,'1999.10.01',1,6,4,8,187622),
(13,'M7TN0PTMFXRAQHYP','BGBU1TP2VWL6','NRHQ386',1198,749000,'2006.05.01',2,10,0,0,78581),
(14,'6SD2J860TC062XS3','GP54V32WYF05','LSLS072',1582,1750000,'2009.03.01',1,4,8,20,234262),
(15,'20ZNM9P52C8Z66AL','FUQ8FHE5SHQH','AKRZ730',1390,1790000,'2009.06.01',1,5,6,14,297054),
(16,'FA98A7TYJMF1KWC0','SS4LKTSCAA52','XWDC173',2993,14990000,'2017.11.01',4,7,11,26,36037),
(17,'9RJTL97Y155YMS9U','F9VFYK74XCDL','KJRH733',1360,725000,'2003.12.01',0,16,5,11,317177),
(18,'79GJWFC3D7MNHRQJ','QVZMZ7MU6L05','YVHJ737',1390,1689000,'2009.03.01',1,12,6,15,173088),
(19,'D78JME06ZXYR9UX5','KZKDSJCQ8GCJ','NYMU035',1373,6990000,'2022.02.01',3,7,10,24,148174),
(20,'TUE76UC6WZYRDT2R','2PABRFN4WKA3','ZCDT327',1397,690000,'2003.04.01',4,4,0,0,150434),
(21,'25KR2W7RNSG97RAS','3LJJFK219UGY','JZZJ501',1998,2200000,'2008.04.01',4,7,2,3,258837),
(22,'7SR7YRY2R7ULT9FT','QSEGG5F6VLMU','CFRN353',1995,650000,'2005.01.01',1,2,2,2,178697),
(23,'63T9D8B0QBPGWGRE','T2JHC8KJ0ZFF','BXND452',1870,4289000,'2016.04.01',0,14,10,23,230415),
(24,'6GWDA5Z8W3VZU6Q6','40JLPT2HZPDK','BWMH332',1353,5470000,'2019.06.01',1,0,8,20,315479),
(25,'257LE029TTVRTHVZ','0BAAS9EN82L8','VKDD883',1199,4999000,'2021.04.01',0,5,4,6,245692),
(26,'SYJCP71RT8FFZ2T5','YJECYY00493L','RBYF626',3996,32500000,'2018.02.01',0,6,9,21,257337),
(27,'TEHPT229VD9ULW3S','GHZ838RN6W65','UTAK730',1596,4700000,'2013.07.01',2,1,13,30,244787),
(28,'D6L0383HVDHWAXZ8','B8HYHZDRFLLP','PSAR161',1595,1800000,'2008.11.01',0,12,6,16,88083),
(29,'71T26RE5G60GCWWG','QTAP8A0DJ0GL','EXME405',1199,8900000,'2023.06.01',1,16,4,6,61858),
(30,'957ULDBSM8LEHF3U','SCETVNEWRH1A','LGUP109',1499,4850000,'2019.08.01',5,5,13,32,277787),
(31,'BR1GRPPP87MGFW52','NZDB2DGNQ8DS','WNVV513',1598,2500000,'2011.12.01',1,12,6,14,347064),
(32,'PB4DH41ND36D9L1P','UQW7UW3WZS7E','FDCU152',1995,2100000,'2005.11.01',3,13,11,27,292818),
(33,'9JCEBE2KMP12B3PT','RGQ33VPDQAW2','BFQS609',1390,795000,'2001.12.01',2,0,12,29,171810),
(34,'K0WUTR65MVGJTSHN','VAXM8WPWEM3C','VLBR224',1242,3999000,'2019.03.01',3,1,10,22,322585),
(35,'3FYXWTZSZRN58SAF','BUCYG86YW43R','WQCS695',1998,12999000,'2021.05.01',2,4,4,7,15612),
(36,'WQW41JBBZ0S691ZA','EW0MAX9HNN44','TSZQ459',1395,4590000,'2016.07.01',1,5,6,14,183861),
(37,'L42TMT8BSD11PUPW','JMQBZLNB9Z55','AEEH774',2967,12970000,'2020.02.01',3,2,3,5,307869),
(38,'X1GFD0YDLGLH88NY','LB7Z2G0K9XM3','TGLP405',1798,900000,'2006.04.01',0,18,13,31,160105),
(39,'ALZ9Z7JXV21MCTBL','MALPMP27KV7C','BMHH935',1242,1450000,'2009.07.01',1,10,13,30,216435),
(40,'FXJH6NX2V2757YU4','90SW0GB2LNW1','KCCP587',1998,9810000,'2019.11.01',1,13,11,27,16220),
(41,'YZGU1JFZ4UTJLSM7','CPZWFHG8ZSQA','JRHK169',1896,1590000,'2006.11.01',4,2,6,16,121342),
(42,'DXWZATW9J637L8D2','6E6TBMNVT4KB','TNZV585',2171,1000000,'2003.10.01',4,15,11,27,111490),
(43,'8J3AYCTHUZ8R69ZK','E3XVNMRRAY64','GDRK468',1590,1399000,'2003.04.01',3,11,1,1,180450),
(44,'X5ACEX2EUJGEA8G4','SR5HGUD7R4B6','PHBV624',1969,5800000,'2013.05.01',4,10,6,17,229433),
(45,'TMPNHMW97QHJ8XFU','1263LJYCM4X7','QYTB971',1599,699000,'2003.07.01',4,12,4,9,307413),
(46,'ZNYZE9RHNQK51YG0','4LRPK8CLN424','FUGJ999',1560,2200000,'2011.03.01',1,15,5,12,138503),
(47,'DWZQU204AB22V3U6','915FF1W78S3A','MVHM754',1328,1299000,'2007.11.01',1,6,10,22,64331),
(48,'P22LQ09277A2LDZ9','EP9GDJGJ9H34','KDPG900',1124,689000,'2003.11.01',3,5,5,11,66196),
(49,'7NQFE510XJSMQZYF','0KM0BZMXTH41','SLJY246',1388,1599000,'2009.11.01',3,6,13,32,272230),
(50,'3S2UAU3E3TCF2ZN2','LX4PDRD73TQV','RBHB132',1198,1390000,'2009.04.01',3,8,0,0,10807),
(51,'RYGFAKKV9W2JRC94','YGTM6ZKUMUSR','TVEE634',1798,7690000,'2021.04.01',0,10,2,2,82286),
(52,'Z9QM5K7QGPBG84UQ','V8FGZ9BTPZ8M','GNFC559',1590,3999000,'2011.07.01',4,6,7,18,350305),
(53,'YYGA7N85JL0Q8HPW','QG3DAVQFYNUD','PDPW768',1598,2800000,'2010.09.01',2,10,6,14,163668),
(54,'E6N2R3RWV3X4CJ2W','TJ2TT9KEHE89','ZHJF139',1598,3099000,'2013.03.01',3,0,12,28,151449),
(55,'RF2TEZ0R0ZK8DGEE','B0QWESMBHM52','YXSR843',1199,9999999,'2023.02.01',3,1,4,10,3000),
(56,'V85BUY5GX39WKTAP','1ZPNUVD209ZA','TRML079',1968,2390000,'2009.08.01',5,16,3,4,191537),
(57,'SM6C71G9PX6VKPLT','44ZNYFSCXHG6','KMHF611',1490,1590000,'2007.01.01',1,2,10,22,354845),
(58,'ZY3VLF732JVFZ26S','MV2LTR5MPVHE','CKMQ525',1781,1900000,'2004.12.01',1,17,6,13,125591)


CREATE TABLE vevo (
    vevo_id   INTEGER NOT NULL,
    nev       NVARCHAR(40) NOT NULL,
    tel       NVARCHAR(15),
    szaml_cim NVARCHAR(100),
    ceges     CHAR(1) NOT NULL
);
ALTER TABLE vevo ADD CONSTRAINT vevo_pk PRIMARY KEY ( vevo_id );
ALTER TABLE vevo ADD CONSTRAINT vevo_tel_un UNIQUE ( tel );
INSERT INTO vevo(Vevo_ID,Nev,Tel,Szaml_cim,Ceges)
VALUES
(0,'Borbély Linda','06301643126','1694 Budapest, Farkas Bertalan út 94.','n'),
(1,'KI-THERM Épületgépészeti Kft.','06204675457','3330 Törökszentmiklós, Török Ignác utca 24.','i'),
(2,'Székely Zétény','06204276393','1265 Budapest, Péter út 49.','n'),
(3,'Magyar Richárd','06707842798','6502 Sopron, Béla utca 53.','n'),
(4,'Kelemen Anna','06309672545','4136 Tiszaújváros, Kozma út 164.','n'),
(5,'Vass Marietta','06701676237','1187 Budapest, Mártírok útja 2.','n'),
(6,'Liget Üdülőpark Kft.','06309081651','2170 Aszód, Deák Ferenc u. 8.','i'),
(7,'Váradi Antal','06203805590','1136 Budapest, Mikes Kelemen utca 18.','n'),
(8,'Magyar Péter','06701026928','8245 Sopron, Mirella utca 71.','n'),
(9,'Mészáros Barnabárs','06702229011','4737 Kaposvár, Dorián utca 9. 76.','n'),
(10,'AM-EXPERT Kft.','06207143855','2360 Gyál, Vecsési út 12.','i'),
(11,'Balla Anita','06308331310','4161 Budapest, Petőfi Sándor út 18/59.','n'),
(12,'Tamás Áron','06305893827','1706 Jászapáti, Dorottya út 3. 57.','n'),
(13,'Kabai Gumi-Szerviz Kft.','06309656243','4136 Tiszaújváros, Mátrai út 57.','i'),
(14,'Fekete Enikő','06202820813','3010 Zalaegerszeg, Eszterházy utca 56.','n'),
(15,'Váradi Zita','06203079175','6739 Debrecen, Petőfi Sándor utca 18.','n'),
(16,'Bakos Péter','06209162357','4658 Veszprém, Fekete utca 83.','n'),
(17,'Bognár János','06206924649','1389 Sopron, Zöld park 3. 4. emelet 1. ajtó','n'),
(18,'Budai Zoltán','06304290674','7714 Budapest, Pintér utca 13.','n'),
(19,'Szekeres Balázs','06308546447','1024 Budapest, Halász Mihály utca 31.','n'),
(20,'Kovács Attila','06707787288','1461 Budapest, Pap köz 9. 45. ajtó','n'),
(21,'Lakatos Aranka','06207086624','1488 Mosonmagyaróvár, Vilmos út 334. 54.','n'),
(22,'Tamás Fanni','06707675000','1787 Budapest, Horváth Pista utca 42.','n'),
(23,'Balla Zsóka','06700895560','5003 Tatabánya, Ady Endre utca 41.','n'),
(24,'Faragó Liza','06701447829','1023 Budapest, Andrássy út 122.','n'),
(25,'Fábián Ramóna','06201853556','9077 Budapest, Radnóti Miklós út 56.','n'),
(26,'Pál Gizella','06709427206','1763 Budapest, Barta udvar 40.','n'),
(27,'Szabó Kíra','06703518032','3897 Budapest, Kossuth út 94.','n'),
(28,'Dobos István','06708226621','8843 Veszprém, Faragó sor 22.','n'),
(29,'Kati Cukrászda Bt.','06203555377','3200 Gyöngyös, Karácsondi út 52.','i'),
(30,'Mészáros Szonja','06300839429','4626 Budapest, Dobó István utca 12.','n'),
(31,'ALFA-VILL 2002 Kft.','06701209186','1131 Budapest, Hunyadi út 141.','i'),
(32,'Szilágyi Árpád','06700000833','1131 Budapest, Kovács utca 141.','n'),
(33,'Novák Szabina','06700861328','3330 Törökszentmiklós, Vincze átjáró 85.','n'),
(34,'Balázs Ernő','06707944784','8327 Kecskemét, Átrium sor 248.','n'),
(35,'Darabos Zoltán','06201830538','1440 Budapest, Fülöp tér 7.','n')


CREATE TABLE eladas (
    szamla_id  INTEGER NOT NULL,
    osszeg_huf INTEGER NOT NULL,
    datum      DATE NOT NULL,
    vevo_fk    INTEGER NOT NULL,
    auto_fk    INTEGER NOT NULL
);
ALTER TABLE eladas ADD CONSTRAINT eladas_pk PRIMARY KEY ( szamla_id );
ALTER TABLE eladas
    ADD CONSTRAINT eladas_auto_fk FOREIGN KEY ( auto_fk )
        REFERENCES auto ( auto_id );
ALTER TABLE eladas
    ADD CONSTRAINT eladas_vevo_fk FOREIGN KEY ( vevo_fk )
        REFERENCES vevo ( vevo_id );
INSERT INTO eladas(Szamla_ID,Osszeg_HUF,Datum,Vevo_FK,Auto_FK)
VALUES
(0,870000,'2023.06.01',10,38),
(1,1750000,'2023.08.12',26,14),
(2,1500000,'2023.08.31',0,49),
(3,1000000,'2023.11.09',2,42),
(4,1590000,'2023.10.24',6,41),
(5,9810000,'2023.06.10',34,40),
(6,5899000,'2023.09.14',28,9),
(7,2150000,'2023.10.16',14,46),
(8,3950000,'2023.12.14',33,34),
(9,1790000,'2023.07.26',22,15),
(10,8600000,'2023.10.18',30,29),
(11,5880000,'2024.01.15',27,3),
(12,4500000,'2023.07.10',24,25),
(13,1900000,'2023.09.02',23,58),
(14,7690000,'2023.12.11',16,51),
(15,5999000,'2024.01.05',13,11),
(16,1689000,'2023.12.20',11,18),
(17,1800000,'2023.09.21',5,28),
(18,2500000,'2023.12.04',20,31),
(19,699000,'2023.07.05',17,45),
(20,14300000,'2023.11.07',3,16),
(21,4700000,'2023.08.23',31,27),
(22,8200000,'2024.01.10',1,6),
(23,1299000,'2024.01.06',29,47),
(24,1390000,'2023.08.23',19,50),
(25,12500000,'2023.09.30',7,35),
(26,2200000,'2023.08.15',25,21),
(27,7800000,'2023.10.11',21,8),
(28,3999000,'2023.09.23',35,52),
(29,9600000,'2023.11.24',4,55),
(30,280000,'2023.07.12',9,12),
(31,650000,'2023.10.03',18,22),
(32,750000,'2023.08.27',8,33),
(33,2300000,'2023.07.08',32,56)