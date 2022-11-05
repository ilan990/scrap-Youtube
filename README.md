# ORT Youtube Project

#### Etape 0: Cloner ce projet et créer une branche à partir de la branche `main`

#### Etape 1: Créer un fichier `channels.json` contenant la liste des chaînes à télécharger. Le fichier doit être au format JSON et doit contenir un tableau d'objets contenant les champs `name` et `url`. Par exemple:

```json
[
  {
    "name": "Chaîne 1",
    "url": "https://www.youtube.com/channel/UC1",
    "id": "UC1"
  },
  {
    "name": "Chaîne 2",
    "url": "https://www.youtube.com/channel/UC2",
    "id": "UC2"
  }
]
```

#### Etape 2: Créer un fichier `scraper.rb` qui permet de récupérer la liste des 5 dernières videos postées sur le channel. Le fichier doit contenir au moins 2 méthodes.

- `get_last_5_videos(channel_id)`: qui doit retourner un tableau avec 5 ids de videos

Les videos se trouvent à l'url `https://www.youtube.com/channel/channel_id/videos`. Il faut utiliser la gem `nokogiri` pour parser le html et récupérer les ids des videos. Il faudra aussi télécharger le HTML de la page et le sauvegarder dans un fichier `channel_id.html` pour éviter de télécharger la page à chaque fois.

- `save_last_5_videos`: qui doit sauvegarder les 5 dernières vidéos dans un fichier `last_5_videos.json` au format JSON. Le fichier doit contenir un tableau d'objets contenant les champs `id`, `name` et `videos`.

Exemple:

```json
[
  {
    "id": "UC8HMvOLE0etpO_eVjJ98bHA",
    "name": "DADJU",
    "videos": [
      "UOx_rtP53BM",
      "QKFzFjRJUEg",
      "iel2gC1VXfQ",
      "zaulRorQj2Y",
      "l781wk_ziY8"
    ]
  }
]
```

#### Etape 3: Créer un fichier `raw_videos_details.rb` qui permet de récupérer les détails des vidéos en utilisation l'API de Youtube. Le fichier doit contenir au moins 3 méthodes.

- `get_video_details(video_id)` qui doit retourner un tableau d'objets contenant les détails d'une. Les détails des vidéos se trouvent à l'url ` "https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&key=#{YT_API_KEY}&part=snippet,contentDetails,statistics,status"`. Il faut utiliser la gem `httparty` pour récupérer les détails des vidéos.

`YT_API_KEY` est une constante qui contient la clé d'API de Youtube à générer depuis le site de [Google](https://console.cloud.google.com/).

- `save_raw_video_details(video_id)`: qui doit sauvegarder les détails de la vidéo dans un fichier `video_id.json` au format JSON.

- `save_raw_video_details_for_all_channels`: qui doit parcourir le fichier `last_5_videos.json` et appeler la méthode `save_raw_video_details` pour chaque vidéo.

#### Etape 4: Créer un fichier `video_details.rb` qui permet d'extraire les détails des vidéos qui nous intéressent. Le fichier doit contenir 2 méthodes.

- `extract_video_details`: qui permet d'extraire les données qui nous intéressent et retourne un json avec les détails de la vidéo.

```json
{
  "id": "l781wk_ziY8",
  "thumbnail": "https://i.ytimg.com/vi/l781wk_ziY8/hqdefault.jpg",
  "title": "DADJU - PICSOU (FEAT. GAZO) (AUDIO OFFICIEL)",
  "published_at": "2022-05-12",
  "channel_title": "DADJU",
  "channel_id": "UC8HMvOLE0etpO_eVjJ98bHA",
  "views": 354396,
  "likes": 7086,
  "comments": 201,
  "views_to_s": "354,396",
  "likes_to_s": "7,086",
  "comments_to_s": "201",
  "yt_link": "https://www.youtube.com/watch?v=l781wk_ziY8"
}
```

- `save_video_details_for_all_channels`: qui doit parcourir le fichier `last_5_videos.json` et appeler la méthode `extract_video_details` pour chaque vidéo. Le résultat devra être stocké dans un fichier `videos.json` au format JSON.

#### Etape 5: Créer un fichier `best_videos.rb` qui permet de récupérer les 10 meilleures vidéos postées au courant des 90 derniers jours. Le fichier doit contenir au moins 2 méthodes.

- `best_videos`: qui doit retourner un tableau de 10 vidéos publiées au courant des 90 derniers jours et triées par nombre de vues décroissant.
- `save_best_videos`: qui doit sauvegarder les 10 meilleures vidéos dans un fichier `best_videos.json` au format JSON.

#### Etape 6: Créer un fichier `airtable.rb` qui permet de sauvegarder les vidéos dans une base Airtable. Le fichier doit contenir au moins 1 méthode.

- `save_videos_to_airtable`: qui doit sauvegarder les vidéos dans une base Airtable. Il faut créer une base Airtable avec 1 tables: `videos`. La table `Videos` doit contenir les champs `title`, `artist`, `views`, `published_at `, `yt_link`, `channel_id`, `thumbnail`, `likes`, `comments` .
