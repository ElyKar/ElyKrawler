Ecrit par Tristan Claverie

Le programme est décomposé en 3 modules :
-Queue : une file FIFO basique
-TernarySearchTree : Un arbre ternaire de recherche, plus efficace qu'une
HashMap pour le stockage de couples (String, valeur).
-Gefx : Pour faciliter l'écriture du fichier de sortie au format .gefx

L'algorithme est le suivant :

initialisation : on met toutes les urls de départ dans la Queue q
tant que q n'est pas vide ou qu'on est pas arrivés à NMAX noeuds
on retire le premier élément e de q
Si on n'a pas visité cette page :
   On récupère la page correspndant à l'url e (requête http)
   On parse la page pour trouver les urls, et on les place à la fin de q
on recommence

L'algo est très simple, le reste du programme est juste là pour garder une
trace de par où on est passé, pour pouvoir écrire le .gefx

Mon avis perso : Ruby est vachement plus cool que le C, le Java, le perl
ou le python. La syntaxe n'est pas si simple si on veut réaliser des opérations
pointues, mais c'est assez naturel au final.
Les variables ne sont pas typées, ça simplifie énormément la syntaxe, pas de
cast foireux à faire (et donc pas de generics).
La syntaxe fonctionnelle est une tuerie, tout devient beaucoup plus court
(certainement pas plus simple).
Les itérateurs sont extrêmement puissants et faciles à implémenter, il faut
juste implémenter une fonction each (exemples dans Queue et dans TernarySearchTree)
Le passage de blocs de code à l'air génial, mais j'ai pas eu l'opportunité de
le tester ici
Système de gestion d'exception présent.
