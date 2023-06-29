-- Active: 1687991058857@@127.0.0.1@3306

-- Práticas
CREATE TABLE if NOT EXISTS users(
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT UNIQUE NOT NULL,
    created_at TEXT DEFAULT(DATETIME()) NOT NULL
);
INSERT INTO users (id, name, email, password, created_at) VALUES
    ('u1', 'Samuel', 'samuel@example.com', 'password1', DATETIME('now')),
    ('u2', 'Ruan', 'ruan@example.com', 'password2', DATETIME('now')),
    ('u3', 'Dhouglas', 'dhouglas@example.com', 'password3', DATETIME('now'));

    DELETE FROM users WHERE id = 'u4';
    SELECT * FROM users;
    CREATE TABLE IF NOT EXISTS follows(
        follower_id TEXT,
        followed_id TEXT,
        FOREIGN KEY (follower_id) REFERENCES user(id),
        FOREIGN KEY (followed_id) REFERENCES user(id)
    );
    INSERT INTO follows (follower_id , followed_id)
    VALUES ('u1', 'u2'),
    ('u1', 'u3'),
    ('u2', 'u1');


   SELECT *
FROM follows
INNER JOIN users ON follows.follower_id = users.id;

    SELECT 
    users.id,
    users.name,
    users.email,
    users.created_at,
    follows.followed_id,
    usersFollowed.id AS followedName
    FROM users
    LEFT JOIN follows ON follows.followed_id = users.id
    INNER JOIN users AS usersFollowed ON follows.follower_id = usersFollowed.id;

    SELECT 
    users.id AS userId,
    users.name AS userName,
    users.email AS userEmail,
    users.password,
    users.created_at AS createdAt,
    follows.followed_id AS followedId,
    usersFollowed.name AS followedName
FROM users
LEFT JOIN follows ON follows.follower_id = users.id
LEFT JOIN users AS usersFollowed -- usersFollowed => tabela users apelidada
ON follows.followed_id = usersFollowed.id;


   SELECT *
FROM follows
RIGHT JOIN users ON follows.follower_id = users.id;


 ---------------------------------------------FIXACAO

 
CREATE TABLE IF NOT EXISTS trainers(
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME()) NOT NULL
);

INSERT INTO trainers (id, name, created_at) VALUES
    ('t1', 'Samuel', DATETIME('now')),
    ('t2', 'Ruan', DATETIME('now')),
    ('t3', 'Dhouglas', DATETIME('now'));

SELECT * FROM trainers;

CREATE TABLE IF NOT EXISTS pokemons(
    trainer_id TEXT,
    pokemon_id TEXT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (pokemon_id) REFERENCES trainers(id)
);

INSERT INTO pokemons (trainer_id, pokemon_id)
VALUES ('t1', 't2'),
('t1', 't3'),
('t2', 't1');

SELECT *
FROM pokemons
INNER JOIN trainers ON pokemons.trainer_id = trainers.id;

SELECT *
FROM pokemons
RIGHT JOIN trainers ON pokemons.trainer_id = trainers.id;