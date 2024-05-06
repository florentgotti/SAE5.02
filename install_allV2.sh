#!/bin/bash

##INSTALLATION ANSIBLE
# Vérifier si l'utilisateur a les droits d'administration
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant qu'administrateur" 
   exit 1
fi

# Mettre à jour les paquets
apt update

# Installer les dépendances
apt install -y software-properties-common

# Ajouter le dépôt Ansible PPA
apt-add-repository -y ppa:ansible/ansible

# Mettre à jour les paquets pour inclure le nouveau dépôt
apt update

# Installer Ansible
apt install -y ansible

# Afficher la version installée d'Ansible
ansible --version

echo "L'installation d'Ansible est terminée."

##INSTALLATION DOCKER1
#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administration
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant qu'administrateur" 
   exit 1
fi

# Mettre à jour les paquets
apt update

# Installation de Docker à partir d'Ansible
ansible-galaxy collection install community.docker

echo "L'installation de Docker est terminée."

##INSTALLATION DOCKER2
#Crée un playbook ansible permettant d'installer de façon automatisée Docker
ansible-playbook -i inventory.ini playbook.yml --connection=local

#Vérifie que Docker est installé
docker version

##INSTALLATION OLLAMA
#Crée un conteneur ollama sur le port 11434
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama --restart always ollama/ollama

# Ajoute le modèle ollama v2
docker exec -it ollama ollama run llama2
/bye

##INSTALLATION WEB USER INTERFACE
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
