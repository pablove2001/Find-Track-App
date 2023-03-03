import 'package:find_track_app/models/song.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hola'),
    );
  }
}
