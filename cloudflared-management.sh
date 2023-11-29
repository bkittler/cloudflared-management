#!/bin/sh

# Menu
afficher_menu() {
    echo "Bienvenue dans Cloudflared management"
    echo "Choisissez une option :"
    echo "1) Status"
    echo "2) Start"
    echo "3) Stop"
    echo "4) Restart"
    echo "5) Upgrade"
    echo "6) Quitter"
}

# Fonction
executer_action() {
    case $1 in
        1) systemctl status cloudflared.service;;  # Appel du script pour "Status"
        2) systemctl start cloudflared.service;;   # Appel du script pour "Start"
        3) systemctl stop cloudflared.service;;    # Appel du script pour "Stop"
        4) systemctl restart cloudflared.service;; # Appel du script pour "Restart"
        5) cloudflared update;; # Appel du script pour "Upgrade"
        6) exit 0;;              # Quitter le programme
        *) echo "Option invalide.";;
    esac
}

# Boucle principale
while true; do
    afficher_menu
    read -p "Entrez votre choix : " choix
    executer_action $choix
done
