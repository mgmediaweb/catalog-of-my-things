-- Creating games table

CREATE TABLE games (
    id INT  PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_played_at BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL 
);

-- Creating authors table

CREATE TABLE authors (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);


-- Creating books table

CREATE TABLE books (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(150) NOT NULL,
    cover_state VARCHAR(150) NOT NULL,
    publish_date DATE NOT NULL
);

-- Creating lable tables 

CREATE TABLE labels (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(150) NOT NULL,
    color VARCHAR(150) NOT NULL
);


-- Creating music album table  

CREATE TABLE music_albums (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL
); 

-- Creating genre table

CREATE TABLE geners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150) NOT NULL
); 
