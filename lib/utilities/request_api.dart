import 'dart:convert';
import 'package:find_track_app/models/song.dart';
import 'package:http/http.dart' as http;

Future<Song?> requestApi(String base64) async {
  var uri = Uri.https('api.audd.io');
  var data = {
    'return': 'apple_music,spotify',
    'api_token': 'd8760ec47436eb40c9d8a647943ec3fd',
    'audio': base64,
  };

  var response = await http.post(
    uri,
    body: data,
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body)['result'];

    if (result == null) return null;

    var r = result;

    var song = Song(
      title: result['title'],
      album: result['album'],
      artist: result['artist'],
      releaseDate: result['release_date'],
      image: result['spotify']['album']['images'][0]['url'] ??
          'https://th.bing.com/th/id/R.436c5ea3e5e38a4bfed004056b7d1e69?rik=HzFJk91la5VjWQ&pid=ImgRaw&r=0',
      spotify: result['spotify'][''] ?? 'https://open.spotify.com',
      // deezer: result['deezer']['link'] ?? 'https://www.deezer.com',
      apple: result['apple_music']['url'] ?? 'https://music.apple.com',
      auddIo: result['song_link'] ?? 'https://www.audd.io',
    );

    return song;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  return null;
}
