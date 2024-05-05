#Crée un conteneur ollama sur le port 11434
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama --restart always ollama/ollama

# Ajoute le modèle ollama v2
docker exec -it ollama ollama run llama2
