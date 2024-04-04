# Auteur : Bryan Yu
# Devoir 1 - Creation des comptes locaux Windows

# Le nom du fichier CSV contenant les utilisateurs prend le première paramètre lors de l'execution du script.
$fichier_utilisateurs = $args[0]

# Ceci va importer le fichier CSV et remplacer les colonnes originales par celles ci-dessous.
$utilisateurs = Import-CSV $fichier_utilisateurs -Delimiter ';' -Header "Prenom", "Nom", "NoEmploye", "Departement", "DateFinContrat", "Groupe"

# Je parcours chaque utilisateur du fichier des utilisateurs.
foreach ($utilisateur in $utilisateurs) {
    
    # Les variables des informations des utilisateurs sont initialisees.
    $Prenom = $utilisateur.Prenom
    $Nom = $utilisateur.Nom
    $NumEmploye = $utilisateur.NoEmploye
    $Departement = $utilisateur.Departement
    $FinContrat = $utilisateur.DateFinContrat
    $Groupe = $utilisateur.Groupe

    # Les variables initialisees ci-dessous sont utiles pour la generation du mot de passe temporaire.
    $choix_mots = "Soleil", "Fraise", "Crayon"
    $choix_symboles = "$", "%", "!"

    # L'identifiant de l'utilisateur va etre cree en concatenant son prenom
    # et son nom de famille et genere en miniscules.
    $nom_utilisateur = $Prenom[0].ToString().ToLower() + $Nom.ToLower()
    $i = 1
    
    # Tant que l'identifiant d'un utilisateur existe, il peut etre cree en
    # utilisant la premiere lettre du prenom et le nom de famille. Si cet
    # utilisateur existe deja, le script va prendre en compte les deux
    # premieres lettres du prenom et ainsi de suite.
    while (Get-LocalUser -Name $nom_utilisateur -ErrorAction SilentlyContinue) {
        $nom_utilisateur = $Prenom.Substring(0, $i).ToLower() + $Nom.ToLower()
        $i++
    }

    # Le cmdlet "Get-Random" va generer du mot de passe temporaire
    $mot = Get-Random $choix_mots
    $symbole = Get-Random $choix_symboles
    $numero = $NumEmploye.Substring($NumEmploye.Length-3)

    # Cette variable combine aleatoirement les elements pour le mot de passe.
    $mot_de_passe = $mot + $symbole + $numero

    # Cette variable prend en compte de la transformation du mot de passe temporaire en 
    # chaine de caracteres securisee.
    $mot_de_passe_securise = ConvertTo-SecureString -String $mot_de_passe -AsPlainText -Force

    # Chaque utilisateur va etre cree avec une description, son nom complet et son mot de passe
    # securise. Le cmdlet "Out-Null" va cacher la sortie du resultat.
    New-LocalUser -Name $nom_utilisateur -Description "L'utilisateur $nom_utilisateur a ete cree" -FullName "$Prenom $Nom" -Password $mot_de_passe_securise | Out-Null

    # Si le groupe d'un utilisateur n'existe pas, il va etre cree.
    if (-not (Get-LocalGroup -Name $Groupe -ErrorAction SilentlyContinue)) {
        New-LocalGroup -Name $Groupe
    }

    # L'utilisateur va etre ajoute a son groupe associe.
    Add-LocalGroupMember -Group $Groupe -Member $nom_utilisateur

    # Si la date d'expiration est specifiee, on la configure pour le compte.
    if ($FinContrat) {
        Set-LocalUser -Name $nom_utilisateur -AccountExpires (Get-Date $FinContrat)
    }

    # La commande "net user" va forcer la modification du mot de passe a
    # la prochaine connexion. La cmlet Out-Null va cacher la sortie du
    # resultat.
    net user $nom_utilisateur /logonpasswordchg:yes | Out-Null
}