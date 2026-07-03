--QUERYI 1 : ELENCARE GLI SPETTACOLI PROGRAMMATI IN UNA DETERMINATA DATA

--Mettiamo le date in ordine ascendente per verificare l'intervallo di tempo in cui cinema ha programmato gli spettacoli

SELECT S.data_s FROM SPETTACOLO s ORDER BY S.data_s ASC

--Proviamo con 3 date
SELECT S.id_spettacolo, S.data_s, S.orario, F.titolo, SA.id_sala
FROM SPETTACOLO S
JOIN FILM F ON S.cod_film = F.id_film
JOIN SALA SA ON S.n_sala = SA.id_sala
WHERE S.data_s = '2026-06-30'
ORDER BY S.orario ASC;

SELECT S.id_spettacolo, S.data_s, S.orario, F.titolo, SA.id_sala
FROM SPETTACOLO S
JOIN FILM F ON S.cod_film = F.id_film
JOIN SALA SA ON S.n_sala = SA.id_sala
WHERE S.data_s = '2026-07-0'
ORDER BY S.orario ASC;

SELECT S.id_spettacolo, S.data_s, S.orario, F.titolo, SA.id_sala
FROM SPETTACOLO S
JOIN FILM F ON S.cod_film = F.id_film
JOIN SALA SA ON S.n_sala = SA.id_sala
WHERE S.data_s = '2026-08-12'
ORDER BY S.orario ASC;


--QUERY 2: CALCOLARE IL NUMERO DI BIGLIETTI VENDUTI PER OGNI FILM

SELECT F.id_film, F.titolo, COUNT(B.id_biglietto) AS totale_biglietti_venduti
FROM FILM AS F
LEFT JOIN SPETTACOLO AS S ON F.id_film = S.cod_film
LEFT JOIN BIGLIETTO AS B ON S.id_spettacolo = B.id_spettacolo
GROUP BY F.id_film, F.titolo
ORDER BY totale_biglietti_venduti DESC;

--QUERY 3 : INDIVIDUARE IL TASSO DI OCCUPAZIONE DI OGNI SALA IN BASE ALLA SUA CAPIENZA E AI BIGLIETTI VENDUTI 

SELECT S.n_sala, SA.capienza, COUNT(B.id_biglietto) AS Biglietti_Venduti,
       (COUNT(B.id_biglietto) * 100.0 / SA.capienza) AS Tasso_Occupazione_Percentuale 
FROM SPETTACOLO AS S
JOIN SALA AS SA ON S.n_sala = SA.id_sala
LEFT JOIN BIGLIETTO AS B ON S.id_spettacolo = B.id_spettacolo
GROUP BY S.n_sala, SA.capienza
ORDER BY Tasso_Occupazione_Percentuale DESC;





