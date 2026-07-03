--come esempi da inserire nelle slide ripercorriamo il percorso del film "Guida galattica per autostoppisti"

INSERT INTO REGISTA VALUES ('REG000006', 'Garth', 'Jennings', 'Britannica');

INSERT INTO FILM VALUES ('FLM000008', 'Guida galattica per autostoppisti', 'Commedia', 110, '2005', 'REG000006');

-- >>per vedere in quale sala viene proiettato
SELECT DISTINCT SA.id_sala 
FROM SPETTACOLO S
JOIN FILM F ON S.cod_film = F.id_film 
JOIN SALA SA ON S.n_sala = SA.id_sala
WHERE F.titolo = 'Guida galattica per autostoppisti';
-- >> dice SAL23 e SAL10

INSERT INTO SALA VALUES ('SAL23', 100);

-- >>per vedere in quali spettacoli viene proiettato il film 
SELECT SP.id_spettacolo, SP.data_s, SP.orario 
FROM SPETTACOLO SP
JOIN FILM F ON SP.cod_film  = F.id_film 
WHERE F.titolo  = 'Guida galattica per autostoppisti';

INSERT INTO SPETTACOLO VALUES ('SPT000023', '2026-08-13', '20:00:00', 'SAL23', 'FLM000008');

-- >> per vedere quali clienti hanno acquistato biglietti per gli spettacoli in cui si proietta il film
SELECT C.id_cliente , C.nome_c , C.cognome_c 
FROM CLIENTE C
JOIN BIGLIETTO B ON C.id_cliente = B.id_cliente
JOIN SPETTACOLO SP ON B.id_spettacolo  = SP.id_spettacolo 
JOIN FILM F ON SP.cod_film  = F.id_film 
WHERE F.TITOLO = 'Guida galattica per autostoppisti';
-->> lo guardano i clienti: 5,54,41,30,46

INSERT INTO CLIENTE VALUES ('CLI000005', 'Alessandro', 'Gialli', 'a.gialli@email.com');

-->> Ora voglio vedere quali sono gli id dei biglietti relativi agli spettacoli in cui si proietta guida galattica per autostoppisti
SELECT B.id_biglietto 
FROM BIGLIETTO B
JOIN SPETTACOLO S ON B.id_spettacolo  = S.id_spettacolo 
JOIN FILM F ON S.cod_film = F.id_film 
WHERE F.TITOLO = 'Guida galattica per autostoppisti';
-->533,559,584,636,689

INSERT INTO BIGLIETTO VALUES (533, 'C01', 7.5, '2026-08-08', 'SPT000113', 'CLI000005');



