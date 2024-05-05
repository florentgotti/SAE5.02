#Crée un playbook ansible permettant d'installer de façon automatisée Docker
ansible-playbook -i inventory.ini playbook.yml --connection=local

#Vérifie que Docker est installé
docker version

echo "L'installation de Docker2 est terminée."
