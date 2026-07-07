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

print("Query 1 - Luoghi Barocco:(Luogo, Citta, Tipo, NomeItinerario)")
for record in result1:
    print(record["Luogo"], record["Citta"], record["Tipo"], record["NomeItinerario"])

# --- Query 2: Eventi che si svolgono in luoghi vicini tra loro o con lo stesso tema culturale---
result2 = session.run(
    """
    MATCH (e1:Evento)-[:SI_SVOLGE_IN]->(l1:Luogo)-[:INCLUSO_IN]->(i1:Itinerario)
MATCH (e2:Evento)-[:SI_SVOLGE_IN]->(l2:Luogo)-[:INCLUSO_IN]->(i2:Itinerario)
WHERE e1 <> e2 AND ((l1)-[:VICINO_A]-(l2) OR i1.tema = i2.tema)
RETURN DISTINCT  e1.titolo AS Evento_1, i1.tema AS Tema_1, l1.nome AS Luogo_1, e2.titolo AS Evento_2, i2.tema AS Tema_2, l2.nome AS Luogo_2
    """
)

print("\nQuery 2 - Eventi vicini per luogo o con lo stesso tema culturale: (Evento_1, Tema_1, Luogo_1, Evento_2, Tema_2, Luogo_2)")
for record in result2:
    print(record["Evento_1"], record["Tema_1"], record["Luogo_1"], 
          record["Evento_2"], record["Tema_2"], record["Luogo_2"])

# --- Query 3: Classifica luoghi per numero di connessioni ---
result3 = session.run(
    """
    MATCH (l1:Luogo)-[:INCLUSO_IN]->(i:Itinerario)<-[:INCLUSO_IN]-(l2:Luogo)
    MATCH (l1)-[:VICINO_A|SIMILE_A]-(l2)
    RETURN l1.nome AS Luogo, l1.comune AS Citta, i.nome AS Itinerario, COUNT(l2) AS NumeroConnessioni
    ORDER BY NumeroConnessioni DESC
    """
)

print("\nQuery 3 - Classifica connessioni: (Luogo, Citta, Itinerario, NumeroConnessioni)")
for record in result3:
    print(record["Luogo"], record["Citta"], record["Itinerario"], record["NumeroConnessioni"])

session.close()
driver.close()