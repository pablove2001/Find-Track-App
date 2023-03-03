import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';
import '../providers/find_songs_provider.dart';

class FoundSong extends StatelessWidget {
  final Song song;

  const FoundSong({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Found Song'),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<FindSongsProvider>().getFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<FindSongsProvider>().setFavorite();
            },
          ),
        ],
      ),
      body: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Image.network(
                    song.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      song.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      song.album,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    ),
                    Text(song.artist),
                    Text(song.releaseDate),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Color.fromARGB(255, 160, 160, 160),
                ),
              ),
              SizedBox(
                height: 140,
                child: Container(
                    child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Abrir con:'),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            song.launchSpotify();
                          },
                          child: Image.asset(
                            'assets/images/spotify.png',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            song.launchDezzer();
                          },
                          child: Image.asset(
                            'assets/images/deezer.png',
                            height: 45,
                            width: 45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            song.launchApple();
                          },
                          child: Image.asset(
                            'assets/images/apple.png',
                            height: 50,
                            width: 45,
                          ),
                        ),
                      ],
                    ))
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
