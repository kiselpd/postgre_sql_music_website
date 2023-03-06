-- таблица с жанрами
CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

-- таблица с исполнителями
CREATE TABLE IF NOT EXISTS Singers (
	singer_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

-- таблица с альбомами
CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date DATE NOT NULL 
);

-- таблица со сборниками
CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date DATE NOT NULL
);

-- таблица с песнями
CREATE TABLE IF NOT EXISTS Songs (
	song_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	duration TIME NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

-- отношение многие ко многим(сборники, песни)
CREATE TABLE IF NOT EXISTS Collections_Songs (
	id SERIAL PRIMARY KEY,
	collection_id INTEGER NOT NULL REFERENCES Collections(collection_id),
	song_id INTEGER NOT NULL REFERENCES Songs(song_id)
);

-- отношение многие ко многим(исполнители, альбомы)
CREATE TABLE IF NOT EXISTS Singers_Albums (
	id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES Singers(singer_id),
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

-- отношение многие ко многим(исполнители, жанры)
CREATE TABLE IF NOT EXISTS Singers_Genres (
	id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES Singers(singer_id),
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id)
