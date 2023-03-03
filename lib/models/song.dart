import 'package:url_launcher/url_launcher.dart';

class Song {
  final String title;
  final String album;
  final String artist;
  final String releaseDate;
  final String image;
  final String spotify;
  final String deezer;
  final String apple;
  final String auddIo;

  Song({
    this.title = 'No title',
    this.album = 'No album',
    this.artist = 'No artist',
    this.releaseDate = 'YYYY-MM-DD',
    this.image =
        'https://th.bing.com/th/id/R.436c5ea3e5e38a4bfed004056b7d1e69?rik=HzFJk91la5VjWQ&pid=ImgRaw&r=0',
    this.spotify = 'https://open.spotify.com',
    this.deezer = 'https://www.deezer.com',
    this.apple = 'https://music.apple.com',
    this.auddIo = 'https://www.audd.io',
  });

  Future<void> launchSpotify() async {
    var url = Uri.parse(spotify);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchDezzer() async {
    var url = Uri.parse(deezer);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchApple() async {
    var url = Uri.parse(apple);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchAuddIo() async {
    var url = Uri.parse(auddIo);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
