#!/bin/bash

# Vérifier si l'utilisateur a les droits d'administration
if [[ $EUID -ne 0 ]]; then
   echo "Ce script doit être exécuté en tant qu'administrateur" 
   exit 1
fi

# Mettre à jour les paquets
apt update

# Installation d'SSH
apt install openssh-server -y
systemctl start ssh
systemctl status ssh

#Création d'une clef ssh
ssh-keygen -t rsa -b 4096 -C mail@exemple.fr -y
