DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.planos (
        planos_ID INT AUTO_INCREMENT PRIMARY KEY,
        plano VARCHAR(100) NOT NULL,
        valor_plano FLOAT NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuarios (
        user_name VARCHAR(255) NOT NULL,
        usuario_id INT AUTO_INCREMENT PRIMARY KEY,
        idade INT NOT NULL,
        data_assinatura DATE NOT NULL,
        planos_ID INT NOT NULL,
        CONSTRAINT plano UNIQUE (usuario_id, planos_ID),
        FOREIGN KEY (planos_ID) REFERENCES planos(planos_ID)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artistas (
        artists_ID INT AUTO_INCREMENT PRIMARY KEY,
        name_artist VARCHAR(255) NOT NULL
    ) ENGINE = InnoDB;

CREATE TABLE
    SpotifyClone.albuns (
        album_id INT AUTO_INCREMENT PRIMARY KEY,
        albun_name VARCHAR(255) NOT NULL,
        artists_ID INT NOT NULL,
        ano_lancamento INT NOT NULL,
        FOREIGN KEY (artists_ID) REFERENCES artistas(artists_ID)
    ) ENGINE = InnoDB;

CREATE TABLE
    SpotifyClone.cancoes (
        song_ID INT AUTO_INCREMENT PRIMARY KEY,
        nome_cancao VARCHAR(255) NOT NULL,
        album_id INT NOT NULL,
        duracao_segundos INT NOT NULL,
        FOREIGN KEY (album_id) REFERENCES albuns(album_id)
    ) ENGINE = InnoDB;

CREATE TABLE
    SpotifyClone.historicos (
        usuario_id INT NOT NULL,
        song_ID INT NOT NULL,
        data_reproducao DATETIME NOT NULL,
        PRIMARY KEY (usuario_id, song_ID),
        FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
        FOREIGN KEY (song_ID) REFERENCES cancoes(song_ID)
    ) ENGINE = InnoDB;

CREATE TABLE
    SpotifyClone.following_artists (
        usuario_id INT NOT NULL,
        artists_ID INT NOT NULL,
        CONSTRAINT PRIMARY KEY (usuario_id, artists_ID),
        FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
        FOREIGN KEY (artists_ID) REFERENCES artistas(artists_ID)
    ) ENGINE = InnoDB;

INSERT INTO
    SpotifyClone.planos (plano, valor_plano)
VALUES ("gratuito", 0.00), ("familiar", 7.99), ("universitário", 5.99), ("pessoal", 6.99);

INSERT INTO
    SpotifyClone.usuarios (
        user_name,
        idade,
        data_assinatura,
        planos_ID
    )
VALUES (
        'Barbara Liskov',
        82,
        '2019-10-20',
        1
    ), (
        'Robert Cecil Martin',
        58,
        '2017-01-06',
        1
    ), (
        'Ada Lovelace',
        37,
        '2017-12-30',
        2
    ), (
        'Martin Fowler',
        46,
        '2017-01-17',
        2
    ), (
        'Sandi Metz',
        58,
        '2018-04-29',
        2
    ), (
        'Paulo Freire',
        19,
        '2018-02-14',
        3
    ), (
        'Bell Hooks',
        26,
        '2018-01-05',
        3
    ), (
        'Christopher Alexander',
        85,
        '2019-06-05',
        4
    ), (
        'Judith Butler',
        45,
        '2020-05-13',
        4
    ), (
        'Jorge Amado',
        58,
        '2017-02-17',
        4
    );

INSERT INTO
    SpotifyClone.artistas (name_artist)
VALUES ("Beyoncé"), ("Queen"), ("Elis Regina"), ("Baco Exu do Blues"), ("Blind Guardian"), ("Nina Simone");

INSERT INTO
    SpotifyClone.albuns (
        albun_name,
        ano_lancamento,
        artists_ID
    )
VALUES ('Renaissance', 2022, 1), ('Jazz', 1978, 2), ('Hot Space', 1982, 2), ('Falso Brilhante', 1998, 3), ('Vento de Maio', 2001, 3), ('QVVJFA?', 2003, 4), (
        'Somewhere Far Beyond',
        2007,
        5
    ), (
        'I Put A Spell On You',
        2012,
        6
    );

INSERT INTO
    SpotifyClone.cancoes (
        nome_cancao,
        album_id,
        duracao_segundos
    )
VALUES ("BREAK MY SOUL", 1, 279), ("VIRGO’S GROOVE", 1, 369), ("ALIEN SUPERSTAR", 1, 116), ("Don’t Stop Me Now", 2, 203), ("Under Pressure", 3, 152), ("Como Nossos Pais", 4, 105), (
        "O Medo de Amar é o Medo de Ser Livre",
        5,
        207
    ), ("Samba em Paris", 6, 267), ("The Bard’s Song", 7, 244), ("Feeling Good", 8, 100);

INSERT INTO
    SpotifyClone.historicos (
        usuario_id,
        song_ID,
        data_reproducao
    )
VALUES (1, 8, '2022-02-28 10:45:55'), (1, 2, '2020-05-02 05:30:35'), (1, 10, '2020-03-06 11:22:33'), (2, 10, '2022-08-05 08:05:17'), (2, 7, '2020-01-02 07:40:33'), (3, 10, '2020-11-13 16:55:13'), (3, 2, '2020-12-05 18:38:30'), (4, 8, '2021-08-15 17:10:10'), (5, 8, '2022-01-09 01:44:33'), (5, 5, '2020-08-06 15:23:43'), (6, 7, '2017-01-24 00:31:17'), (6, 1, '2017-10-12 12:35:20'), (7, 4, '2011-12-15 22:30:49'), (8, 4, '2012-03-17 14:56:41'), (9, 9, '2022-02-24 21:14:22'), (10, 3, '2015-12-13 08:30:22');

INSERT INTO
    SpotifyClone.following_artists (usuario_id, artists_ID)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);
