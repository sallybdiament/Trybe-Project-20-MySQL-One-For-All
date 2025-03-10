DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.signatures(
      signature_id INT PRIMARY KEY AUTO_INCREMENT,
      signature_name VARCHAR(200) NOT NULL,
      signature_price FLOAT NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(200) NOT NULL,
      user_age INT,
      signature_id INT,
      signature_date DATE,
      FOREIGN KEY (signature_id) REFERENCES signatures(signature_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(200) NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(200) NOT NULL,
      artist_id INT NOT NULL,
      album_release_year YEAR,
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.songs(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      song_name VARCHAR(200) NOT NULL,
      artist_id INT NOT NULL,
      album_id INT NOT NULL,
      song_duration_seconds INT,
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
      FOREIGN KEY (album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.history(
      song_id INT NOT NULL,
      user_id INT NOT NULL,
      date_reproduction DATETIME,
      PRIMARY KEY (song_id, user_id),
      FOREIGN KEY (song_id) REFERENCES songs(song_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.followers(
      artist_id INT NOT NULL,
      user_id INT NOT NULL,
      PRIMARY KEY (artist_id, user_id),
      FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
      FOREIGN KEY (user_id) REFERENCES users(user_id)
  ) engine = InnoDB;

INSERT INTO SpotifyClone.signatures (signature_name, signature_price)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (user_name, user_age, signature_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 19, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO SpotifyClone.albuns (album_name, artist_id, album_release_year)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.songs (song_name, artist_id, album_id, song_duration_seconds)
  VALUES
    ('BREAK MY SOUL', 1, 1, 279),
    ('VIRGO''S GROOVE', 1, 1, 369),
    ('ALIEN SUPERSTAR', 1, 1, 116),
    ('Don''t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
    ('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ('Samba em Paris', 4, 6, 267),
    ('The Bard''s Song', 5, 7, 244),
    ('Feeling Good', 6, 8, 100);

INSERT INTO SpotifyClone.history (song_id, user_id, date_reproduction)
  VALUES
    (8, 1, '2022-02-28 10:45:55'),
    (2, 1, '2020-05-02 05:30:35'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 2, '2022-08-05 08:05:17'),
    (7, 2, '2020-01-02 07:40:33'),
    (10, 3, '2020-11-13 16:55:13'),
    (2, 3, '2020-12-05 18:38:30'),
    (8, 4, '2021-08-15 17:10:10'),
    (8, 5, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (7, 6, '2017-01-24 00:31:17'),
    (1, 6, '2017-10-12 12:35:20'),
    (4, 7, '2011-12-15 22:30:49'),
    (4, 8, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (3, 10, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.followers (artist_id, user_id)
  VALUES 
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (4, 4),
    (5, 5),
    (6, 5),
    (6, 6),
    (1, 6),
    (6, 7),
    (3, 9),
    (2, 10);
