import 'package:find_track_app/providers/find_songs_provider.dart';
import 'package:find_track_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (context) => FindSongsProvider(),
        child: HomePage(),
      ),
    );
  }
}
