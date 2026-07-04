import sqlite3

# Connect to a local SQLite database file
conn = sqlite3.connect("cinema-sql.db")
cursor = conn.cursor()



# Query all rows
cursor.execute("""
               SELECT S.data_s FROM SPETTACOLO s ORDER BY S.data_s ASC
               """)
rows = cursor.fetchall()

print("All users:")
for row in rows:
    print(row)

# --- Query 1: Spettacoli in una data specifica ---
cursor.execute("""
    SELECT S.id_spettacolo, S.data_s, S.orario, F.titolo, SA.id_sala
    FROM SPETTACOLO S
    JOIN FILM F ON S.cod_film = F.id_film
    JOIN SALA SA ON S.n_sala = SA.id_sala
    WHERE S.data_s = '2026-07-0'
    ORDER BY S.orario ASC
""")
rows1 = cursor.fetchall()

print("Spettacoli del giorno:")
for row in rows1:
    print(row)

# --- Query 2: Totale biglietti venduti per film ---
cursor.execute("""
    SELECT F.id_film, F.titolo, COUNT(B.id_biglietto) AS totale_biglietti_venduti
    FROM FILM AS F
    LEFT JOIN SPETTACOLO AS S ON F.id_film = S.cod_film
    LEFT JOIN BIGLIETTO AS B ON S.id_spettacolo = B.id_spettacolo
    GROUP BY F.id_film, F.titolo
    ORDER BY totale_biglietti_venduti DESC
""")
rows2 = cursor.fetchall()

print("\nBiglietti venduti per film:")
for row in rows2:
    print(row)

# --- Query 3: Tasso di occupazione per sala ---
cursor.execute("""
    SELECT S.n_sala, SA.capienza, COUNT(B.id_biglietto) AS Biglietti_Venduti,
           (COUNT(B.id_biglietto) * 100.0 / SA.capienza) AS Tasso_Occupazione_Percentuale
    FROM SPETTACOLO AS S
    JOIN SALA AS SA ON S.n_sala = SA.id_sala
    LEFT JOIN BIGLIETTO AS B ON S.id_spettacolo = B.id_biglietto
    GROUP BY S.n_sala, SA.capienza
    ORDER BY Tasso_Occupazione_Percentuale DESC
""")
rows3 = cursor.fetchall()

print("\nTasso di occupazione per sala:")
for row in rows3:
    print(row)




# Close connection
conn.close()