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
