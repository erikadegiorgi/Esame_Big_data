--Creiamo delle tabelle per le entità con i relativi attributi e chiavi 

CREATE TABLE IF NOT EXISTS REGISTA (id_regista CHAR(9),
nome_r VARCHAR(15) NOT NULL,
cognome_r VARCHAR(15) NOT NULL, 
nazionalita VARCHAR(15) NOT NULL,
PRIMARY KEY(id_regista)
);

CREATE TABLE IF NOT EXISTS FILM (id_film CHAR(9), 
titolo VARCHAR(30) NOT NULL, 
genere VARCHAR(15) NOT NULL, 
durata INT NOT NULL, 
anno_uscita CHAR(4),
id_reg CHAR(9),
PRIMARY KEY(id_film),
FOREIGN KEY (id_reg) 
REFERENCES REGISTA (id_regista)
);

CREATE TABLE IF NOT EXISTS SALA (id_sala CHAR(9), 
capienza INT NOT NULL,
PRIMARY KEY(id_sala)
);

CREATE TABLE IF NOT EXISTS CLIENTE (id_cliente CHAR(9),
nome_c VARCHAR(15) NOT NULL, 
cognome_c VARCHAR(15) NOT NULL,
email VARCHAR(25) NOT NULL UNIQUE,
PRIMARY KEY (id_cliente )
);

CREATE TABLE IF NOT EXISTS SPETTACOLO (id_spettacolo CHAR(9),
data_s DATE, 
orario TIME,
n_sala CHAR(9),
cod_film CHAR(9),
PRIMARY KEY (id_spettacolo),
FOREIGN KEY (n_sala)
    REFERENCES SALA (id_sala),
FOREIGN KEY (cod_film)
    REFERENCES FILM (id_film)
);


DROP TABLE IF EXISTS BIGLIETTO;  --(la distruggiamo perchè dava problemi, preventivamente lo possiamo fare con tutte)

CREATE TABLE BIGLIETTO (
    id_biglietto INT PRIMARY KEY,
    posto_assegnato VARCHAR(10) NOT NULL,
    prezzo DECIMAL(5,2) NOT NULL,
    data_acquisto DATE NOT NULL,
    id_spettacolo CHAR(9),
    id_cliente CHAR(9),
    FOREIGN KEY (id_spettacolo) REFERENCES SPETTACOLO(id_spettacolo),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);


PRAGMA table_info(BIGLIETTO); -- (ricontrolliamo che la struttura della tabella vada bene)

