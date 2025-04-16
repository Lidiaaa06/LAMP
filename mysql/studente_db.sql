CREATE DATABASE IF NOT EXISTS Scuola;
Use Scuola;


CREATE TABLE IF NOT EXISTS corso(
    id INT auto_increment PRIMARY KEY,
    nome varchar(100) not null
);

CREATE TABLE IF NOT EXISTS  studenti(
    matricola INT auto_increment PRIMARY KEY,
    cognome varchar (100) not null,
    nome varchar(50) not null,
    data_nascita date not null,
    corso_studi int not null,
    capogruppo int,
    FOREIGN KEY (corso_studi) REFERENCES corso(id)
);


CREATE TABLE IF NOT EXISTS valutazioni(
    id INT auto_increment PRIMARY KEY,
    studente_matricola int not null,
    corso_id int not null,
    voto int not null,
    data_valutazione date not null
);

