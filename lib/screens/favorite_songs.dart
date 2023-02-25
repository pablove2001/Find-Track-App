import 'package:flutter/material.dart';

class FavoriteSongs extends StatefulWidget {
  const FavoriteSongs({super.key});

  @override
  State<FavoriteSongs> createState() => _FavoriteSongsState();
}

class _FavoriteSongsState extends State<FavoriteSongs> {
  final _songs = [
    {
      "name": "Song1",
      "link1": "http://song1link1.com",
      "link2": "http://song1link2.com",
      "link3": "http://song1link3.com",
      "image":
          "https://th.bing.com/th/id/OIP.-EiPhDmEtaIiCzvw6714EgHaFj?pid=ImgDet&rs=1",
    },
    {
      "name": "Song2",
      "link1": "http://song2link1.com",
      "link2": "http://song2link3.com",
      "link3": "http://song2link3.com",
      "image":
          "https://th.bing.com/th/id/OIP.-EiPhDmEtaIiCzvw6714EgHaFj?pid=ImgDet&rs=1",
    },
    {
      "name": "Song3",
      "link1": "http://song3link1.com",
      "link2": "http://song3link3.com",
      "link3": "http://song3link3.com",
      "image":
          "https://th.bing.com/th/id/OIP.-EiPhDmEtaIiCzvw6714EgHaFj?pid=ImgDet&rs=1",
    },
    {
      "name": "Song4",
      "link1": "http://song4link1.com",
      "link2": "http://song4link3.com",
      "link3": "http://song4link3.com",
      "image":
          "https://th.bing.com/th/id/OIP.-EiPhDmEtaIiCzvw6714EgHaFj?pid=ImgDet&rs=1",
    },
    {
      "name": "Song5",
      "link1": "http://song5link1.com",
      "link2": "http://song5link3.com",
      "link3": "http://song5link3.com",
      "image":
          "https://th.bing.com/th/id/OIP.-EiPhDmEtaIiCzvw6714EgHaFj?pid=ImgDet&rs=1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              leading: Image.network('${_songs[index]['image']}'),
              title: Text('${_songs[index]['name']}'),
              subtitle: Text('Artista: ${_songs[index]['link1']}'),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Acción al presionar el botón favorito
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
