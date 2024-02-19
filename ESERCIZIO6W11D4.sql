-- ESERCIZIO 6 W11D4
/* 1. Elencate il numero di tracce per ogni genere in ordine discendente, 
	  escludendo quei generi che hanno meno di 10 tracce.*/
SELECT 
    g.Name as Genre, COUNT(distinct t.name) AS NumTracks
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY g.name having NumTracks > 10
ORDER BY NumTracks DESC;

-- 2.Trovate le tre canzoni più costose.
SELECT 
    name, UnitPrice
FROM
    track
     ORDER by UnitPrice desc
     limit 3;

-- 3.Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
SELECT 
    ar.name as ArtistName, CAST(t.Milliseconds/60000 AS decimal(10,2)) as Minutes
FROM
    track t
        INNER JOIN
    album ab ON ab.AlbumId = t.AlbumId
        LEFT JOIN
    artist ar ON ar.ArtistId = ab.ArtistId
WHERE
    t.Milliseconds > 360000;

-- 4.Individuate la durata media delle tracce per ogni genere.
SELECT 
    t.GenreId,
    g.name AS Genre,
    CAST(AVG(Milliseconds) / 60000 AS decimal(10,2)) AS AVGMinutes
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY GenreId;

/* 5.Elencate tutte le canzoni con la parola “Love” nel titolo, 
	ordinandole alfabeticamente prima per genere e poi per nome.*/
SELECT 
    g.name AS Genre, t.Name AS SongTitle
FROM
    track t
inner join genre g on t.GenreId = g.GenreId
WHERE
    t.Name LIKE '%love%'
ORDER BY g.name , t.Name;
    
-- 6.Trovate il costo medio per ogni tipologia di media.
SELECT 
    t.mediatypeid,
    mt.Name AS MediaType,
    AVG(UnitPrice) AS AveagePrice
FROM
    track t
        INNER JOIN
    mediatype mt ON t.MediaTypeId = mt.MediaTypeId
GROUP BY t.MediaTypeId , mt.Name;

-- 7.Individuate il genere con più tracce.
SELECT 
    g.name AS Genre, COUNT(*) AS TrackNumber
FROM
    track t
        INNER JOIN
    genre g ON t.GenreId = g.GenreId
GROUP BY t.GenreId
ORDER BY TrackNumber DESC
LIMIT 1;
 
-- 8.Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones. 
/* query interna che id hanno i roll
SELECT COUNT(ab.title) AS AlbumNum
FROM artist ar LEFT JOIN
album ab ON ar.ArtistId = ab.ArtistId WHERE ar.Name LIKE '%stones%'*/

SELECT 
    ar.Name AS Artist, COUNT(ab.artistid) AS AlbumNum
FROM
    artist ar
        LEFT JOIN
    album ab ON ab.ArtistId = ar.ArtistId
GROUP BY ar.Name
HAVING AlbumNum = (SELECT 
        COUNT(ab.title) AS AlbumNum
    FROM
        artist ar
            LEFT JOIN
        album ab ON ar.ArtistId = ab.ArtistId
    WHERE
        ar.Name LIKE '%stones%');
                    
-- 9.Trovate l’artista con l’album più costoso.

SELECT 
    ar.Name AS ArtistName,
    ab.title AS Album,
    SUM(t.UnitPrice) AS Price
FROM
    track t
        LEFT JOIN
    album ab ON t.AlbumId = ab.AlbumId
        LEFT JOIN
    artist ar ON ar.ArtistId = ab.ArtistId
GROUP BY t.albumid
ORDER BY SUM(UnitPrice) DESC
LIMIT 1;
