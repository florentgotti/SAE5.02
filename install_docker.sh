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

echo "L'installation de Docker1 est terminée."
