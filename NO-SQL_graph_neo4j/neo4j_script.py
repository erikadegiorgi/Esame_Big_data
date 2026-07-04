from neo4j import GraphDatabase

URI = "bolt://localhost:7687"
AUTH = ("neo4j", "password")

driver = GraphDatabase.driver(URI, auth=AUTH)
session = driver.session(database="ente2")

# --- Query 1: Luoghi inclusi in itinerari a tema Barocco ---
result1 = session.run(
    """
    MATCH (l:Luogo)-[:INCLUSO_IN]->(i:Itinerario)
    WHERE i.tema = "Barocco"
    RETURN l.nome AS Luogo, l.comune AS Citta, l.tipologia AS Tipo, i.nome AS NomeItinerario
    """
)

print("Query 1 - Luoghi Barocco:")
for record in result1:
    print(record["Luogo"], record["Citta"], record["Tipo"], record["NomeItinerario"])

# --- Query 2: Eventi che si svolgono in luoghi vicini tra loro ---
result2 = session.run(
    """
    MATCH (e1:Evento)-[:SI_SVOLGE_IN]->(l1:Luogo)-[:VICINO_A]-(l2:Luogo)<-[:SI_SVOLGE_IN]-(e2:Evento)
    WHERE e1 <> e2
    RETURN e1.titolo AS Evento1, l1.nome AS NelLuogo, e2.titolo AS Evento2, l2.nome AS VicinoALuogo
    """
)

print("\nQuery 2 - Eventi vicini:")
for record in result2:
    print(record["Evento1"], record["NelLuogo"], record["Evento2"], record["VicinoALuogo"])

# --- Query 3: Classifica luoghi per numero di connessioni ---
result3 = session.run(
    """
    MATCH (l1:Luogo)-[:INCLUSO_IN]->(i:Itinerario)<-[:INCLUSO_IN]-(l2:Luogo)
    MATCH (l1)-[:VICINO_A|SIMILE_A]-(l2)
    RETURN l1.nome AS Luogo, l1.comune AS Citta, i.nome AS Itinerario, COUNT(l2) AS NumeroConnessioni
    ORDER BY NumeroConnessioni DESC
    """
)

print("\nQuery 3 - Classifica connessioni:")
for record in result3:
    print(record["Luogo"], record["Citta"], record["Itinerario"], record["NumeroConnessioni"])

session.close()
driver.close()