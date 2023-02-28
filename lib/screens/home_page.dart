import 'package:avatar_glow/avatar_glow.dart';
import 'package:find_track_app/screens/favorite_songs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _listening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Text(
            _listening ? 'Escuchando...' : 'Toque para escuchar',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 70,
          ),
          AvatarGlow(
            glowColor: Colors.blue,
            endRadius: 150.0,
            duration: Duration(milliseconds: 1500),
            repeat: true,
            showTwoGlows: _listening,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              // Replace this child with your own
              elevation: 8.0,
              shape: const CircleBorder(),
              child: MaterialButton(
                shape: const CircleBorder(),
                onPressed: () {
                  // print('funciona');
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 90.0,
                  child: Image.asset(
                    'assets/images/music_icon.png',
                    height: 110,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
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
                  setState(() {
                    _listening = !_listening;
                  });
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
        ],
      ),
    );
  }
}
