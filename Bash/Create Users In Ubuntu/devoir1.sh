#!/bin/bash

# Auteur : Bryan Yu
# Devoir 1 : Ajout des utilisateurs sur un système Linux

# IMPORTANT ! Le script et le fichier de la liste des utilisateurs doivent être dans le même répertoire.
# Attribuez les droits d'exécution : sudo chmod u+x utilisateurslinux.sh
# Exécutez le script avec la commande sudo : sudo ./utilisateurslinux.sh

# J'ai utilisé la commande read pour lire le nom du chemin du nom de fichier entré.
read -p "Entrez le chemin du fichier ayant la liste des utilisateurs : " fichier_utilisateur

# La commande read va lire chaque ligne du fichier donné.
while read -r ligne || [ -n "$ligne" ]
do
	# J'ai défini cette variable pour les prénoms des utilisateurs.
	prenom_utilisateur=$(echo $ligne | cut -d " " -f1)
	# J'ai défini cette variable pour les noms de famille des utilisateurs.
	nom_utilisateur=$(echo $ligne | cut -d " " -f2)
	# Cette variable va concaténer la première lettre du prénom avec le nom de famille.
	nom_complet=$(echo "${prenom_utilisateur:0:1}${nom_utilisateur}")
	# J'ai repris la variable précédente (nom_complet) pour mettre tout en miniscule les noms des utilisateurs.
	nom_complet=$(echo "$nom_complet" | tr '[:upper:]' '[:lower:]')
	# J'initialise la variable i qui me servira à ajouter une deuxième lettre du prénom pour concaténer avec le nom de famille.
	i=0
	# Début de la sous-boucle.
	while id "$nom_complet" &>/dev/null
	do
		# Ma variable "i" serait incrémenté de 1 en utilisant l'opérateur "+".
		i=$(($i+1))
		# Une lettre sera ajoutée à un prénom d'utilisateur à chaque fois qu'il (ou elle) 
		# n'ait pas une même autre lettre précédente dans son prénom à l'autre.
		nom_complet=$(echo "${prenom_utilisateur:0:$i}$nom_utilisateur" | tr '[:upper:]' '[:lower:]')
	# Fin de la "sous-boucle"
	done
	# Les utilisateurs seraient créés avec la commande "useradd".
	sudo useradd $nom_complet
	# Je peux afficher la liste des utilisateurs créés simplement avec la commande "echo"
	echo $nom_complet
# Fin de la première boucle.
done < $fichier_utilisateur

# Vous pourriez vérifier la création des utilisateurs en consultant le fichier /etc/passwd avec la commande "cat /etc/passwd".
