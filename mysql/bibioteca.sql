-- Creare un nuovo database
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Creare la tabella degli autori
CREATE TABLE IF NOT EXISTS autori (
    id_autore INT AUTO_INCREMENT PRIMARY KEY,
    nome_autore VARCHAR(50) NOT NULL,
    nazionalita VARCHAR(50),
    data_nascita DATE,
    data_morte DATE
);

-- Inserire alcuni dati nella tabella degli autori
INSERT INTO autori (nome_autore, nazionalita, data_nascita, data_morte)
VALUES
    ('Jane Austen', 'Inglese', '1775-12-16', '1817-07-18'),
    ('George Orwell', 'Inglese', '1903-06-25', '1950-01-21'),
    ('Harper Lee', 'Americana', '1926-04-28', '2016-02-19');

-- Verifico il corretto inserimento dei dati
SELECT * FROM autori;











-- Creare un nuovo database
CREATE DATABASE IF NOT EXISTS videoteca;
USE videoteca;

-- Creare la tabella dei film
CREATE TABLE IF NOT EXISTS film (
    id_film INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    anno_uscita YEAR,
    durata_minuti INT,
    genere VARCHAR (100),
    id_regista INT,
    FOREIGN KEY (id_regista) REFERENCES regista(id_regista)
);

-- Inserire alcuni dati nella tabella dei film
INSERT INTO film (titolo, anno_uscita, durata_minuti, id_regista)
VALUES 
  ('1984',1984,110,'sci-fi',1),
  ('titanic',1997,194,'romantico',2),
  ('la carica dei 101',1961,79,'per famiglie',3),
  ('peter pan',1953,76,'per famiglie',4),
  ('nemo',2003,100,'per famiglie',5);

  SELECT * FROM film;

-- Creare la tabella degli registi
CREATE TABLE IF NOT EXISTS registi (
    id_registi INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    nazionalita VARCHAR(50),
    data_nascita DATE,
    data_morte DATE  
);

-- Inserire alcuni dati nella tabella degli registi 
INSERT INTO registi (nome, nazionalita, data_nascita, data_morte)
VALUES
('George Orwell', 'Inglese', 25-06-1903,21-01-1950),
('James Cameron','Canadese',16-08-1954),
('Wolfgang Reitherman','statunitense',26-06-1909,22-05-1985),
('J. M. Barrie','britannico',9-05-1860,19-06-1937),
('Andrew Stanton','statunitense',3-12-1965);

SELECT * FROM registi;

-- Creare la tabella dei clienti
CREATE TABLE IF NOT EXISTS clienti (
    matricola INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    FOREIGN KEY (id_film) REFERENCES film(id_film)
);

-- Inserire alcuni dati nella tabella degli registi 
INSERT INTO clienti (nome,cognome,email)
VALUES
('marco','rossi','marcorossi@gmail.com'),
('giulia','bianchi','giulietta05@gmail.com'),
('giorgio','verdi','gio_verdi@gmail.it'),
('martina','gialli','marty_99@gmail.it');

-- Verifico il corretto inserimento dei dati
SELECT * FROM clienti;
