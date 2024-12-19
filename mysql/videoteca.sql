
-- Creare un nuovo database
CREATE DATABASE IF NOT EXISTS videoteca;
USE videoteca;

-- Creare la tabella dei generi
CREATE TABLE IF NOT EXISTS genere (
    id_genere INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

--creare tabella registi
CREATE TABLE IF NOT EXISTS registi (
    id_registi INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    nazionalita VARCHAR(50),
    data_nascita DATE,
    data_morte DATE
);

-- Creare la tabella dei film
CREATE TABLE IF NOT EXISTS film (
    id_film INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    anno_uscita YEAR,
    durata_minuti INT,
    genere VARCHAR (100),
    id_regista INT,
    FOREIGN KEY (id_regista) REFERENCES registi(id_registi)
);

-- Creare la tabella dei clienti
CREATE TABLE IF NOT EXISTS clienti (
    matricola INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    id_film INT NOT NULL,
    FOREIGN KEY (id_film) REFERENCES film(id_film)
);



-- Creare la tabella degli affitti
CREATE TABLE IF NOT EXISTS affiti (
    id_affitto INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_film INT,
    data_inizio DATE,
    data_fine DATE,
    FOREIGN KEY (id_cliente) REFERENCES clienti(matricola),
    FOREIGN KEY (id_film) REFERENCES film (id_film)
);



-- Inserire alcuni dati nella tabella dei film
INSERT INTO film (titolo, anno_uscita, durata_minuti,genere)
VALUES 
  ('1984',1984,110,'sci-fi'),
  ('titanic',1997,194,'romantico'),
  ('la carica dei 101',1961,79,'per famiglie'),
  ('peter pan',1953,76,'per famiglie'),
  ('nemo',2003,100,'per famiglie');

  SELECT * FROM film;
-- Inserire alcuni dati nella tabella degli registi 


-- Inserire alcuni dati nella tabella degli registi 
INSERT INTO registi (nome, nazionalita, data_nascita, data_morte)
VALUES
('George Orwell', 'Inglese', '1903-06-25','1950-01-21'),
('James Cameron','Canadese','1954-08-16', NULL),
('Wolfgang Reitherman','statunitense','1909-06-26','1985-05-07'),
('J. M. Barrie','britannico','1860-05-09','1937-06-19'),
('Andrew Stanton','statunitense','1965-12-03', NULL);

SELECT * FROM registi;

-- Inserire alcuni dati nella tabella dei generi
INSERT INTO genere (nome)
VALUES
('sci-fi'),
('romantico'),
('per famiglie');

-- Inserire alcuni dati nella tabella degli registi 
INSERT INTO clienti (id_film,nome,cognome,email)
VALUES
(1,'marco','rossi','marcorossi@gmail.com'),
(2,'giulia','bianchi','giulietta05@gmail.com'),
(3,'giorgio','verdi','gio_verdi@gmail.it'),
(4,'martina','gialli','marty_99@gmail.it');

-- Verifico il corretto inserimento dei dati
SELECT * FROM clienti;

-- Inserire alcuni dati nella tabella degli affitti 
INSERT INTO affiti (id_cliente, id_film, data_inizio, data_fine)
VALUES
(1,1,'2014-09-22','2015-06-06'),
(2,3,'2017-05-13','2017-09-30'),
(3,2,'2020-01-06','2020-01-21');

-- Verifico il corretto inserimento dei dati
SELECT * FROM affiti;
