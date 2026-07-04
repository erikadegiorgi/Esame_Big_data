from elasticsearch import Elasticsearch

es = Elasticsearch("http://localhost:9200")

# --- Query 1: Videogiochi con descrizione contenente "mondo" ---
result1 = es.search(
    index="catalogo_videogiochi",
    query={
        "match": {
            "descrizione": "mondo"
        }
    }
)

print("Query 1 - Risultati trovati:", result1["hits"]["total"]["value"])
for hit in result1["hits"]["hits"]:
    print(hit["_id"], hit["_source"])

# --- Query 2: Videogiochi RPG con prezzo inferiore a 40 ---
result2 = es.search(
    index="catalogo_videogiochi",
    query={
        "bool": {
            "must": [
                {"match": {"genere": "RPG"}}
            ],
            "filter": [
                {"range": {"prezzo": {"lt": 40.00}}}
            ]
        }
    }
)

print("\nQuery 2 - Risultati trovati:", result2["hits"]["total"]["value"])
for hit in result2["hits"]["hits"]:
    print(hit["_id"], hit["_source"])