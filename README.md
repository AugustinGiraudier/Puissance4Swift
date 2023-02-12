# SwiftPuissance4

Projet de création d'un jeu du puissance 4 dans la console en swift.

Possibilités : 
 * parametrer la taille de grille
 * parametrer le nombre de pions à aligner pour gagner
 * jouer contre une autre personne
 * jouer contre un robot aléatoire

## Choix d'implementation

Dans ce projet, j'ai choisi de créer ces différentes classes ou structures :
- Player (class) : il contient le nom, l'id ainsi que le symbole du joueur à afficher dans la grille. Il contient egalement une methode qui lui permet de choisir la colonne dans laquelle il souhaite jouer.
- Grid (struct) : elle represente la grille de jeu et permet d'inserer une piece dans une colonne donnée
- Rules (protocol) : elles permettent de verifier la bonne construction de la partie dans le respect des regles (nombre de joueurs, taille de la grille, condition de gain de la partie etc...).
- Game (struct) : elle permet de gérer la boucle de jeu, elle est construite avec la Grid, les Rules et les Players qui faconnent la partie.

---

* J'ai choisi de faire de Player une classe car il elle destinée à etre dérivée.
* Grid et Game sont des struct pour permettre de les retourner par copie sans possibilité de modification et pour bénéficier de la rapidité d'allocation sur la pile.
* Rules est un protocol car il est important que ses realisations réécrivent toutes ses fonctionnalités.

### Points particuliers

* Gestion des regles :
    ici, vous trouverez une implementation des regles classiques avec une grille 6x7, 2 joueurs et une victoire en alignant 4 pions.
    Mais l'on pourrait imaginer facilement une seconde regle différente qui pourrait être passée à la construction de la partie.

* Gestion des joueurs :
    2 types de joueurs sont presents : Le joueur Humain et le joueur Robot.
    L'un demande à l'utilisateur de saisir le numero de colonne souhaité par le biais d'une fonction déléguée (on pourrait imaginer une version avec interface graphique qui demanderait cette information via une popup ou autre). L'autre joue dans une colonne aléatoire après un cours délais.

## Pour lancer le projet

### Avec XCode

- Ouvrez le workspace "WorkspacePuissance4.xcworkspace" 
- selectionnez la "ConsoleApplication" 
- Lancez l'application et vous pourrez jouer au puissance 4 dans la console