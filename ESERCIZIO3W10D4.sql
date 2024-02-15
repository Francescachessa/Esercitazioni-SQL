-- ESERCIZIO 3 W10D4
-- ESERCIZIO 1: db_VIDEOGIOCHI.
-- Seleziona tutti gli impiegati con una laurea in Economia.
SELECT 
    *
FROM
    servizio_impiegato;
SELECT 
    *
FROM
    impiegato
WHERE
    TitoloStudio = ' Laurea in Economia';
    
    -- Seleziona gli impiegati che lavorano come Cassiere o che hanno un Diploma di Informatica. 
SELECT 
    i.nome, i.TitoloStudio, si.Carica
FROM
    impiegato i
        INNER JOIN
    servizio_impiegato si 
  ON i.CodiceFiscale = si.CodiceFiscale
WHERE
    i.TitoloStudio = 'Diploma di informatica'
        OR si.Carica = 'Cassiere';
        
    -- Seleziona i nomi e i titoli degli impiegati che hanno iniziato a lavorare dopo il 1 gennaio 2023. 
SELECT 
    i.nome, i.TitoloStudio, si.DataInizio
FROM
    impiegato i
        INNER JOIN
    servizio_impiegato si 
    ON i.CodiceFiscale = si.CodiceFiscale
    where DataInizio > '2023-01-01';
    
    -- Seleziona i titoli di studio distinti tra gli impiegati. 
SELECT DISTINCT TitoloStudio FROM impiegato;

    -- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".
SELECT * FROM impiegato WHERE TitoloStudio <> ' Laurea in Economia';

    --  Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi. 
SELECT 
    i.nome, i.TitoloStudio, si.DataInizio, si.Carica
FROM
    impiegato i
        INNER JOIN
    servizio_impiegato si 
    ON i.CodiceFiscale = si.CodiceFiscale
WHERE
    DataInizio > '2023-01-01'
        AND si.Carica = 'Commesso';

    -- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020. 
SELECT 
    Titolo, Sviluppatore, AnnoDistribuzione
FROM
    videogioco
WHERE
    AnnoDistribuzione = 2020;

    -- Seleziona i titoli dei videogiochi disponibili nei settori 1 o 3 del negozio 5. 
SELECT 
    Titolo, Settore
FROM
    collocazione_videogioco
WHERE
    CodiceStore = 5 AND Settore IN (1 , 3);
    
    -- Seleziona i negozi con più di 20 copie disponibili di almeno un videogioco.
    SELECT DISTINCT
    CodiceStore
FROM
    collocazione_videogioco
WHERE
    NumCopie > 20;
    
    
    
    
    
    
    
-- ESERCIZIO 2: db_STORESes2

-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti. 
SELECT 
    NomeProdotto, Prezzo
FROM
    prodotto
WHERE
    Prezzo > 50;

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti. 
SELECT 
    Nome, Email
FROM
    cliente
WHERE
    Nome LIKE 'A%';

-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini. 
SELECT 
    IDOrdine, IDProdotto, Quantità, Prezzo_totale
FROM
    dettaglio_ordine
WHERE
    Quantità > 10 OR Prezzo_totale < 100;

-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti.  
SELECT 
    NomeProdotto, Prezzo
FROM
    prodotto
WHERE
    NomeProdotto LIKE '%tech%';

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti. 
SELECT 
    Nome
FROM
    cliente
WHERE
    Email = '';

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti.
SELECT 
    NomeProdotto
FROM
    prodotto
WHERE
    NomeProdotto LIKE 'M%E';