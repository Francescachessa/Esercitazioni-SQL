-- ESERCIZIO 2 W10D1

CREATE SCHEMA DB_STORESes2;

-- CREAZIONE TABELLE INSERENDO CHIAVI PRIMARIE.

CREATE TABLE PRODOTTO (
    IDProdotto INT NOT NULL UNIQUE,
    NomeProdotto VARCHAR(100),
    Prezzo DOUBLE,
    PRIMARY KEY (IDProdotto)
);

CREATE TABLE CLIENTE (
    IDCliente INT NOT NULL,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    PRIMARY KEY (IDCliente)
);

-- CREAZIONE TABELLE CON CHIAVI PRIMAERIE E CHIAVI ESTERNE.

CREATE TABLE ORDINE (
    IDOrdine INT NOT NULL UNIQUE,
    IDProdotto INT NOT NULL,
    IDCliente INT NOT NULL,
    Quantità INT NOT NULL,
    PRIMARY KEY (IDOrdine),
    FOREIGN KEY (IDProdotto)
        REFERENCES PRODOTTO (IDProdotto),
    FOREIGN KEY (IDCliente)
        REFERENCES CLIENTE (IDCliente)
);


INSERT INTO PRODOTTO (IDProdotto, NomeProdotto, Prezzo) VALUES
(1,'Tablet',300.00),
(2,'Mouse',20.00),
(3,'Tastiera',25.00),
(4,'Monitor',180.00),
(5,'HHD',90.00),
(6,'SSD',200.00),
(7,'RAM',100.00),
(8,'Router',80.00),
(9,'Webcam',45.00),
(10,'GPU',1250.00),
(11,'Trackpad',500.00),
(12,'Techmagazine',5.00);

INSERT INTO CLIENTE (IDCliente, Nome, Email) VALUES
(1,'Antonio',''),
(2,'Battista','battista@mailmail.it'),
(3,'Maria','maria@posta.it'),
(4,'Franca','franca@lettere.it'),
(5,'Ettore',''),
(6,'Arianna','arianna@posta.it'),
(7,'Piero','piero@lavoro.it');

INSERT INTO ORDINE (IDOrdine, IDProdotto, IDCliente, Quantità) VALUES
(1,2,3,10),
(2,6,5,2),
(3,5,1,3),
(4,1,4,1),
(5,9,6,1),
(6,4,7,2),
(7,11,6,6),
(8,10,7,2),
(9,3,3,3),
(10,3,2,1),
(11,2,4,1);

/* TABELLA CON CAMPO CALCOLATO: AGGIUNGO LE COLONNE UTILI AL PRODOTTO (ANCHE SE NON RICHIESTE) 
IN MODO DA POTER SUCCESSIVAMENTE AGGIUNGERE LA COLONNA CALCOLATA CON ALTER TABLE.
FONTE: 'https://learn.microsoft.com/it-it/sql/relational-databases/tables/specify-computed-columns-in-a-table?view=sql-server-ver16' */

CREATE TABLE DETTAGLIO_ORDINE (
    IDOrdine INT NOT NULL,
    IDProdotto INT NOT NULL,
    IDCliente INT NOT NULL,
    Prezzo DOUBLE,
    Quantità INT NOT NULL,
    UNIQUE (IDOrdine , IDProdotto , IDCliente),
    FOREIGN KEY (IDOrdine)
        REFERENCES ORDINE (IDOrdine),
    FOREIGN KEY (IDProdotto)
        REFERENCES PRODOTTO (IDProdotto),
    FOREIGN KEY (IDCliente)
        REFERENCES CLIENTE (IDCliente)
);

INSERT INTO DETTAGLIO_ORDINE (IDOrdine, IDProdotto, IDCliente, Prezzo, Quantità) VALUES
(1,2,3,20.00,10),
(2,6,5,200.00,2),
(3,5,1,90.00,3),
(4,1,4,300.00,1),
(5,9,6,45.00,1),
(6,4,7,180.00,2),
(7,11,6,500.00,6),
(8,10,7,1250.00,2),
(9,3,3,25.00,3),
(10,3,2,25.00,1),
(11,2,4,20.00,1);

ALTER TABLE DETTAGLIO_ORDINE ADD COLUMN Prezzo_totale DOUBLE AS (Prezzo * Quantità);

SELECT 
    *
FROM
    dettaglio_ordine;

-- PROVA CON COLONNA CALCOLATA IN FASE DI CREAZIONE.

CREATE TABLE DETTAGLIO_CALCOLATO (
    IDOrdine INT NOT NULL,
    IDProdotto INT NOT NULL,
    IDCliente INT NOT NULL,
    Prezzo DOUBLE,
    Quantità INT NOT NULL,
    Prezzo_totale INT AS (Prezzo * Quantità),
    UNIQUE (IDOrdine , IDProdotto , IDCliente),
    FOREIGN KEY (IDOrdine)
        REFERENCES ORDINE (IDOrdine),
    FOREIGN KEY (IDProdotto)
        REFERENCES PRODOTTO (IDProdotto),
    FOREIGN KEY (IDCliente)
        REFERENCES CLIENTE (IDCliente)
	);
    
INSERT INTO DETTAGLIO_CALCOLATO (IDOrdine, IDProdotto, IDCliente, Prezzo, Quantità) VALUES
(1,2,3,20.00,10),
(2,6,5,200.00,2),
(3,5,1,90.00,3),
(4,1,4,300.00,1),
(5,9,6,45.00,1),
(6,4,7,180.00,2),
(7,11,6,500.00,6),
(8,10,7,1250.00,2),
(9,3,3,25.00,3),
(10,3,2,25.00,1),
(11,2,4,20.00,1);

SELECT 
    *
FROM
    dettaglio_calcolato;