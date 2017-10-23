# Formation R AUA/T

### Table des matières
[TOC]

### Ressources : 
[Matériaux sur github](https://github.com/datactivist/AUAT)
[Slides](http://datactivi.st/AUAT/)

### Documentation markdown : 

Retrouver la syntaxe: [Lire la cheatsheet](http://assemble.io/docs/Cheatsheet-Markdown.html)
Leçon interactive : [Common Mark Tutorial](http://commonmark.org/help/tutorial/)

#  Jour 1 : Présentation de **`R`** et de son écosystème

## Objectifs (jour 1)

- Comprendre les possibilités offertes par R
- Comprendre le pipeline de données
- Savoir importer des données dans R
- Comprendre la notion de tidy data
- Savoir transformer ses données en tidy 
- (si on a le temps) introduction à sf

## Introduction 

::: warning
R est un outil crée par des statisticiens, pas des développeurs 😅
:::

[**Dashboard.Rmd**](https://github.com/datactivist/AUAT/blob/master/dashboard.Rmd) : *exemple du google form transformé en carte interactive dans Rstudio (à l'aide de [FlexDashboard](http://rmarkdown.rstudio.com/flexdashboard/))*

[**Exemple "test_osm"**](https://github.com/datactivist/AUAT/blob/master/test_osm.R) : *Utilisation jointe de OSM, PostGis, R, et Leaflet*

[**Exemple "Cartographie des électeurs FN"**](https://joelgombin.github.io/makingof) : Tout le programme est fait en R, même l'article d'explications, [rédigé en Rmd (R markdown)](https://github.com/joelgombin/voteFNmarseille).

## Le data pipeline

![Le data pipeline d'Hadley Wickham](https://github.com/datactivist/AUAT/blob/master/img/data-science.png?raw=true)

Data pipeline modélisé par [Hadley Wickham](http://hadley.nz/), Chief Scientist chez Rstudio, référence dans le domaine du R.
 
Idéalement, on souhaite automatiser le plus d'étapes possible

R permet de couvrir toutes les étapes de manière programmatique.

![Le data pipeline de la school of data](https://github.com/datactivist/AUAT/blob/master/img/pipeline.png?raw=true)

Data pipeline modélisé par [School of data](https://schoolofdata.org/), de l'[Open Knowledge foundation](https://okfn.org/)

## Outil à tout faire

* R a comme avantage d'être un langage de programmation (= potentiel illimité) pensé exprès pour la manipulation des données (= usabilité, flexibilité)

* au fil du temps, devenu un "general purpose tool"
 
* permet d'interfacer de nombreux outils plus spécialisés
 
* une communauté très dynamique (free software)
 
* une syntaxe de plus en plus facile
 
* des progrès vers des bouts de GUI

R est aujourd'hui utilisé par Google, Microsoft et autres grands groupes, qui financent le [Rconsortium](https://www.r-consortium.org/). 

R s'interface avec tous les langages de programmation les plus communs ( Java, C++, Fortran...).

## Trouver de l'aide sur **`R`**

**Des livres :**

* 😍 [R for Data Science](http://r4ds.had.co.nz) de G. Grolemund et H. Wickham *(état de l'art pour nettoyer, transformer et modéliser des données)*
* Applied Spatial Data Analysis with R de Bivand et al. *( le livre classique d'utilisation de R pour des données spatiales, commence à être daté)*
* An Introduction to R for Spatial Analysis and Mapping de Brundson et Cumber
* [R et espace](https://framabook.org/r-et-espace/), du groupe ElementR *(En Francais ! Auteurs de divers packages dont [cartography](https://cran.r-project.org/web/packages/cartography/index.html))*

**Des blogs :**

* https://www.r-bloggers.com (Les dernières nouvelles R)
* https://quanti.hypotheses.org/ (Francais)
* https://politbistro.hypotheses.org 
* https://neocarto.hypotheses.org/ (blog et tutoriel carto)
* http://rgeomatic.hypotheses.org/
* http://elementr.hypotheses.org/

**Autres :**

* Listes de diffusions
   * quanti@groupes.renater.fr
   * semin-r@mnhn.fr
   * r-soc@groupes.renater.fr

* des forums (http://forums.cirad.fr/logiciel-R/)

* un site de Q/R communautaires : http://stackoverflow.com/questions/tagged/r

* twitter avec le hashtag [#Rstats](https://twitter.com/search?q=%23rstats)

* les [meetup R](https://www.meetup.com/fr-FR/rparis/)

* [les cheatsheets de Rstudio](https://www.rstudio.com/resources/cheatsheets/)

* Forum Rstudio : http://community.rstudio.com

## Prise en main de **`Rstudio`**

**4 panels** : 

![Aperçu de Rstudio](https://i.imgur.com/joGRlMI.jpg)


1) Éditeur de scripts (R, Rmd, R notebook...)
2) Console R (lancer des commandes et obtenir les résultats)
3) Variables et résultats (Objets et données stockées dans mon environnement de travail), puis onglet Historique
4) Arbre du projet, Onglet plot ( résultats graphiques ), Onglet viewer ( résultats web ), Packages et aide interactive.

Le Rmd (R markdown) permet de générer du html, du pdf et bien d'autres formats.

Un fichier R notebook ( `File > New File > R Notebook` ) est semblable au Rmd mais n'a pas besoin de compilation (plus rapide et léger)

:::warning
Raccourci pour exécuter une ligne de code : `ctrl + entrée` ou `pomme + entrée` pour Mac
:::

On écrit rarement directement dans la console, tout se fait dans l'éditeur de script. 

On sauvegarde rarement les données produites, car on peut les retrouver facilement grâce au script. On peut néanmoins générer dans le script des fichiers CSV, Rdata, Html...

Vous trouverez dans le menu `Help` les raccourcis clavier.

Utilisez l'onglet `Help` pour comprendre le fonctionnement de fonction ( exemples, arguments )

Utilisez l'autocomplétion avec `tab` et `F1`

## Bonnes pratiques

* Pensez Scripts, [litterate programming](https://fr.wikipedia.org/wiki/Programmation_lettr%C3%A9e), [reproducible research](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research)
* Toujours travailler dans le cadre d'un "projet" ( dossier séparé )
* Ne jamais travailler dans la console, écrire des scripts
* Mieux : mêler texte et code au moyen de fichiers Rmd
* Utilisez le versionnage (git)
* Profiter de la puissance des fichiers Rnotebook
* Commentez votre code ! (avec le #)

```{r}
# ceci est un commentaire 😉
```

## Le **`Tidyverse`**

* Suite de packages pensés pour fonctionner ensemble.
* Aussi appelé hadleyverse en référence à son créateur [Hadley Wickham](http://hadley.nz/)
* Permet de gérer des données tabulaires, appelées dataframes

Les dataframes sont à la fois entrées et sorties des différents packages, permettant d'utiliser des pipes comme interface.

![](http://hexb.in/hexagons/magrittr.png)

:::warning
Le pipe s'écrit `%>%` mais vous pouvez utiliser le raccourci clavier `Ctrl/Cmd + shift + M`
:::


Script : 
```r
install.packages("tidyverse")
library (tidyverse)
install.packages("readr")
# Installation puis chargement
# Reader est un package de tidyverse, que nous allons utiliser
```

## Importer son premier jeu de données

Importons un jeu de données électoral : les résultats par commune du premier tour de l'élection présidentielle. 
Source : [Github Datactivist](https://github.com/datactivist/presidentielle2017) préparées avec : [LireMinInterieur](https://github.com/joelgombin/LireMinInterieur)

:::warning
Attention à la syntaxe d'assignation : `monjeudedonnees <- read_csv("monfichier.csv")`
:::

Script : 
```{r}
library (readr)
elections <- read_csv("data/Presidentielle_2017_Resultats_Communes_T1_clean.csv")
# Utilisez l'autocomplétion (TAB) pour trouver le chemin plus facilement
# Nous utilisons ici le dossier de travail copié depuis github : https://github.com/datactivist/AUAT
```

Validez, observez l'onglet **Environnement** (*elections* a été créé, vous pouvez cliquer dessus pour l'observer)

```{r}
suppressPackageStartupMessages(library(tidyverse))
pres2017T1_communes <- read_csv("./data/Presidentielle_2017_Resultats_Communes_T1_clean.csv")
```
:::info
Si vous avez oublié d'assigner votre résultat et qu'il a disparu, tapez `sauvegarde <- .Last.Value` dans la console. 😎
:::

## Les fonctions dans *`R`*

Certaines fonctions comme *`sum`* n'ont pas de paramètres nommés

```{r}
sum(1, 2, 3)
# [1]6
a <- sum(1, 2, 3)
a
# [1]6
```
Les fonctions qui ont des paramètres nommés peuvent être utilisées de deux façons : 
- On les assigne à leur nom usuel, puis on lance la fonction sans faire attention à l'ordre des paramètres. 
- On les rentre dans la fonction dans l'ordre usuel.

On crée des fonctions dès lors qu'on utilise deux fois les mêmes calculs, pour se faciliter la tâche à l'avenir et utiliser la même logique.
 
## Le Tidyverse

### La notion de tidy data

>“Happy families are all alike; every unhappy family is unhappy in its own way.” – Tolstoï
>
>“Tidy datasets are all alike, but every messy dataset is messy in its own way.” – Hadley Wickham

![Représentation des données Tidy](https://github.com/datactivist/AUAT/blob/master/img/tidy-1.png?raw=true)

:::warning
- À chaque variable sa propre colonne

- À chaque observation sa propre ligne

- À chaque valeur sa propre cellule
:::

- À chaque observation sa propre ligne

- À chaque variable sa colonne

- À chaque valeur sa propre cellule > 1 jeu de données par table, dite [“tibble”](https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html)

Exemple de **++untidy++** data : [Résultats 1er tour 2017 par communes](https://www.data.gouv.fr/fr/datasets/election-presidentielle-des-23-avril-et-7-mai-2017-resultats-definitifs-du-1er-tour-par-communes/)

### Préparer des Tidy data

Il faut préparer les données à l'aide de ces fonctions ou packages : 

- Les packages `dplyr` et `tidyr`
- le pipe : %>% (Ctrl/Cmd + shift + M
- les verbes :
    - `filter` (et `slice`)
    - `arrange`
    - `select` (et `rename`)
    - `distinct`
    - `mutate`
    - `group_by`
    - `summarise`
    - `sample_n` / `sample_frac`
- Le package `stringr` peut utilement accompagner (manipulation de chaînes de caractères)

### Pivoter

Pour passer d'un format long à un format large, ou inversement, on utilise les fonctions `gather` *(large vers long)* et `spread` *(long vers large)*

![Exemple de pivot](https://github.com/datactivist/AUAT/blob/master/img/tidy-9.png?raw=true)

### Exemple de pivot :

Passer de large en long :
```{r}
elections_long <- elections %>% 
  select(- contains("_ins")) %>%
  select(- contains("_exp")) %>%   
  gather(candidat, voix, `LE PEN`:CHEMINADE)
# On veut ici deux colones : une nomée 'candidat', une nomée 'voix'
# Le tout pour la plage d'éléments 'LE PEN à CHEMINADE'

elections_long
```
Mise en forme : 
```{r}
elections_long %>% 
 group_by(CodeInsee) %>%
 arrange(desc(voix)) %>%
 slice(1) %>%
 View()
```

Passer de long en large :

```{r}
elections_long %>% 
 spread(candidate, voix)
```
### Modifier les données

On crée ici des nouvelles variables, ins et exp, en partant des données existantes. Les données NaN sont gérés nativement par `R` 

```{r}
elections_long <- elections_long %>% 
# on ecrase l'objet ( on garde le nouveau résultat dans la même variable )
  mutate(ins = voix / Inscrits * 100) %>% 
  mutate(exp = voix / Exprimés * 100) %>%
  View(elections_long)
````
En créant ses nouvelles variables, nous ne sommes plus vraiment en format long ( plus d'une seule valeur par ligne )
Repassons donc en format large :

```{r}
elections_long %>% 
 gather ( metrique, valeur, voix:exp)%>%
 arrange(CodeInsee, candidat) %>%
# par défaut, la fonction `arrange` trie par ordre croissant
 View
```

On a fait une première étape de rallongement, utilisons maintenant `spread` pour passer en format large :

```{r}
elections_long %>% 
 gather(metrique, valeur, voix:exp) %>% 
 unite(variable, candidat, metrique, sep = "_") %>% 
 spread(variable, valeur)
```

## <span style="color:red"> Exercice : à vos données untidy ! 🙌</span>

:::info
Si votre séparateur de fichier csv est ";" au lieu de "," utilisez la fonction `read_csv2`
:::


## Ressources citées

Tous les packages pour **R studio** :  https://cran.r-project.com
Vous en trouverez d'autres sur https://github.com

Rstudio server : https://www.rstudio.com/products/rstudio/download-server/
Version Microsoft (avec présentation complète) : https://www.microsoft.com/fr-fr/cloud-platform/r-server

Site Tidyverse avec documentation : https://www.tidyverse.org


## Évaluation 1^ière^ journée

Veuillez remplir le [sondage](https://frama.link/eval-auat-1)

Merci :relaxed: ! 

# Jour 2 : Acquérir et nettoyer ses données, les analyser

On reprend à http://datactivi.st/AUAT/#38

## Objectifs (jour 2)

- Solidifier les acquis d'hier

- Boîte à outils : le tidyverse (suite)

- Les tidydata géographiques

- Analyse uni- et bi-variées

- Analyse multivariée (AGD)

## Échauffement

:::info
* Importer des données en CSV
* sélectionner certaines lignes en fonction d'une condition logique
* ajouter une nouvelle variable
* agréger/résumer les données par groupe
* trier le résultat
* pivoter des données
:::

:::warning
Pour utiliser une variable qui pourrait créer des problèmes de syntaxe **`R`**, pensez à utiliser des backticks ( ` )
:::

:::warning
Pour manipuler les dates utilisez le package **`lubridate`** avec les fonctions **`day`** et **`mutate`**
:::

```{r}
library(lubridate)
df <- data_frame(date = c("01-05-2017","07-06-2016"))
df <- df %>%
    mutate(date = day(date))%>%
    mutate(jour = day(date), mois = month(date), année = year(date), jour_semaine = weekdays(date))
```

## Structures de contrôle 

- **if/else**
```{r}
if(a=5) { code }
else { code2 }
```

- **for**
```{r}
for(i in 1:100) { code }
```
- **while**
```{r}
i=0
while(i < 10) { 
  i = i + 1
  print(i)
}
```

## Objets **`R`**
* Vecteur : ```c("","","")```
* Listes : ```list[[1]]``` 
* Matrices : ```matrix[1,4]```
* Matrice à plusieurs dimensions : ```array[4,2,3]```
* **Dataframes** ( tableaux dynamiques )


## Recoder des données

On utilise **`mutate`** puis les fonctions : 

- **`recode`** 
- **`case_when`** 

```{r}
elections %>% 
  mutate(region = case_when(
  CodeDepartement %in% c("75", "77", "78", "91", "92", "93", "94", "95") ~ "Ile-de-France",
  TRUE ~ "Province")) %>% 
  glimpse
  # "c" est la fonction combine qui crée un vecteur de valeur
  # Pour un créer un vecteur nommé, utilisez la syntaxe c(1="",2="" ...)
  # On renvoie "Province" à la place de NaN  
```

:::danger
En **`R`** on commence à compter à **1** plutôt que 0, contrairement à la majorité des langages de programmation. 😱
:::

## Fusionner des jeux de données

Pensez à l'importance des `primary keys` (identifiant unique ) et `foreign keys` lors de toute jointure.

Voici les différents types de jointures

* left_join ( priorité à la table de gauche )

![left join](https://camo.githubusercontent.com/8fb5f6b1e22ca1e9c7f010cde256019975052ef5/687474703a2f2f723464732e6861642e636f2e6e7a2f6469616772616d732f6a6f696e2d73657475702e706e67)

![left join 2](https://camo.githubusercontent.com/07615f4b08aa16e04bcb1952907d5241805272b4/687474703a2f2f723464732e6861642e636f2e6e7a2f6469616772616d732f6a6f696e2d7365747570322e706e67)

* right_join ( priorité à la table de gauche )
* full_join
* inner_join ( en cas de valeur manquante)

![inner join](https://camo.githubusercontent.com/395e6f48541e7380d2161c20ce8d9f45fdc038bf/687474703a2f2f723464732e6861642e636f2e6e7a2f6469616772616d732f6a6f696e2d696e6e65722e706e67)

* semi_join ( garder seulement ce qui est dans les deux jeu de données )

![semi join](https://camo.githubusercontent.com/53741f5a24c6c3864733c166ac5d6fcc0745cd37/687474703a2f2f723464732e6861642e636f2e6e7a2f6469616772616d732f6a6f696e2d73656d692e706e67)

* anti_join

![anti join](https://camo.githubusercontent.com/4abda00035184977736fe5b3e19e0fa300432744/687474703a2f2f723464732e6861642e636f2e6e7a2f6469616772616d732f6a6f696e2d616e74692e706e67)


:::danger
Ne pas confondre la fusion et les jointures avec le binding ( juxtaposition ). Le binding se fait à l'aide des fonctions **`bind_rows`** et **`bind_cols`** 
:::

## Trucs et Astuces avec le package **`dplyr`**

Ceci : 

```{r}
ZE2010 %>% 
  group_by(LIBZE2010) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n))
```

peut s'écrire plus facilement : 

```{r}
ZE2010 %>% 
  count(LIBZE2010, sort = TRUE)
````

Exemple : on veut numéroter les communes par ordre décroissant de vote Le Pen dans le département

```{r}
elections %>% 
  group_by(CodeDepartement) %>% 
  # group_by sera utilisé comme une boucle jusqu'au ungroup
  arrange(desc(`LE PEN_exp`)) %>% 
  mutate(numero = 1:n()) %>% 
  ungroup %>% 
  arrange(desc(`LE PEN_exp`)) %>% 
  select(CodeInsee, Commune, Département, numero, `LE PEN_exp`)
```
### Les tidydata géographiques: **`sf`**

#### **`sf`** = Simple Features

* une architecture commune pour les simple features geometries
* un standard formel : `OGC 06-103r4`, `ISO 19125`
* le standard des outils libres de SIG
* un ensemble d'encodages :
    * WKB
    * WKT

[![](https://github.com/datactivist/AUAT/blob/master/img/classes.png?raw=true)](http://www.opengeospatial.org/standards/sfa)

Permets de représenter des éléments géographiques en plein texte (WKT) :


```
POINT(0 0)
LINESTRING(0 0,1 1,1 2)
POLYGON((0 0,4 0,4 4,0 4,0 0),(1 1, 2 1, 2 2, 1 2,1 1))
MULTIPOINT((0 0),(1 2))
MULTILINESTRING((0 0,1 1,1 2),(2 3,3 2,5 4))
MULTIPOLYGON(((0 0,4 0,4 4,0 4,0 0),(1 1,2 1,2 2,1 2,1 1)),
((-1 -1,-1 -2,-2 -2,-2 -1,-1 -1)))
GEOMETRYCOLLECTION(POINT(2 3),LINESTRING(2 3,3 4))
```

Peut exister en 2, 3, 4 dimensions.

[![](https://github.com/datactivist/AUAT/blob/master/img/schema.png?raw=true)](http://pebesma.staff.ifgi.de/pebesma_sfr.pdf)

:::warning
Simple feature est donc :
* un dataframe
* une ligne par feature ("liste-colonne")
* géométries et attributs ont le même statut
* très similaire à la manière dont PostGIS fonctionne
:::

**Exemple :** 

Requête : 
```{r, warning=FALSE, message=FALSE}
dbGetQuery(connection, "SELECT id, ST_AsText(geom) AS geometry from nodes LIMIT 10") 
```

Tableau résultat :
```
##        id                    geometry
## 1  625219 POINT(1.4710213 43.5495882)
## 2  625226 POINT(1.4781246 43.5523568)
## 3  625235  POINT(1.471321 43.5542919)
## 4  625236 POINT(1.4722469 43.5554962)
## 5  625239 POINT(1.4700917 43.5545298)
## 6  625240  POINT(1.471471 43.5544525)
## 7  625241 POINT(1.4709202 43.5550524)
## 8  625242 POINT(1.4719338 43.5550721)
## 9  625255 POINT(1.4686231 43.5551804)
## 10 625262 POINT(1.4729169 43.5570509)
```

## Importer des données spatiales

[Source](https://data.toulouse-metropole.fr/explore/dataset/quartiers-de-democratie-locale0/export/?location=12,43.60074,1.43283&basemap=jawg.streets)

```{r}
library(sf)
quartiers <- st_read("./data/quartiers-de-democratie-locale0.shp") 
glimpse(quartiers)
mapviewOptions(leafletWidth = 700, leafletHeight = 400)
library(mapview)
mapview(quartiers)
````

![](https://i.imgur.com/jRlxZgq.jpg)


```{r}
quartiers2 <- st_read("./data/quartiers-de-democratie-locale0.geojson") 
glimpse(quartiers2)
mapviewOptions(leafletWidth = 700, leafletHeight = 400)
library(mapview)
mapview(quartiers2)
````

![](https://i.imgur.com/jRlxZgq.jpg)


```{r}
ways <- st_read_db(conn = connection, table = "ways", EWKB = TRUE)
glimpse(ways)
ways %>% 
  filter(stringr::str_detect(tags, "pedestrian")) %>% 
  mapview()
````

![](https://i.imgur.com/ECf2DzA.jpg)


Exemple utilisation WMS : 
```{r}
library(leaflet)
leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )
```

## Analyse uni- et bi-variées

### Analyses univariées

Plusieurs approches possibles

En utilisant le Tidyverse :

```{r}
df %>% 
  group_by(mes_groupes) %>% 
  summarise(mean = mean(ma_variable), median = median(ma_variable))
````
```{r}
df %>% 
  group_by(mes_groupes) %>%
  summarise_at(vars(varA, varB, varC), funs(mean = mean(.), median = median(.), max = max(.), min = min(.)), sd = sd(.))
```

### Analyses bivariées (correlations)

Corrélation simple : 

```{r}
library(corrr)
pres2017T1_communes %>% 
  select(contains("_ins")) %>% 
  correlate
```

Avec les modules **`shave`** et **`fashion`** : 

```{r}
pres2017T1_communes %>% 
  select(contains("_ins")) %>% 
  correlate %>% 
  focus(FILLON_ins, `LE PEN_ins`, MACRON_ins, MÉLENCHON_ins, mirror = TRUE) %>% 
  rearrange(method = "HC", absolute = FALSE) %>%  # trier par correlation
  shave() %>% 
  fashion()
```

Visualisation avec le module **`rplot`**

```{r}
pres2017T1_communes %>% 
  select(contains("_ins")) %>% 
  correlate %>% 
  rearrange(method = "HC", absolute = FALSE) %>%  # trier par correlation
  shave() %>% 
  rplot()
```
![](http://datactivi.st/AUAT/index_files/figure-html/unnamed-chunk-39-1.png)

```{r}
Cairo:CairoPDF("./graphique.pdf", width = 10, height = 10)
pres2017T1_communes %>% 
gather(candidat, resultat, contains("_ins_")) >%>
ggplot(aes(x=candidat, y= resultat)) +
geom_boxplot +
coord_flip()
dev.off()
```

:::info
Pour exporter un graphique vectoriel, on a utilisé ici
**`Cairo::CairoPDF("./graphique.pdf", width = 10, height = 10)`**
et **`dev.off()`** comme balise à notre calcul graphique.
Les dimensions sont ici exprimées en pouces.

Pour exporter en format `.png` utilisez **`Cairo:CairoPNG`** et exprimez les dimensions en pixel.
:::

:::warning
Les pipes, **`>%>`**,  se notent **`+`** dans **`ggplot`**
:::

## Analyse multivariée ( AGD )

On utilisera le package **`FactoMineR`**, français et bien documenté 💪😁, mais un peu ancien 😕

Exemple acp : 

```{r}
library(FactoMineR)

acp <- pres2017T1_communes %>% 
  select(contains("_ins"), "Département") %>% 
  PCA(quali.sup = 17, graph = FALSE)
acp

# 1er argument PCA : données 
# 2nd argument PCA : variable quali supplémentaire
# Argument graph = pour afficher ou pas les graphiques automatiques
```

Pensez à enlever toutes les variables inutiles avant d'utiliser PCA, avec **`select`** par exemple

On peut utiliser le package **`explor`** pour avoir des aperçus graphiques des acp.

:::info
La fonction **`tail()`** permet d'afficher la fin d'un jeu de données 
:::

::: info
La fonction **`augment()`** du package **`broom`** permet d'afficher des valeurs prédites.
:::

## 🚧 <span style="color:red"> Scripts réalisés</span>


- Joint gauche avec `tidyverse`, `readxl` et les fonctions `left_join`et `summarise_at`[summarise.R](https://github.com/datactivist/AUAT/blob/master/summarise.R)

- CAH et APC avec `FactoMineR`[cah.R](https://github.com/datactivist/AUAT/blob/master/cah.R)

- Exports ggplot[exports ggplot.R](https://github.com/datactivist/AUAT/blob/master/exports%20ggplot.R)

- Predictions de modèles avec `texreg`,`broom` et `lme4`[modeles.R](https://github.com/datactivist/AUAT/blob/master/modeles.R)

- Script "barometre du numérique" avec `tidyverse` et les fonctions `filter`, `count` , `group_by` et `summarise`[script_numerique.R](https://github.com/datactivist/AUAT/blob/master/script_numerique.R)

- Pondération avec `tidyverse` et les fonctions `filter`, `count` , `group_by` et `summarise`[ponderation.R](https://github.com/datactivist/AUAT/blob/master/ponderation.R)

- Quantiles avec les fonctions `do`et `mutate`[quantiles.R](https://github.com/datactivist/AUAT/blob/master/quantiles.R)

- Test [OpenStreetMap](http://www.openstreetmap.org/) parcs à vélo avec `RPostgreSQL` , `sf` et `tidyverse` : [test_osm.R](https://github.com/datactivist/AUAT/blob/master/test_osm.R)




## Ressources citées

Modélisation **`R`** en **`JS`** : http://www.htmlwidgets.org/

Documentation package **`broom`** : 
https://github.com/tidyverse/broom

Documentation package **`lme4`** : 
https://cran.r-project.org/web/packages/lme4/index.html

## Évaluation 2^nde^ journée

Veuillez remplir le [sondage](https://frama.link/auat_eval_2)

Merci 😛 !

# Jour 3 : Réaliser des cartes statistiques

On reprend à http://datactivi.st/AUAT/#83

## Objectifs (jour 3)

- Solidifier les acquis des deux jours précédents

- Panorama de la cartographie et du SIG dans R

- Utiliser les packages tmap et cartography pour réaliser des cartes statistiques « print »

- Utiliser les packages mapview et leaflet pour réaliser des cartes statistiques « web »

- Automatiser un workflow cartographique

## Échauffement

:::info
Mettre en pratique et tester ce qui a été appris avant-hier et hier (tidyverse, AGD...)
:::

## Panorama de la cartographie et du SIG dans R

- un workflow intégré

- un workflow reproductible

- une convergence des paradigmes de carto "statique" (print) et "dynamique" (web)

* l'intégration dans des apps. Exemples : 
    * http://shiny.rstudio.com/gallery/superzip-example.html
    * https://gallery.shinyapps.io/shiny-salesman/
    * https://mbienz.shinyapps.io/tourism_dashboard_prod/

- des capacités de base grâce à `sf::plot` (mais limitées)

- des capacités SIG grâce à `sf` via GEOS ([fonctions `st_*`](https://r-spatial.github.io/sf/articles/sf3.html#geometrical-operations) similaires à PostGIS)

- des packages de cartographie de haut niveau : `cartography` et `tmap` - mais aussi `ggplot2` ([version de développement](http://ggplot2.tidyverse.org/news/index.html#ggplot2-2-2-1-9000))

- des packages de cartographie interactive/web : `leaflet`, `mapview` and friends ([`mapedit`](https://github.com/r-spatial/mapedit)...)


Exemple : 

```{r}
library(tidyverse)
library(sf)

elections <- read_csv("./data/Presidentielle_2017_Resultats_Communes_TL_clean.csv")

conmmunes <- read_sf("./data/communes-20150101-100m.shp", stringAsFactors = FALSE)

elections <- elections >%>
    left_join( communes, by = c("CodeInsee" = "insee")) 

elections <- elections %>%
st_as_sf()
# declarer election comme élément spatial 

elections_dpt<- elections %>%
    group_by(Département)>%>
    summarise_at(vars(contains("_ins")), funs(weighted.mean(., w = Inscrits)))
    
mapview::mapview(elections_dpt, z.co) = "Absentions_ins")

```

## Notions de cartographie

### Qu'est-ce qu'une carte ?

> "Une carte est une représentation géométrique plane simplifiée et conventionnelle de tout ou partie de la surface terrestre, et cela dans un rapport de similitude convenable qu'on appelle échelle." 
*(F. Joly, 1976)*


Référence : [Béguin et Pumain, 2014 (3e éd.)](http://www.persee.fr/web/revues/home/prescript/article/espos_0755-7809_1998_num_16_1_1827_t1_0119_0000_2)

### La notion de projection

La projection est l'outil mathématique qui permet de passer du géoïde représentant la Terre à une représentation plane.

Projections conformes (Mercator, Lambert) ou équivalentes (Eckert IV, Gall). Il y a toujours une déformation !

Les coordonnées géographiques sont exprimées en longitude et latitude. Les unités peuvent être des degrés ou des grades. La projection transforme les coordonnées géographiques en coordonnées x/y.

Exemple de coordonnées géographiques :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/gmaps.png?raw=true)
:::success
- Un truc cool pour jouer avec les différentes projections 😍 : [blocks](http://bl.ocks.org/mbostock/raw/3711652/)
:::

:::success
_The West Wing_, la série qui arrive à faire un sketch drôle sur les projections géographiques :
</br>
<iframe width="560" height="315" src="https://www.youtube.com/embed/vVX-PrBRtTY" frameborder="0" allowfullscreen></iframe>
:::

### L'échelle

L'échelle d'une carte représente le rapport d'une distance mesurée sur la carte à sa valeur réelle sur le terrain.

Échelle        | 1 cm représente
---------------|----------------
1/10000        |100 m
1/25000        |250m
1/50000        |500m
1/100000       |1km
1/1000000      |10km

:::warning
Attention : "petite échelle" = grande superficie représentée
"grande échelle" = petite superficie représentée
:::

L'échelle est déformée à distance du centre de projection (équateur pour Mercator)

Échelle numérique et échelle graphique : 

![largeur](https://github.com/datactivist/AUAT/blob/master/img/carteParis1.png?raw=true)

### La généralisation

C'est :
> "L'opération qui, par sélection, schématisation et harmonisation reconstitue sur une carte la réalité de la surface représentée dans ses traits essentiels en fonction du but de la carte, de son thème, de son échelle et des particularités de la région cartographiée."

### La sélection

Quelles couches d'information représenter ? Ni trop (surcharge d'information, à la Google Maps) ni trop peu (rendre la carte intelligible au lecteur).

Le [style "toner"](http://maps.stamen.com/toner/#12/37.7706/-122.3782) peut être utile pour trouver cet équilibre, en cartographie thématique :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/carteParis1.png?raw=true)

### La schématisation

Opération de simplification, qui peut être structurale (tracés) ou conceptuelle (schéma).

:::warning
Attention : on peut simplifier à partir de données détaillées, mais on ne peut pas faire l'inverse ! Donc **toujours veiller à conserver les données dans leur forme la plus détaillée**.
:::

### Le fond de carte

Le fond de carte est constitué des éléments repris d'une carte topographique (par exemple de l'IGN) et utilisés pour une carte thématique.

> "Carte reproduite totalement ou partiellement, en une ou plusieurs couleurs souvent atténuées, servant de repère pour le report en surcharge de phénomènes localisables déterminés" (CFC). Peut concerner les découpages administratifs, le réseau routier, hydrographique, les courbes de niveau, etc.

### Les sources de fonds de carte

Traditionnellement, en France : l'[IGN](http://www.ign.fr/).

De plus en plus : [Google Maps](google.fr/maps), [Open Street Map](http://www.openstreetmap.org/), [Stamen](maps.stamen.com/)...

Exemples : 
- http://maps.stamen.com/toner/#12/48.8974/2.2017
- http://maps.stamen.com/watercolor/#12/48.8974/2.2017

### Vecteur ou raster

Comment stocker et représenter l'information géographique ?

- "Mode raster" : il s'agit d'une image, découpée en pixels. Des valeurs sont attribuées aux pixels. Ex : photo satellite.
- "Mode vecteur" : on utilise des objets géométriques (lignes, points, polygones...) auxquels sont associés des attributs. Ex : carte d'un réseau de transports.

<iframe width="800" height="600" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=2.3314136266708374%2C48.866987337550164%2C2.33908474445343%2C48.87019135286425&amp;layer=transportmap" style="border: 1px solid black"></iframe>

[FrancePixels](http://www.comeetie.fr/galerie/francepixels/)

### Cartes choroplèthes

Une carte choroplèthe est une carte thématique où les régions sont colorées ou remplies d'un motif qui montre une mesure statistique, tels la densité de population ou le revenu par habitant. 

Ce type de carte facilite la comparaison d'une mesure statistique d'une région à l'autre ou montre la variabilité de celle-ci pour une région donnée.

### Cartes en anamorphose ou cartogramme

> La cartographie en anamorphose a pour but d'adapter la forme de la carte non pas à la réalité physique, mais plutôt à la réalité perçue.
> *[(Langlois et Denain, 1996)](http://cybergeo.revues.org/129)*

On déforme le fond de carte en fonction d'une variable quantitative (voire arbitrairement).

[![largeur](https://github.com/datactivist/AUAT/blob/master/img/carte2.png?raw=true)](http://www.slate.fr/france/87669/cartes-europeennes-2014)

### Le langage cartographique

> La carte, comme le graphique, permet de percevoir *en même temps* trois informations (X,Y,Z).
*([Bertin, 1965](http://classiques.uqac.ca/collection_methodologie/bertin_jacques/representations_visuelles_info/representations_visuelles_info_texte.html) : travail sur la sémiologie graphique)*. 

Mais pour que cette communication soit efficace, il faut respecter un langage précis et ses règles, assez comparable à la grammaire des graphiques.

### Les composantes du langage cartographique

- les signes graphiques élémentaires : point, trait, tâche (aplat).
- le figuré cartographique : combinaison de signes graphiques élémentaires.
- l'implantation graphique : manière d'appliquer le figuré sur la carte (ponctuelle, linéaire ou zonale).
- les variables visuelles : façon de faire varier les signes graphiques. Il y en a sept.

### Les variables visuelles

- forme
- taille
- couleur
- valeur
- orientation
- texture-structure (trame)
- grain

### La forme

- Ne transcrit qu'une information qualitative.
- Veiller à ne pas utiliser trop de formes différentes, sinon cela devient illisible (< 10)
- Utilisée dans les trois types d'implantation graphique. En implantation zonale => texture.

### La taille

- longueur/hauteur/surface/volume
- bonne perception visuelle par l'œil
- rapport de proportionnalité entre informations quantitatives représentées et la forme
- attention à respecter cette proportionnalité !
- la taille est plus facile à estimer que la surface ou le volume

Un exemple d'utilisation incorrecte (non proportionnelle) de la taille :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/UneMonde.png?raw=true)

- Le cartogramme (anamorphose) comme cas particulier de l'utilisation de la taille.
- [Créer un fonds de carte en anamorphose](http://scapetoad.choros.ch/)
- [Réaliser un cartogramme en javascript](http://prag.ma/code/d3-cartogram/)

* fort pouvoir différentiel
* esthétique
* trois propriétés :
    + ton
    + saturation
    + intensité 

Aide au choix de couleur : http://hslpicker.com/


- En général, on utilise un seul ton et on joue sur l'intensité.

![](https://i.imgur.com/ip93IBG.jpg)


- Parfois, par exemple pour représenter une variation, on peut jouer sur deux échelles de tons

![](https://i.imgur.com/t2XXlF6.jpg)


- Si on représente une variable qualitative, on utilise autant de tons que de catégories

![](https://i.imgur.com/9KVo2yJ.jpg)


- Penser aux daltoniens !
- Penser au support (web, papier...)
- Des palettes de couleur de référence : [colorbrewer2.org](http://colorbrewer2.org/) par exemple
- Un autre outil de construction de palette de couleur : [vis4.net/labs/multihue](https://vis4.net/labs/multihue/)
- C'est la variable qu'on utilise le plus en cartographie thématique.

### La valeur

- Valeur : rapport entre quantités totales de noir et de blanc perçues dans une surface donnée (cf. aussi "gris typographique").
- Peut passer par une trame
- Peut concerner une couleur (un ton)
- En général, on utilise des classes (max 6/7)
- Mais parfois, coloration continue

Un exemple de coloration continue :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/continue.jpg?raw=true)

Des cartes _old school_ de densité, qui utilisent une trame :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/densite.jpg?raw=true)

Une autre coloration continue (pas très lisible parce qu'elle utilise trop de teintes [hues]) :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/Purple-USA.jpg?raw=true)

### Le grain

- agrandissement ou réduction d'une texture/structure
- pas très utilisé, car mal perçu par l'œil humain

### L'orientation

- Angle d'un figuré linéaire
- Pour variable qualitative, moins utilisée aujourd'hui

Un exemple d'utilisation par Todd et Le Bras :

![largeur](https://github.com/datactivist/AUAT/blob/master/img/lebrastodd.jpg?raw=true)

### Distribution et découpage en classes des variables quantitatives

- discrétisation : découper une variable continue en classes
- ce découpage n'est pas neutre, et ne peut être décidé indépendamment de la distribution de la variable représentée

Voir [cet article](http://www.persee.fr/web/revues/home/prescript/article/espos_0755-7809_2000_num_18_1_1930)

Un [moyen sympa](http://franceo3.geoclip.fr/index.php?profil=FV#z=-349737,6562730,1033057,513716;l=fr;i=euro14.pt_lfn;v=map12) de jouer avec les différentes méthodes de discrétisation.

### Et dans R ?

- objets spatiaux : `sf`, comme vu hier
- ainsi que le package `raster` pour toutes les données... raster

Explorer des données spatiales : `mapview`

```{r, eval = FALSE}
library(sf)
library(mapview)
departements <- st_read("./data/departements/DEPARTEMENT.shp",  stringsAsFactors = FALSE)
mapview(departements)
```
![resultat leaflet](https://i.imgur.com/mKi2Pq7.jpg)


```{r, echo = FALSE}
library(sf)
library(mapview)
departements <- st_read("./data/departements/DEPARTEMENT.shp",  stringsAsFactors = FALSE)
l4 <- mapview(departements)
frameWidget(l4@map)
```

Cartographier : `tmap`
```{r}
communes <- read_sf("./data/communes.geojson")
elections <- read_csv("./data/Presidentielle_2017_Resultats_Communes_T1_clean.csv")
elections <- communes %>% 
  left_join(elections, by = c("INSEE_COM" = "CodeInsee"))
departements <- elections %>%  # marche avec sf 0.5-5 et dplyr 0.7.4
  group_by(NOM_DEP) %>% 
  summarise_at(vars(contains("_ins")), funs(weighted.mean(., w = Inscrits, na.rm = TRUE)))
departements <- left_join(departements,
          elections %>% 
            st_set_geometry(NULL) %>% 
            group_by(NOM_DEP) %>% 
            summarise(Inscrits = sum(Inscrits)),
          by = "NOM_DEP"
)
```

```{r}
library(tmap)
departements %>% 
  tm_shape() +
    tm_polygons(col = "Abstentions_ins", 
    palette = "RdBu", n = 7, style = "jenks", 
    title = "Abstention", textNA = "valeur manquante", 
    legend.format = list(text.separator = "à"), 
    auto.palette.mapping = FALSE)
```

![](https://github.com/datactivist/AUAT/blob/master/index_files/figure-html/unnamed-chunk-50-1.png?raw=true)

```{r}
departements %>% 
  st_transform(crs = 2154) %>% # back to Lambert93
  tm_shape() +
    tm_polygons(col = "Abstentions_ins", palette = "RdBu", n = 7, style = "jenks", title = "Abstention", textNA = "valeur manquante", legend.format = list(text.separator = "à"), auto.palette.mapping = FALSE) +
    tm_bubbles(size = "Inscrits") +
  tm_compass(position = c("right", "center")) +
  tm_scale_bar(position = c("center", "bottom"))
```

![](https://github.com/datactivist/AUAT/blob/master/index_files/figure-html/unnamed-chunk-52-1.png?raw=true)

```{r}
departements %>% 
  st_transform(crs = 2154) %>% # back to Lambert93
  tm_shape() +
    tm_polygons(col = "Abstentions_ins", palette = "RdBu", n = 7, style = "jenks", title = "Abstention", textNA = "valeur manquante", legend.format = list(text.separator = "à"), auto.palette.mapping = FALSE) +
    tm_bubbles(size = "Inscrits", scale = 2) +
  tm_compass(position = c("right", "center")) +
  tm_scale_bar(position = c("center", "bottom")) +
tm_style_cobalt()
```

![](https://github.com/datactivist/AUAT/blob/master/index_files/figure-html/unnamed-chunk-54-1.png?raw=true)

Avec **`cartography`**:

```{r}
library(cartography)
departements %>% 
  choroLayer(var = "Abstentions_ins", method = "quantile", nclass = 7)
```
  
![](https://github.com/datactivist/AUAT/blob/master/index_files/figure-html/unnamed-chunk-56-1.png?raw=true)

Avec **`ggplot2`** (version de dev):
```{r}
library(ggplot2)
departements %>% 
  st_transform(crs = 2154) %>% 
  ggplot() +
  geom_sf(aes(fill = Abstentions_ins)) +
  theme_bw()
````

![](https://github.com/datactivist/AUAT/blob/master/index_files/figure-html/unnamed-chunk-58-1.png?raw=true)

Avec **`Leaflet`** : 

```{r}
library(leaflet)
departements %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons(fillColor  = ~ colorQuantile("Reds", 
  domain = Inscrits)(Inscrits), 
  weight = 1, 
  color = "grey", 
  fillOpacity = 0.8) %>% 
  addCircles(data = departements %>% st_centroid(),
             radius = ~ sqrt(Inscrits)*30, weight = 10) %>% 
  addLegend(pal = colorQuantile("Reds", domain = departements$Inscrits), 
            values = ~Inscrits)
````


## 🚧 <span style="color:red"> Scripts réalisés</span>

- Différents tests de cartographie avec `sf`, `tmap` et `cartopgraphy`: [script carto.R](https://github.com/datactivist/AUAT/blob/master/script%20carto.R)

- [simplification.R](https://github.com/datactivist/AUAT/blob/master/simplification.R)

## Ressources citées : 

- Serveur shinyapps : https://www.shinyapps.io/

- Opérations géometriques de SF : https://r-spatial.github.io/sf/articles/sf3.html#geometrical-operations

# Jour 4 : Principes de modélisation

On reprend à http://datactivi.st/AUAT/#145

## Que fait-on une fois qu'on a des données ?

- Exploratory Data Analysis (Tukey, 1977) : pas d'hypothèse préalable à tester, plutôt pour générer des hypothèses. Rôle de la datavisualisation 

![Exploratory Data Analysis](https://github.com/datactivist/AUAT/blob/master/img/test.png?raw=true)

- test d'hypothèse

- **modèle**


## Pourquoi modéliser ?

![Implications of the bread and peace model for the 2016 Presidential Election](https://github.com/datactivist/AUAT/blob/master/img/Hibbs.jpg?raw=true)

*D'après ce modèle, on à reussi à prédire environ 54% de votes pour Hillary Clinton*

On observe généralement une tension entre deux utilisations des méthodes de modélisation : 

* pour analyser et expliquer

* pour prédire

## Modéliser pour analyser

* un modèle réduit de la réalité

* isoler le rôle de chaque variable
 
* raisonner "toutes choses égales par ailleurs" (ceteris paribus)

Ici, on chercher a avoir le moins de variable possible pour essayer de les isoler et comprendre leur impact individuel

Modéliser, c’est mettre en relation une *variable expliquée*
(dépendante / prédite) et une ou plusieurs *variables explicatives*
(indépendantes / prédicteurs).

$$ Y = f(X_1, X_2, X_3, ..., X_n) $$

L’estimation du modèle consiste à estimer la valeur des paramètres
(ou coefficients). Le cas du modèle linéaire :

$$ Y = α + β_1X_1 + β_2X_2 + β_3X_3 + · · · + β_nX_n + ε $$

Ceci implique donc de faire des hypothèses sur la spécification du modèle :

* variables explicatives

* distribution des erreurs

## Les distributions

* Distribution théorique (ex : distribution normale)

* Distribution empirique (réelle, qui ne répond pas à une loi mathématique)

http://shiny.stat.calpoly.edu/Prob_View/


> Since all models are wrong the scientist cannot obtain a "correct" one by excessive elaboration. On the contrary following William of Occam he should seek an economical description of natural phenomena.
> -*George Box*


**ALL MODELS ARE WRONG, SOME ARE USEFUL**

![razoir d'ockham](https://github.com/datactivist/AUAT/blob/master/img/ockham.jpg?raw=true)



:::danger
**Attention !**

- Les modèles de régression linéaire supposent que les relations sont linéaires et additives.

- Les résidus sont supposés être normalement distribués.

- Les coefficients ne sont pas standardisés (on ne peut pas les comparer entre eux).

- Les coefficients s’interprètent relativement à l’unité de la variable dépendante.

- Les coefficients estiment l’effet d’une variable indépendante sur la variable dépendante toutes choses égales par ailleurs, c’est-à-dire en neutralisant l’effet des autres variables.

- La qualité globale du modèle peut être quantifié au travers du $R2$
$R2$, qui représente la part de variance (de la variable dépendante) expliquée.

- Pour les variables indépendantes catégoriques, on estime un coefficient par modalité, à l’exception de la première (baseline).
:::

## Underfitting et overfitting

![Underfitting / Balanced / Overfitting](https://github.com/datactivist/AUAT/blob/master/img/underfit.png?raw=true)

Modèles sous-adptés et suradaptés, qui, en agissant sur le bruit et le signal, créent des erreurs d'interprétation et de prédiction.

Pour éviter ces problèmes :

- Pratique largement utilisée dans le *machine learning* : différencier données d'apprentissage et données de test. Sans ça on a une tendance à l'*overfitting* 

- n'utiliser les données de confirmation (test) qu'une seule fois. Réduit la taille des données, complexe à mettre en place

## Extrapolation

[![](https://github.com/datactivist/AUAT/blob/master//img/sinus.png?raw=true)](http://r4ds.had.co.nz/model-basics.html)

Sachant qu'on a souvent déjà des modèles mals définis, l'extrapolation devient risquée.

## Et le machine learning alors ? 

- Fondamentalement, modélisation et machine learning ne sont pas différents, du point de vue d'un statisticien : modéliser un $Y$ en fonction d'un vecteur de $X_i$

- Une des différences principales toutefois : veut-on prévoir ou comprendre/analyser ? La machine learning est plus axé sur la prédiction ( Ex : pub / achats sur amazon )

- Donc : peut-on, veut-on interpréter les coefficients ? En machine learning, ils sont souvent ininterprétables. Il s'agit de modèles **Boite noire**

- En pratique : machine learning porte généralement sur des données plus complexes que la modélisation traditionnelle. 

- Souvent beaucoup de valeurs manquantes, qu'on essaie de prédire

![Machine learning example](https://github.com/datactivist/AUAT/blob/master/img/ratings.png?raw=true)

## Concepts de machine learning 

- Apprentissage supervisé vs non supervisé 

- Apprentissage supervisé : il faut des données déjà classées/étalonnées. 

Les données classées/étalonnées sont donc souvent à la main ! => *#digitallabour* ( voir publications de [Antonio Casilli](https://fr.wikipedia.org/wiki/Antonio_Casilli) sur les micro-tâches, penser à l'exemple des Captcha )

![Image captcha](https://github.com/datactivist/AUAT/blob/master/img/captcha.jpg?raw=true)

## Apprentissage supervisé 

Exemple opensolarmap : apprentissage supervisé pour le bien commun

![Image opensolarmap](https://github.com/datactivist/AUAT/blob/master/img/opensolarmap.png?raw=true)

Exemple Tri des mails dans gmail (Priority Inbox) :

[![The learning behind gmail priority inbox](https://github.com/datactivist/AUAT/blob/master/img/inbox.png?raw=true)](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/36955.pdf)


Même si le modèle est personnalisé en fonction de chaque usager, on utilise aussi les données collectives de tous les usagers. Ce qui fait leur valeur est la quantité d'utilisateurs.

## Apprentissage non supervisé

- problème majeur : réduction de la dimensionnalité (on veut réduire le nombre de variable)

- jeux de données à très haute dimensionnalité : impossible à explorer visuellement. Comment simplifier l'information et la résumer ?

![Graphe Party Means on Liberal Conservative dimension](https://github.com/datactivist/AUAT/blob/master/img/house.png?raw=true)

Exemple d'analyse textuelle : https://gallery.shinyapps.io/LDAelife/

## Quelques algorithmes notoires

### Apprentissage supervisé

- La régression (linéaire, logistique, LOESS...), éventuellement régularisée (Ridge, LASSO...)

- Les arbres de décision

- Naive Bayes (indépendance des attributs)

- Réseau bayésien (graphe de corrélation entre variables, inclut des _priors_)

- Réseau de neurones (perceptron, back-propagation, Hopfield network...)

- Deep learning

- Random forest, Boosting, Gradient Boosting

- Support vector machine

- etc. 

### Apprentissage non supervisé

- Clustering : k-means, k-medians, CAH... 

- Réduction de la dimensionnalité : ACP, analyse géométrique des données, MDS, LDA topic clustering...

- Analyses de réseau

- [Word2vec](https://www.tensorflow.org/tutorials/word2vec)

- etc.

 Exemple [Word2vec](https://www.tensorflow.org/tutorials/word2vec):

![Image Word2vec](https://github.com/datactivist/AUAT/blob/master/img/word2vec.png?raw=true)

## Le cas du deep learning

Comment apprendre à un ordinateur à lire ?
 

![texte manuscrit](https://github.com/datactivist/AUAT/blob/master/img/digits.png?raw=true)

![table lettres](https://github.com/datactivist/AUAT/blob/master/img/mnist_100_digits.png?raw=true)

Un perceptron :

![perceptron](https://github.com/datactivist/AUAT/blob/master/img/perceptron.png?raw=true)

![réseau de neurone](https://github.com/datactivist/AUAT/blob/master/img/smallnetwork.png?raw=true)

Une sigmoïde :

![fonction sigmoide](https://github.com/datactivist/AUAT/blob/master/img/sigmoid.png?raw=true)

![couches du reseaux de neurone](https://github.com/datactivist/AUAT/blob/master/img/layers.png?raw=true)

![analyse animée](https://github.com/datactivist/AUAT/blob/master/img/number.gif?raw=true)

![couches cachées](https://github.com/datactivist/AUAT/blob/master/img/hiddenlayer.png?raw=true)

Le gradient descent :

![Gradient descent](https://github.com/datactivist/AUAT/blob/master/img/valley_with_ball.png?raw=true)

+ backpropagation

## Le cas de deep learning

http://chifeng.scripts.mit.edu/stuff/mcmc-demo/#HamiltonianMC,squiggle

http://playground.tensorflow.org/

Décompose un problème complexe (reconnaissance faciale, par exemple) en un grand nombre de problèmes simples => beaucoup de couches cachées => **abstraction**

## Les points auxquels prêter attention

- feature selection

- régularisation

- qualité du critère d'optimisation

- qualité de la distance/métrique retenue

- qualité des données d'input (GIGO - *Garbage in, Garbage out* )

- ...

## Ressources citées : 

- rgeomatic : http://rgeomatic.hypotheses.org/659

- Fonction **`st_read_db`**

- Projet [shinyCartogram](https://github.com/saurfang/shinyCartogram)

- Rplumber : https://www.rplumber.io/

- Hebergeur Digital Ocean : https://www.digitalocean.com/

# Évaluation Finale

Veuillez remplir le [sondage](https://frama.link/auat_eval)


# Merci 😁 ! Et à votre disposition

[joel@datactivi.st](mailto:joel@datactivi.st)

https://github.com/datactivist/helpR (version alpha)
