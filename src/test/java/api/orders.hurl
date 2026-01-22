# 1. On définit l'URL cible
# Note : host.docker.internal est nécessaire car Hurl tournera dans Docker
GET http://host.docker.internal:8080/api/orders

# 2. On vérifie que le serveur répond avec succès
HTTP 200

# 3. On vérifie le contenu de la réponse (Asserts)
[Asserts]
# On vérifie qu'il y a bien 2 commandes dans le tableau
jsonpath "$" count == 2

# On vérifie les données de la première commande (index 0)
jsonpath "$[0].id" == 1
jsonpath "$[0].product" == "Laptop"
jsonpath "$[0].price" == 1200.0

# On vérifie les données de la seconde commande (index 1)
jsonpath "$[1].product" == "Mouse"
jsonpath "$[1].price" == 25.0