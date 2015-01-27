Je suis sous Windows, donc d�sol�, j'ai pas pr�vu de compatibilit� Linux, mais
il y a pas grand chose � changer.
Le lancement prend deux param�tres : une liste d'URLs (si possible valides),
le nombre maximum de noeuds voulu.
Le fichier de sortie est "output.gefx", pour pouvoir �tre r�utilis�
directement par gephi.
Les sites d'entr�e doivent �tre pertinents, sinon on tombe assez vite sur des
sites tr�s g�n�ralistes et � partir de l� le crawl n'a plus d'int�r�t.
Du coup, j'ai rajouter une liste taboue dans le module crawl.rb, � compl�ter
selon les besoins.

Voici l'appel que j'ai pass� pour l'exemple :
ruby "%ProgRuby%"/crawl.rb E:\Tristan\Ruby\liste.txt 5000

Le "output.gefx" est le graphe obtenu avec cet appel (temps : 25-30min)

Un crawl prend au plus quelques dizaines de minutes, donc c'est possible
de faire plusieurs essais. On voit le nombre de noeuds visit�s par centaines (100, 200, ...)
histoire de voir que le programme travaille un minimum.
Parfois, le programme semble se bloquer sur une page, j'imagine que c'est que la page
est tr�s longue � parser, sinon la gestion des exceptions prend aussi du temps

Si �a ne vous convient pas et que vous voulez essayer d'am�liorer les r�sultats,
les seules choses � toucher sont les expressions r�guli�res permettant de 
reconna�tre une url dans un texte, et la liste taboue.
Les structures de donn�es marchent, les requ�tes HTTP marchent, les erreurs sont 
g�r�es.