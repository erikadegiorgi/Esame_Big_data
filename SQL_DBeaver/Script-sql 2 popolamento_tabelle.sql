--popoliamo le tabelle (1) 
 
--1. POPOLAMENTO REGISTI (Aggiunti nuovi registi storici)
INSERT INTO REGISTA VALUES ('REG000001', 'Christopher', 'Nolan', 'Britannica');
INSERT INTO REGISTA VALUES ('REG000002', 'Steven', 'Spielberg', 'Americana');
INSERT INTO REGISTA VALUES ('REG000003', 'Quentin', 'Tarantino', 'Americana');
INSERT INTO REGISTA VALUES ('REG000004', 'Martin', 'Scorsese', 'Americana');
INSERT INTO REGISTA VALUES ('REG000005', 'Hayao', 'Miyazaki', 'Giapponese');
INSERT INTO REGISTA VALUES ('REG000006', 'Garth', 'Jennings', 'Britannica');
INSERT INTO REGISTA VALUES ('REG000007', 'Terry', 'Jones', 'Britannica');
-- 2. POPOLAMENTO FILM (Ampliata la varietà di generi)

INSERT INTO FILM VALUES ('FLM000001', 'Inception', 'Sci-Fi', 148, '2010', 'REG000001');
INSERT INTO FILM VALUES ('FLM000002', 'Interstellar', 'Sci-Fi', 169, '2014', 'REG000001');
INSERT INTO FILM VALUES ('FLM000003', 'Jurassic Park', 'Avventura', 127, '1993', 'REG000002');
INSERT INTO FILM VALUES ('FLM000004', 'Schindlers List', 'Drammatico', 195, '1993', 'REG000002');
INSERT INTO FILM VALUES ('FLM000005', 'Pulp Fiction', 'Thriller', 154, '1994', 'REG000003');
INSERT INTO FILM VALUES ('FLM000006', 'Shutter Island', 'Thriller', 138, '2010', 'REG000004');
INSERT INTO FILM VALUES ('FLM000007', 'La Città Incantata', 'Animazione', 125, '2001', 'REG000005');
INSERT INTO FILM VALUES ('FLM000008', 'Guida galattica per autostoppisti', 'Commedia', 110, '2005', 'REG000006');
INSERT INTO FILM VALUES ('FLM000009', 'Brian di Nazareth', 'Commedia', 94, '1979', 'REG000007');
-- 3. POPOLAMENTO SALE (Aggiunte più sale con capienze diverse)

INSERT INTO SALA VALUES ('SAL01', 150); -- Sala Grande IMAX
INSERT INTO SALA VALUES ('SAL02', 80);  -- Sala Media
INSERT INTO SALA VALUES ('SAL03', 50);  -- Sala Small/3D
INSERT INTO SALA VALUES ('SAL04', 120);


-- 4. POPOLAMENTO SPETTACOLI (Orari e sale incrociate)

-- Spettacoli per Inception (ID 10)
-- Spettacoli per Inception (FLM000001)
INSERT INTO SPETTACOLO VALUES ('SPT000001', '2026-06-30', '18:30:00', 'SAL01', 'FLM000001');
-- Spettacoli per Interstellar (FLM000002)
INSERT INTO SPETTACOLO VALUES ('SPT000002', '2026-06-30', '21:15:00', 'SAL01', 'FLM000002');
-- Spettacoli per Jurassic Park (FLM000003)
INSERT INTO SPETTACOLO VALUES ('SPT000003', '2026-06-30', '20:00:00', 'SAL02', 'FLM000003');
-- Spettacoli per Interstellar (FLM000002)
INSERT INTO SPETTACOLO VALUES ('SPT000004', '2026-07-01', '17:00:00', 'SAL04', 'FLM000002');
INSERT INTO SPETTACOLO VALUES ('SPT000005', '2026-07-01', '21:00:00', 'SAL01', 'FLM000002');
-- Spettacoli per Pulp Fiction (FLM000005)
INSERT INTO SPETTACOLO VALUES ('SPT000006', '2026-07-01', '22:30:00', 'SAL03', 'FLM000005');
-- Spettacoli per La Città Incantata (FLM000007)
INSERT INTO SPETTACOLO VALUES ('SPT000007', '2026-07-02', '16:00:00', 'SAL02', 'FLM000007');

-- 5. POPOLAMENTO CLIENTI (Nuovi clienti per simulare acquisti multipli)

INSERT INTO CLIENTE VALUES ('CLI000001', 'Mario', 'Rossi', 'mario.rossi@email.com');
INSERT INTO CLIENTE VALUES ('CLI000002', 'Erika', 'Verdi', 'erika.verdi@email.com');
INSERT INTO CLIENTE VALUES ('CLI000003', 'Luca', 'Bianchi', 'luca.bianchi@email.com');
INSERT INTO CLIENTE VALUES ('CLI000004', 'Giulia', 'Neri', 'giulia.neri@email.com');
INSERT INTO CLIENTE VALUES ('CLI000005', 'Alessandro', 'Gialli', 'a.gialli@email.com');


-- 6. POPOLAMENTO BIGLIETTI (Acquisti per diversi spettacoli e posti)

INSERT INTO BIGLIETTO VALUES (501, 'A12', 8.50, '2026-06-29', 'SPT000001', 'CLI000001');
INSERT INTO BIGLIETTO VALUES (502, 'A13', 8.50, '2026-06-29', 'SPT000001', 'CLI000002');
INSERT INTO BIGLIETTO VALUES (503, 'C01', 8.50, '2026-06-29', 'SPT000001', 'CLI000003');

-- Biglietti per Spettacolo SPT000002 (Interstellar - Sala 1)
INSERT INTO BIGLIETTO VALUES (504, 'B04', 7.50, '2026-06-29', 'SPT000002', 'CLI000001');
INSERT INTO BIGLIETTO VALUES (505, 'B05', 7.50, '2026-06-30', 'SPT000002', 'CLI000004');

-- Biglietti per Spettacolo SPT000003 (Jurassic Park - Sala 2)
INSERT INTO BIGLIETTO VALUES (506, 'F10', 8.50, '2026-06-28', 'SPT000003', 'CLI000002');
INSERT INTO BIGLIETTO VALUES (507, 'F11', 8.50, '2026-06-28', 'SPT000003', 'CLI000003');

-- Biglietti per Spettacolo SPT000005 (Interstellar - Sala 1)
INSERT INTO BIGLIETTO VALUES (508, 'H08', 9.00, '2026-06-30', 'SPT000005', 'CLI000004');
INSERT INTO BIGLIETTO VALUES (509, 'H09', 9.00, '2026-06-30', 'SPT000005', 'CLI000005');

-- Biglietti per Spettacolo SPT000006 (Pulp Fiction - Sala 3)
INSERT INTO BIGLIETTO VALUES (510, 'D02', 6.50, '2026-06-30', 'SPT000006', 'CLI000001');


--controlliamo che le tabelle siano state popolate

SELECT * FROM BIGLIETTO ;
SELECT * FROM REGISTA;
SELECT * FROM FILM;
SELECT * FROM SALA;
SELECT * FROM SPETTACOLO ;
SELECT * FROM CLIENTE;