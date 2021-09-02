SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song;


SELECT
    Id,
    Title,
    ReleaseDate
FROM Song;

SELECT * FROM Song;

SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song
WHERE SongLength > 100;

SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

INSERT INTO Genre (Name) VALUES ('Techno');

select SongLength from Song where Id = 18;

-- The following is the output you get when you run the query above.
-- > 237

update Song
set SongLength = 515
where Id = 18;

-- Once you run the update statement, in order to make sure the value has changed, we run the select query again.
select SongLength from Song where Id = 18;
--> 515

delete from Song where Id = 18;



-- EXERCISES --
---------------
--1
SELECT * FROM Genre

--2
SELECT * FROM Artist a
    ORDER BY a.ArtistName

--3
SELECT s.Title, a.ArtistName FROM Song s
    INNER JOIN Artist a
    ON a.ID = s.ArtistId

--4
SELECT DISTINCT a.Id, a.ArtistName, a.YearEstablished 
    FROM Artist a
    INNER JOIN Album al
    ON a.id = al.artistId
    WHERE al.genreid = 1;

--5
SELECT DISTINCT a.ArtistName, a.Id, a.YearEstablished 
    FROM artist a
    INNER JOIN album al
    ON a.id = al.artistId
    WHERE al.genreid = 2 OR al.genreid = 4;

--6
SELECT al.Id, al.Title
    FROM Album al
    LEFT JOIN Song s
    ON al.Id = s.AlbumId
    WHERE s.Title IS NULL;


--7
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Radiohead', 1985); 

--8
INSERT INTO Album 
    (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
    VALUES ('Hail to the Thief', '06/09/2003', 3395, 'Parlophone/Capitol', 28, 2);
   
--9
INSERT INTO Song 
    (Title, SongLength, ReleaseDate, AlbumId, ArtistId, GenreId)
    VALUES ('There, There', 323, '05/26/2003', 23, 28, 2);


INSERT INTO Song 
    (Title, SongLength, ReleaseDate, AlbumId, ArtistId, GenreId)
    VALUES ('2 + 2 =5', 201, '11/17/2003', 23, 28, 2);

SELECT * FROM Song

--10
SELECT s.Title, al.Title, a.ArtistName
    FROM Album al
    LEFT JOIN Song s
    ON s.AlbumId = al.Id
    LEFT JOIN Artist a
    ON al.ArtistId = a.Id
    WHERE a.ArtistName LIKE 'radiohead';

--11
SELECT COUNT(s.Id) AS NumberOfSongs, al.Title
    FROM Song s
    LEFT JOIN Album al
    ON s.AlbumId = al.Id
    GROUP BY al.Title;

--12
SELECT COUNT(s.Id) AS NumberOfSongs, a.ArtistName
    FROM Song s
    LEFT JOIN Artist a
    ON s.ArtistId = a.Id
    GROUP BY a.ArtistName;

--13
SELECT COUNT(s.Id) AS NumberOfSongs, g.Name
    FROM Song s
    LEFT JOIN Genre g
    ON s.GenreId = g.Id
    GROUP BY g.Name;


