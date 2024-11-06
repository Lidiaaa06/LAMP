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
    
