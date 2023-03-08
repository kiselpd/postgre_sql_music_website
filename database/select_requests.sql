-- Название и год выхода альбомов, вышедших в 2018 году
SELECT name, release_date FROM albums
	WHERE release_date BETWEEN '2018-01-01' AND '2018-12-31';
	
-- Название и продолжительность самого длительного трека
SELECT name, duration FROM songs
	ORDER BY duration DESC 
	LIMIT 1;
	
-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM songs
	WHERE duration >='00:03:30';
	
-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM collections
	WHERE release_date BETWEEN '2018-01-01' AND '2020-12-31';
	
-- Исполнители, чьё имя состоит из одного слова
SELECT name FROM singers
	WHERE name NOT LIKE '% %';
	
-- Название треков, которые содержат слово «мой» или «my»
SELECT name FROM songs
	WHERE name LIKE '% my %' OR name LIKE '% мой %'; 