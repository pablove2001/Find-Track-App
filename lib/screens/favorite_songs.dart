import 'package:find_track_app/providers/find_songs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';
import '../widgets/song_card.dart';

class FavoriteSongs extends StatelessWidget {
  const FavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: context.watch<FindSongsProvider>().getSongs.length == 0
          ? Center(
              child: Text(
              'Todavia no hay canciones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ))
          : ListView.builder(
              itemCount: context.watch<FindSongsProvider>().getSongs.length,
              itemBuilder: (context, int index) {
                return SongCard(
                    song: context.watch<FindSongsProvider>().getSongs[index]);
              },
            ),
    );
  }
}
