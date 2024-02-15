-- ESERCIZIO 4 W11D1

-- ELENCO TABELLE
SHOW TABLES;

-- MOSTRA SOLO LE PRIME 10 RIGHE
SELECT 
    *
FROM
    album
LIMIT 10;

-- CONTA LE CANZONI 
SELECT 
    COUNT(distinct Name)
FROM
    track;

-- TROVA I DIVERSI GENERI IN GENRE
SELECT 
    *
FROM
    genre;
    
SELECT DISTINCT
    Name
FROM
    genre;
    
-- ELENCO DI TUTTE LE TRACCE CON NOME E GENERE ASSOCIATO.

SELECT * FROM track;

SELECT 
    tr.name, gn.name
FROM
    track AS tr
	LEFT JOIN
    genre AS gn ON tr.TrackId = gn.GenreId;

SELECT 
    at.name AS artist, ab.title AS album
FROM
    artist AS at
        LEFT JOIN
    album AS ab ON at.ArtistId = ab.ArtistId
WHERE
    ab.Title IS null;
    
-- ELENCO DI TUTTE LE TRACCE CON GENERE E TIPO DI MEDIA ASSOCIATO.    

SELECT 
    t.Name, g.Name, mt.Name
FROM
    track AS t
	LEFT JOIN
    genre AS g
     ON t.GenreId = g.GenreId
    LEFT JOIN 
    mediatype AS mt
   ON t.MediaTypeId = mt.MediaTypeId;

-- ELENCO DI TUTTI GLI ARTISTI CON I RISPETTIVI ALBUM.
SELECT 
    ar.name AS Artist, ab.title AS Album
FROM
    artist AS ar
        LEFT JOIN
    album AS ab 
    ON ar.ArtistId = ab.ArtistId;