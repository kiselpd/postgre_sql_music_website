-- вставка данных в раздел жанры
INSERT INTO genres("name")
	VALUES ('Pop'), ('Hip-Hop'), ('Rock'), ('Funk'), ('Jazz');

-- вставка данных в раздел исполнители
INSERT INTO singers("name")
	VALUES ('Ariana Grande'), ('Bruno Mars'), ('Drake'), ('AC/DC'),
	('Frank Sinatra'), ('Thundercat'), ('James Brown'), ('Travis Scott');
	
-- создание отношений между исполнителями и жанрами
INSERT INTO singers_genres("singer_id", "genre_id")
	VALUES (1, 1), (2, 1), (3, 2), (4, 3), (5, 5), (6, 4), (7, 4), (8, 2);
	
-- вставка данных в раздел альбомы
INSERT INTO albums("name", "release_date")
	VALUES ('24k Magic', '2016-11-17'), ('It will rain', '2011-09-27'), ('Views', '2016-04-29'),
	('Scorpion', '2020-06-29'), ('Highway to Hell', '1979-07-27'), ('My Way', '1969-03-01'),
	('Astroworld', '2018-08-03'), ('It Is What It Is', '2020-04-03'), ('Sweetener', '2018-08-17');
	
-- создание отношений между исполнителями и альбомами
INSERT INTO singers_albums("singer_id", "album_id")
	VALUES (1, 9), (2, 1), (2, 2), (3, 3), (3, 4), (4, 5), (5, 6), (8, 7), (6, 8);
	
-- вставка данных в раздел треки
INSERT INTO songs("name", "duration", "album_id")
	VALUES ('Chunky', '00:03:06', 1), ('It will rain', '00:04:17', 2), ('Finesse', '00:03:10', 1), 
	('With you', '00:03:15', 3), ('Talk Up', '00:03:16', 4), ('Controlla', '00:04:05', 3), 
	('Get It Hot', '00:02:34', 5), ('Touch To Much', '00:04:26', 5), ('Yesterday', '00:03:57', 6), 
	('SICKO MODE', '00:05:12', 7), ('WAKE UP', '00:03:51', 7), ('Overseas', '00:01:29', 8), 
	('Fair Chance', '00:03:58', 8), ('successful', '00:03:47', 9), ('R.E.M.', '00:04:05', 9), 
	('Shape of my heart', '00:04:38', 9);
	
-- вставка данных в раздел сборники
INSERT INTO collections("name", "release_date")
	VALUES ('Best-rap', '2020-10-05'), ('Best-pop', '2021-03-12'), ('For training', '2020-09-02'), 
	('For children', '2019-10-10'), ('For birthday', '2018-11-03'), ('Favourite Drake', '2022-03-19'), 
	('Hot', '2022-02-11'), ('For girl', '2020-02-02'), ('My favourite', '2020-11-28');

-- создание отношений между песнями и сборниками
INSERT INTO collections_songs ("song_id", "collection_id")
	VALUES (10, 1), (11, 1), (4, 1), (5, 1), (1, 2), (2, 2), (14, 2), (8, 3), (10, 3),
	(3, 3), (1, 4), (2, 4), (9, 4), (8, 5), (12, 5), (14, 5), (3, 5), (4, 6),
	(5, 6), (6, 6), (10, 7), (12, 7), (3, 7), (6, 7), (2, 8), (7, 8), (14, 8);
