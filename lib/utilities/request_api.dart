import 'dart:convert';
import 'package:find_track_app/models/song.dart';
import 'package:find_track_app/utilities/keys.dart';
import 'package:http/http.dart' as http;

Future<Song?> requestApi(String base64) async {
  var uri = Uri.https('api.audd.io');
  var data = {
    'return': 'apple_music,spotify,deezer',
    'api_token': apiToken,
    'audio': base64,
  };

  var response = await http.post(
    uri,
    body: data,
  );

  if (response.statusCode == 200) {
    var result = json.decode(response.body)['result'];

    if (result == null) return null;

    // image
    String image = '';
    if (result['spotify'] != null &&
        result['spotify']['album'] != null &&
        result['spotify']['album']['images'] != null &&
        result['spotify']['album']['images'][0] != null &&
        result['spotify']['album']['images'][0]['url'] != null)
      image = result['spotify']['album']['images'][0]['url'];
    else if (result['deezer'] != null &&
        result['deezer']['contributors'] != null &&
        result['deezer']['contributors'][0] != null &&
        result['deezer']['contributors'][0]['picture_xl'] != null)
      image = result['deezer']['contributors'][0]['picture_xl'];
    else if (result['apple_music'] != null &&
        result['apple_music']['artwork'] != null &&
        result['apple_music']['artwork']['url'] != null)
      image = result['apple_music']['artwork']['url']
          .replaceAll('{w}', '500')
          .replaceAll('{h}', '500');
    else
      image =
          'https://th.bing.com/th/id/R.436c5ea3e5e38a4bfed004056b7d1e69?rik=HzFJk91la5VjWQ&pid=ImgRaw&r=0';

    // spotify
    String spotify = '';
    if (result['spotify'] != null &&
        result['spotify']['album'] != null &&
        result['spotify']['album']['artists'] != null &&
        result['spotify']['album']['artists'][0] != null &&
        result['spotify']['album']['artists'][0]['external_urls'] != null &&
        result['spotify']['album']['artists'][0]['external_urls']['spotify'] !=
            null)
      spotify =
          result['spotify']['album']['artists'][0]['external_urls']['spotify'];
    else
      spotify = 'https://open.spotify.com';

    // deezer
    String deezer = '';
    if (result['deezer'] != null && result['deezer']['link'] != null)
      deezer = result['deezer']['link'];
    else
      deezer = 'https://www.deezer.com';

    // apple
    String apple = '';
    if (result['apple_music'] != null && result['apple_music']['url'] != null)
      apple = result['apple_music']['url'];
    else
      apple = 'https://music.apple.com';

    var song = Song(
      title: result['title'],
      album: result['album'],
      artist: result['artist'],
      releaseDate: result['release_date'],
      auddIo: result['song_link'] ?? 'https://www.audd.io',
      image: image,
      spotify: spotify,
      deezer: deezer,
      apple: apple,
    );

    return song;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  return null;
}
