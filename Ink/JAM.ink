->intro
===intro
L'embrylon du Second Soleil observe silencieusement Kadizhar. Blotti au sein du cosmos, les Trois Lunes gravitent autour de lui tel un mobile au dessus d'un berceau. 
->EntreeVille
===EntreeVille
Vous arrivez au milieu de l'avenue et regardez autour de vous.
Les tours blanches et clochers ne vous parraissez pas aussi imposantes vu de l'extérieur, vous ne prenez conscience que maintenant du vertige pesant que représente les Doigts Fantômes de Kadizhar.

+ "Mais... je n'ai pas le vertige pourtant ?"
Ce n'est pas à vous de décider cela.
 ->FirstMain
+ "Je n'irai pas m'aventurer là haut, c'est certain."
Hm.
 **Quoi ?
 Tant de confiance... Nous verrons bien.
 ->FirstMain
+ [Détourner le regard.]
->FirstMain

====FirstMain
{!Hormis l'avenue où vous vous situé, vous remarquez deux autres grandes rues. Une à gauche et une à droite.}

{FirstLeft or FirstRight: Vous reprenez vos esprits et remarquez un homme de l'autre côté de la rue qui fout fait de grands gestes.}

* Continuer tout droit et quitter la ville.
blabla.
->FirstMain

+ [Tourner à gauche.]
->FirstLeft

+ [Tourner à droite.]
->FirstRight

+ {FirstLeft or FirstRight} [Parler à l'ivrogne.]
->FirstNPC

{!FirstLeft or FirstRight: Vous reprenez vos esprits et remarquez un homme de l'autre côté de la rue qui fout fait de grands gestes.}

=FirstLeft
Deux options s'offrent à vous.

* [Place de l'Oiseau.]
->oiseau
* [Rue du Coup]
->coup
 + ->
 Votre esprit refuse de vous obéir. Pourquoi vouloir s'infliger ça de nouveau ? Vous faites demi-tour.
->FirstMain
 
=oiseau
blabla
->FirstMain
=coup
blabla
->FirstMain

=FirstRight
* [Impasse de l'Océan]
->ocean

+ ->
 Votre esprit refuse de vous obéir. Pourquoi vouloir s'infliger ça de nouveau ? Vous faites demi-tour.
->FirstMain

=ocean
blabla
->FirstMain

===FirstNPC
Après avoir repris vos esprits, vous remarquez que quelqu'un vous toise un peu plus loin
->END