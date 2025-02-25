CREATE DATABASE IF NOT EXISTS Scuola;
Use Scuola;

create table Studenti (
    matricola int not null PRIMARY KEY
    nome varchar(50) not null,
    cognome varchar(50) not null,
)

create table Docente (
    id_doc int not null PRIMARY KEY
    nome varchar(50) not null,
    cognome varchar(50) not null,
)

create table Classe ( 
    id_classe int not null PRIMARY KEY,
    nome varchar(50) not null,
    materia varchar(50) not null,
    fk_doc int,
    fk_materia int,
    
    FOREIGN KEY (fk_doc) REFERENCES Docente (id_doc),
    FOREIGN KEY (fk_materia) REFERENCES Materia (id_materia),
)

create table Videogioco (
    id_videogioco int not null PRIMARY KEY,
    titolo varchar(50) not null,
    descr_b varchar(160),
    descr_e varchar (300) not null,
    monete int not null,
    immagini varchar(100),
    argomento varchar(200),

    FOREIGN KEY (argomento) REFERENCES argomento (pk_argomento),
)


create table Materia (
    id_materia int not null PRIMARY KEY,
    nome varchar(50) not null,
    fk_doc int,
    

    FOREIGN KEY (fk_doc) REFERENCES Docente (id_doc),
)

create table Class_stud (
    pk_class_stud int not null PRIMARY KEY,
    fk_class int not null,
    fk_stud int not null,

    
    FOREIGN KEY (fk_class)  references  Classe (id_classe),
    FOREIGN KEY (fk_stud) REFERENCES Studenti (matricola),
)

create table Class_video (
    pk_class_video int not null PRIMARY KEY,
    fk_class int not null,
    fk_video int not null,

    FOREIGN KEY (fk_class) REFERENCES Classe (id_classe),
    FOREIGN KEY (fk_video) REFERENCES Videogioco (id_videogioco),
)

create table monete (
    pk_monete int not null PRIMARY KEY,
    n_monete int not null,
    fk_video int not null,
    fk_stud int not null,

    FOREIGN KEY (fk_video) REFERENCES Videogioco (id_videogioco),
    FOREIGN KEY (fk_stud) REFERENCES Studenti (matricola),
)

create table immagini (
    pk_immagini int not null PRIMARY KEY,
    url varchar(100),
    fk_video int not null,

    FOREIGN KEY (fk_video) REFERENCES Videogioco (id_videogioco),
)


create table argomento (
    pk_argomenti int not null PRIMARY KEY,
    argomento varchar(200), 

    )