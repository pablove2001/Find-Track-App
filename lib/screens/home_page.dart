import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:find_track_app/models/song.dart';
import 'package:find_track_app/providers/find_songs_provider.dart';
import 'package:find_track_app/screens/found_song.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/favorite_songs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Text(
              context.watch<FindSongsProvider>().getListening
                  ? 'Escuchando...'
                  : 'Toque para escuchar',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 70,
            ),
            AvatarGlow(
              glowColor: Color.fromARGB(255, 130, 184, 255),
              endRadius: 150.0,
              duration: Duration(milliseconds: 1500),
              repeat: true,
              showTwoGlows: true,
              animate: context.watch<FindSongsProvider>().getListening,
              child: Material(
                // Replace this child with your own
                elevation: 8.0,
                shape: const CircleBorder(),
                child: MaterialButton(
                  shape: const CircleBorder(),
                  onPressed: () {
                    context.read<FindSongsProvider>().setListening(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 90.0,
                    child: Image.asset(
                      'assets/images/icon_music.png',
                      height: 110,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: !context.watch<FindSongsProvider>().getListening,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      var v2 = context.read<FindSongsProvider>().getSongs;
                      var v3 = v2;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FavoriteSongs(),
                        ),
                      );
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.favorite,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      print('pressed');
                    },
                    onLongPress: () {
                      print('longpress');
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.power_settings_new,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
