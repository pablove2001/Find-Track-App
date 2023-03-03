import 'package:flutter/material.dart';

import '../models/song.dart';
import '../widgets/song_card.dart';

class FavoriteSongs extends StatelessWidget {
  static List<Song> _songs = [
    Song(),
    Song(),
    Song(),
    Song(),
    Song(),
  ];

  const FavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SongCard(song: _songs[index]),
            );
          },
        ),
      ),
    );
  }
}
