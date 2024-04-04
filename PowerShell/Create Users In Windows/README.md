# Introduction
Dans mon cours d'introduction aux utilitaires de réseaux (Hiver 2023), j'avais comme deuxième devoir de réaliser un script PowerShell qui permet de créer des utilisateurs sur Windows à partir d'un fichier CSV.

# Livrables
Dans ce dépôt GitLab, vous trouverez les fichiers suivants:

- Devoir1_BryanYu.ps1 : Nom de mon script PowerShell
- utilisateurs.csv : Fichier texte qui contient la liste des utilisateurs

# Instructions
Avant d'exécuter mon script, je vous recommande d'ouvrir un terminal de Windows PowerShell en tant qu'administrateur
et de saisir la commande suivante:

```
set-executionpolicy unrestricted
```

Entrez "O [Oui]" pour accepter la modification de la stratégie d'exécution.

Ensuite, accédez avec la commande "cd" le chemin où se trouvent les deux fichiers nécessaires pour mon script (le script et 
le fichier CSV) que vous aviez téléchargé de mon dossier compressé. Exemple d'exécution : cd C:\Users\Utilisateur\Downloads.

Exécutez mon script dans ce format : 

```
.\Devoir1_BryanYu.ps1 .\utilisateurs.csv
```

*S'il y a un avertissement de sécurité, entrez "O" pour exécuter le script.

Après l'exécution du script, vérifiez la création des utilisateurs, ouvrez l'outil "Gestion de l'ordinateur" 
en faisant un Bouton-droit sur l'icône Windows en-bas à gauche de votre machine et cliquez-le.

Ensuite,

- Cliquez sur "Utilisateurs et groupes locaux"    
- Cliquez sur "Utilisateurs"
    
Vous verrez les utilisateurs créés.

Ce script peut être exécuté en une seule fois pour obtenir la création des comptes locaux.
Par contre, si vous effacez tous ces comptes utilisateur, vous pourriez le réexécuter 
une autre fois.
