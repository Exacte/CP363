CREATE TABLE musicians(
	sin CHAR(6),
    name varchar(30) NOT NULL,
    PRIMARY KEY(sin)
);

CREATE TABLE albums (
    album_id INTEGER,
    producer_id CHAR(6) NOT NULL,
    release_date DATE,
    album_title VARCHAR(30) NOT NULL,
    price NUMERIC(5 , 2 ),
    PRIMARY KEY (album_id),
    FOREIGN KEY (producer_id)
        REFERENCES musicians (sin)
);
    
CREATE TABLE songs (
    song_id INTEGER,
    author_id CHAR(6) NOT NULL,
    song_title VARCHAR(30) NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (song_id),
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id),
    FOREIGN KEY (author_id)
        REFERENCES musicians (sin)
);

CREATE TABLE perform (
    song_id INTEGER,
    musician_id CHAR(6),
    album_id INTEGER,
    PRIMARY KEY (musician_id , song_id , album_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id),
    FOREIGN KEY (musician_id)
        REFERENCES musicians (sin),
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
);