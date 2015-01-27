Le programme est d�compos� en 3 modules :
-Queue : une file FIFO basique
-TernarySearchTree : Un arbre ternaire de recherche, plus efficace qu'une
HashMap pour le stockage de couples (String, valeur).
-Gefx : Pour faciliter l'�criture du fichier de sortie au format .gefx

L'algorithme est le suivant :

initialisation : on met toutes les urls de d�part dans la Queue q
tant que q n'est pas vide ou qu'on est pas arriv�s � NMAX noeuds
on retire le premier �l�ment e de q
Si on n'a pas visit� cette page :
   On r�cup�re la page correspndant � l'url e (requ�te http)
   On parse la page pour trouver les urls, et on les place � la fin de q
on recommence

L'algo est tr�s simple, le reste du programme est juste l� pour garder une
trace de par o� on est pass�, pour pouvoir �crire le .gefx

Mon avis perso : Ruby est vachement plus cool que le C, le Java, le perl
ou le python. La syntaxe n'est pas si simple si on veut r�aliser des op�rations
pointues, mais c'est assez naturel au final.
Les variables ne sont pas typ�es, �a simplifie �norm�ment la syntaxe, pas de
cast foireux � faire (et donc pas de generics).
La syntaxe fonctionnelle est une tuerie, tout devient beaucoup plus court
(certainement pas plus simple).
Les it�rateurs sont extr�mement puissants et faciles � impl�menter, il faut
juste impl�menter une fonction each (exemples dans Queue et dans TernarySearchTree)
Le passage de blocs de code � l'air g�nial, mais j'ai pas eu l'opportunit� de
le tester ici
Syst�me de gestion d'exception pr�sent.