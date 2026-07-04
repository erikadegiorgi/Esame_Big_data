from neo4j import GraphDatabase

URI = "bolt://localhost:7687"
AUTH = ("neo4j", "password")

driver = GraphDatabase.driver(URI, auth=AUTH)

session = driver.session(database="neo4j")

# Scrittura: crea o aggiorna un nodo Movie
result = session.run(
    """MATCH (l:Luogo)-[:INCLUSO_IN]->(i:Itinerario) 
WHERE i.tema = "Barocco" 
RETURN l.nome AS Luogo, l.comune AS Citta, l.tipologia AS Tipo, i.nome AS NomeItinerario 
"""
)

print("Written movie:")
for record in result:
    print(record["Luogo"], record["Citta"], record["Tipo"], record["NomeItinerario"])

//Query 1

MATCH (l:Luogo)-[:INCLUSO_IN]->(i:Itinerario) //Cerca tutti i luighi collegati a un certo itinerario
WHERE i.tema = "Barocco" //Filtro, condizione che il tema dell itinerario sia Barocco
RETURN l.nome AS Luogo, l.comune AS Citta, l.tipologia AS Tipo, i.nome AS NomeItinerario //Specifica cosa vogliamo vedere stampato a schermo nella tabella finale dei risultati;

//Query 2

MATCH (e1:Evento)-[:SI_SVOLGE_IN]->(l1:Luogo)-[:VICINO_A]-(l2:Luogo)<-[:SI_SVOLGE_IN]-(e2:Evento) //Questa si legge a partire dal centro, 
WHERE e1 <> e2 // Gli eventi devono essere diversi, in modo tale che il percorso non ritorni al nodo di partenza
RETURN e1.titolo AS Evento1, l1.nome AS NelLuogo, e2.titolo AS Evento2, l2.nome AS VicinoALuogo;

//Query 3

MATCH (l1:Luogo)-[:INCLUSO_IN]->(i:Itinerario)<-[:INCLUSO_IN]-(l2:Luogo)
MATCH (l1)-[:VICINO_A|SIMILE_A]-(l2) //o una o l altra, i luoghi se sono legati da un legame di vicinanza e/o somiglianza
RETURN l1.nome AS Luogo, l1.comune AS Citta, i.nome AS Itinerario, COUNT(l2) AS NumeroConnessioni //calcola le connessioni
ORDER BY NumeroConnessioni DESC //ordina le connessioni in modo decrescente;

session.close()
driver.close()