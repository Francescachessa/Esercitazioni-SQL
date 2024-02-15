-- ESERCIZIO 1 W10D1; CREAZIONE DB, CREAZIONE E POPOLAMENTO TABELLE.
create schema db_VIDEOGIOCHI;

-- REFRESH SCHEMAS E SET AS DEFAULT SCHEMA 'db_VIDEOGIOCHI'.

-- CREAZIONE TABELLA.
CREATE TABLE IMPIEGATO (
    CodiceFiscale VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    Nome VARCHAR(50),
    TitoloStudio VARCHAR(100),
    Recapito VARCHAR(100)
);
-- POPOLAMENTO TABELLA.
INSERT INTO IMPIEGATO (CodiceFiscale, Nome, TitoloStudio, Recapito) VALUES
 ("ABC12345XYZ67890","Mario Rossi"," Laurea in Economia","mario.rossi@email.com"),
 ("DEF67890XYZ12345"," Anna Verdi","Diploma di ragioneria","anna.verdi@email.com"),
 ("GHI12345XYZ67890","Luigi Bianchi","Laurea in informatica","luigi.bianchi@email.com"),
 ("JKL67890XYZ12345","Laura Neri","Laurea in lingue","laura.neri@email.com"),
 ("MNO12345XYZ67890","Andrea Moretti","Diploma di Geometra","andrea.moretti@email.com"),
 ("PQR67890XYZ12345","Giulia Ferrara","Laurea in Psicologia","giulia.ferrara@email.com"),
 ("STU12345XYZ67890","Marco Esposito","Diploma di Elettronica","marco.esposito@email.com"),
 ("VWX67890XYZ12345","Sara Romano","Laurea in Giurisprudenza","sara.romano@email.com"),
 ("YZA12345XYZ67890","Roberto De Luca","Diploma di Informatica","roberto.deluca@email.com"),
 ("BCD67890XYZ12345","Elena Santoro","Laurea in Lettere","elena.santoro@email.com");


CREATE TABLE SERVIZIO_IMPIEGATO (
    CodiceFiscale VARCHAR(20),
    CodiceStore INT NOT NULL UNIQUE,
    DataInizio DATE,
    DataFine DATE,
    Carica VARCHAR(100)
);

INSERT INTO SERVIZIO_IMPIEGATO (CodiceFiscale, CodiceStore, DataInizio, DataFine, Carica) VALUES
 ("ABC12345XYZ67890",1,'2023-01-01','2023-12-31',"Cassiere"),
 ("DEF67890XYZ12345",2,'2023-02-01','2023-11-30',"Commesso"),
 ("GHI12345XYZ67890",3,'2023-03-01','2023-10-31',"Magazziniere"),
 ("JKL67890XYZ12345",4,'2023-04-01','2023-09-30',"Addetto alle vendite"),
 ("MNO12345XYZ67890",5,'2023-05-01','2023-08-31',"Addetto alle pulizie"),
 ("PQR67890XYZ12345",6,'2023-06-01','2023-07-31',"Commesso"),
 ("STU12345XYZ67890",7,'2023-07-01','2023-06-30',"Commesso"),
 ("VWX67890XYZ12345",8,'2023-08-01','2023-05-31',"Cassiere"),
 ("YZA12345XYZ67890",9,'2023-09-01','2023-04-30',"Cassiere"),
 ("BCD67890XYZ12345",10,'2023-10-01','2023-03-31',"Cassiere");
 

CREATE TABLE STORE (
    CodiceStore INT NOT NULL UNIQUE PRIMARY KEY,
    IndirizzoFisico VARCHAR(100),
    NumeroTelefono VARCHAR(20)
);

INSERT INTO STORE (CodiceStore, IndirizzoFisico, NumeroTelefono) VALUES
(1,"Via Roma 123, Milano","+39 02 1234567"),
(2,"Corso Italia 456, Roma","+39 06 7654321"),
(3,"Piazza San Marco 789, Venezia","+39 041 9876543"),
(4,"Viale degli Ulivi 234, Napoli","+39 081 3456789"),
(5,"Via Torino 567, Torino","+39 011 8765432"),
(6,"Corso Vittorio Emanuele 890, Firenze","+39 055 2345678"),
(7,"Piazza del Duomo 123, Bologna","+39 051 8765432"),
(8,"Via Garibaldi 456, Genova","+39 010 2345678"),
(9,"Lungarno Mediceo 789, Pisa","+39 050 8765432"),
(10,"Corso Cavour 101, Palermo","+39 091 2345678");


CREATE TABLE VIDEOGIOCO (
    Titolo VARCHAR(150) NOT NULL UNIQUE PRIMARY KEY,
    Sviluppatore VARCHAR(100),
    AnnoDistribuzione YEAR,
    CostoAcquisto DOUBLE,
    Genere VARCHAR(100),
    Remake_di varchar(100)
);

INSERT INTO VIDEOGIOCO (Titolo, Sviluppatore, AnnoDistribuzione, CostoAcquisto, Genere) VALUES
('Fifa 2023','EA sports','2023',49.99,'Calcio'),
("Assasins's creed: Valhalla",'Ubisoft','2020',59.99,'Action'),
('Super Mario Odyssey','Niintendo','2017',39.99,'Platform'),
('The Last Of Us Part II','Naughty Dog','2020',69.99,'Action'), 
('Cyberpunk 2077','CD Projekt Red','2020',49.99,'RPG'),
('Animal Crossing: New Horizons','Nintendo','2020',54.99,'Simulation'),
('Call of Duty: Warzone','Infinity Ward','2020',0.00,'FPS'),
('The Legend of Zelda: Breath of the Wild','Nintendo','2017',59.99,'Aciorn-Adventure'),
('Fortnite','Epic Games','2017',0.00,'Battle Royale'),
('Red Dead Redemption 2','Rockstar Games','2018',39.99,'Action-Adventure');
