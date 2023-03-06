-- Descomente e altere as linhas abaixo:

-- DROP DATABASE IF EXISTS SpotifyClone;
-- CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- CREATE TABLE SpotifyClone.tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- CREATE TABLE SpotifyClone.tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
--   ('exemplo de dados 2', 'exemplo de dados Y');

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans (
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(75) NOT NULL,
    price DOUBLE NOT NULL
);

CREATE TABLE artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(75) NOT NULL
);

CREATE TABLE albuns (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(75) NOT NULL,
    release_year VARCHAR(75) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE musics (
	music_id INT PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(100) NOT NULL,
    music_length INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(75) NOT NULL,
    user_age SMALLINT NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
);

CREATE TABLE followers (
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
	FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE user_history (
	history_id INT PRIMARY KEY AUTO_INCREMENT,
    reproduction_date DATETIME NOT NULL,
    music_id INT NOT NULL,
	FOREIGN KEY (music_id) REFERENCES musics (music_id)
);

INSERT INTO plans (plan_name, price) VALUES
('gratuito', 00.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO artists (artist_name) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO albuns (album_name, release_year, artist_id) VALUES
('Renaissance', '2022', '1'),
('Jazz', '1978', '2'),
('Hot Space', '1982', '2'),
('Falso Brilhante', '1998', '3'),
('Vento de Maio', '2001', '3'),
('QVVJFA?', '2003', '4'),
('Somewhere Far Beyond', '2007', '5'),
('I Put A Spell On You', '2012', '6');

INSERT INTO musics (music_name, artist_id, album_id, music_length) VALUES 
('Break My Soul', '1', '1', '279'),
('Virgos\'s Groove', '1', '1', '369'),
('Alien Superstar', '1', '1', '116'),
('Don\'t Stop Me Now', '2', '2', '203'),
('Under Pressure', '2', '3', '152'),
('Como nossos Pais', '3', '4', '105'),
('O Medo de Amar é o Medo de Ser Livre', '3', '5', '207'),
('Samba em Paris', '4', '6', '267'),
('The Bard\'s Song', '5', '7', '244'),
('Feeling Good', '6', '8', '100');

INSERT INTO users (user_name, user_age, plan_id, signature_date) VALUES 
('Barbara Liskov', '82', '1', '2019-10-20'),
('Robert Cecil Martin', '58', '1', '2017-01-06'),
('Ada Lovelace', '37', '2', '2017-12-30'),
('Martin Fowler', '46', '2', '2017-01-17'),
('Sandi Metz', '58', '2', '2018-04-29'),
('Paulo Freire', '19', '3', '2018-02-14'),
('Bell Hooks', '26', '3', '2018-01-05'),
('Christopher Alexander', '85', '4', '2019-06-05'),
('Judith Butler', '45', '4', '2020-05-13'),
('Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO followers (user_id, artist_id) VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '2'),
('4', '4'),
('5', '5'),
('5', '6'),
('6', '6'),
('6', '1'),
('7', '6'),
('9', '3'),
('10', '2');