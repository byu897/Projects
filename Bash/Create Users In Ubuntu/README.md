# Introduction
Dans mon cours d'introduction aux utilitaires de réseaux (Hiver 2023), j'avais comme premier devoir de réaliser un script Bash qui permet de créer des utilisateurs sur Ubuntu à partir d'un fichier texte.

# Livrables
Dans ce dépôt GitLab, vous trouverez les fichiers suivants:

- devoir1.sh : Nom de mon script Bash
- liste_utilisateurs.txt : Fichier texte qui contient la liste des utilisateurs

# Instructions
1. Le script et le fichier de la liste des utilisateurs doivent être dans le même répertoire.
2. Vous devriez attribuer les droits d'exécution à mon fichier de script : sudo chmod u+x utilisateurslinux.sh
3. Il faut exécuter le script, sur un terminal de Linux, avec sudo :

```
sudo ./utilisateurslinux.sh
```

6. Une fois que vous auriez exécuté mon script, vous pourriez consulter le fichier /etc/passwd en exécutant la commande suivante dans le terminal de Linux pour voir la création des 12 utilisateurs :

```
cat /etc/passwd
```

*REMARQUE : Je vous ai refourni le même fichier de la liste des utilisateurs (celui de Moodle) dans le dossier compressé, mais en le renommant.
