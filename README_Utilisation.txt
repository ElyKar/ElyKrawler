Je suis sous Windows, donc désolé, j'ai pas prévu de compatibilité Linux, mais
il y a pas grand chose à changer.
Le lancement prend deux paramètres : une liste d'URLs (si possible valides),
le nombre maximum de noeuds voulu.
Le fichier de sortie est "output.gefx", pour pouvoir être réutilisé
directement par gephi.
Les sites d'entrée doivent être pertinents, sinon on tombe assez vite sur des
sites très généralistes et à partir de là le crawl n'a plus d'intérêt.
Du coup, j'ai rajouter une liste taboue dans le module crawl.rb, à compléter
selon les besoins.

Voici l'appel que j'ai passé pour l'exemple :
ruby "%ProgRuby%"/crawl.rb E:\Tristan\Ruby\liste.txt 5000

Le "output.gefx" est le graphe obtenu avec cet appel (temps : 25-30min)

Un crawl prend au plus quelques dizaines de minutes, donc c'est possible
de faire plusieurs essais. On voit le nombre de noeuds visités par centaines (100, 200, ...)
histoire de voir que le programme travaille un minimum.
Parfois, le programme semble se bloquer sur une page, j'imagine que c'est que la page
est très longue à parser, sinon la gestion des exceptions prend aussi du temps

Si ça ne vous convient pas et que vous voulez essayer d'améliorer les résultats,
les seules choses à toucher sont les expressions régulières permettant de 
reconnaître une url dans un texte, et la liste taboue.
Les structures de données marchent, les requêtes HTTP marchent, les erreurs sont 
gérées.