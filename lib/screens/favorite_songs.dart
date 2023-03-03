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
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, int index) {
          return SongCard(song: _songs[index]);
        },
      ),
    );
  }
}
