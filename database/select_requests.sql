----------------------------------------------------------------------
-- Домашнее задание к лекции «SELECT-запросы, выборки из одной таблицы»
-----------------------------------------------------------------------

-- Название и год выхода альбомов, вышедших в 2018 году
SELECT name, release_date FROM albums
WHERE release_date BETWEEN '01-01-2018' AND '31-12-2018';
	
-- Название и продолжительность самого длительного трека
SELECT name, duration FROM songs
ORDER BY duration DESC 
LIMIT 1;
	
-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM songs
WHERE duration >='00:03:30';
	
-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM collections
WHERE release_date BETWEEN '01-01-2018' AND '31-12-2020';
	
-- Исполнители, чьё имя состоит из одного слова
SELECT name FROM singers
WHERE name NOT LIKE '% %';
	
-- Название треков, которые содержат слово «мой» или «my»
SELECT name FROM songs
WHERE name LIKE '% my %' OR name LIKE '% мой %';
	
---------------------------------------------------------
-- Домашнее задание к лекции «Продвинутая выборка данных»
---------------------------------------------------------

-- Количество исполнителей в каждом жанре
SELECT g.name, COUNT(s.genre_id)  FROM singers_genres AS s
LEFT JOIN genres AS g ON s.genre_id = g.genre_id
GROUP BY g.name;
	
-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(*) FROM songs AS s
RIGHT JOIN albums AS a ON a.album_id = s.album_id
WHERE a.release_date BETWEEN '01-01-2019' AND '31-12-2020';
	
-- Средняя продолжительность треков по каждому альбому
SELECT a.name, AVG(s.duration) FROM albums AS a
LEFT JOIN songs AS s ON s.album_id = a.album_id
GROUP BY a.name;
	
-- Все исполнители, которые не выпустили альбомы в 2020 году(!!!!!!!!!!!!!!!!!!!)
SELECT s.name FROM singers AS s
WHERE s.name NOT IN 
	(SELECT s2.name FROM singers AS s2
	LEFT JOIN singers_albums AS sa ON s.singer_id = sa.singer_id
	LEFT JOIN albums AS a ON sa.album_id = a.album_id
	WHERE a.release_date BETWEEN '01-01-2020' AND '31-12-2020'
	)
	
			
-- Названия сборников, в которых присутствует конкретный исполнитель (Travis Scott)
SELECT c.name FROM collections AS c
LEFT JOIN collections_songs AS cs ON c.collection_id = cs.collection_id
LEFT JOIN songs AS s ON cs.song_id = s.song_id
LEFT JOIN singers_albums AS sa ON s.album_id = sa.album_id
LEFT JOIN singers AS s2 ON sa.singer_id = s2.singer_id
WHERE s2.name ='Travis Scott'
GROUP BY c.name; 

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT a.name FROM albums AS a
LEFT JOIN singers_albums AS sa ON a.album_id = sa.album_id
LEFT JOIN singers_genres AS sg ON sa.singer_id = sg.singer_id
GROUP BY a.name
HAVING COUNT(DISTINCT sg.genre_id) > 1;

-- Наименования треков, которые не входят в сборники
SELECT s.name FROM songs AS s
left JOIN collections_songs AS cs ON s.song_id = cs.song_id
WHERE cs.collection_id IS NULL;
	
-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
SELECT s.name FROM singers AS s
LEFT JOIN singers_albums AS sa ON s.singer_id = sa.singer_id
LEFT JOIN songs AS s2 ON sa.album_id = s2.album_id
WHERE s2.duration =
	(SELECT MIN(songs.duration) FROM songs);
	
-- Названия альбомов, содержащих наименьшее количество треков
SELECT DISTINCT a.name  FROM albums AS a
LEFT JOIN songs AS s ON a.album_id = s.album_id
WHERE s.album_id IN 
	(SELECT s2.album_id FROM songs AS s2
	GROUP BY s2.album_id
	HAVING COUNT(s2.song_id) =
		(SELECT COUNT(s3.song_id) FROM songs s3 
		GROUP BY s3.album_id
		ORDER BY count
		LIMIT 1)
	);
