#!/bin/bash

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
