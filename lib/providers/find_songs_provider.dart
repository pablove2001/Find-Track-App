import 'package:find_track_app/screens/found_song.dart';
import 'package:find_track_app/utilities/request_api.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

import '../models/song.dart';
import '../utilities/record_utilities.dart';

class FindSongsProvider with ChangeNotifier {
  bool _listening = false;
  Record _audioRecorder = Record();
  bool _favorite = false;
  List<Song> _songs = [];

  // Listeninig
  void setListening(BuildContext context) {
    if (!_listening) {
      _listening = true;
      _startRecord(_audioRecorder, context);
      notifyListeners();
    }
  }

  bool get getListening => _listening;

  Future<void> _startRecord(Record audioRecorder, BuildContext context) async {
    String? base64 = await startRecord(audioRecorder);

    if (base64 != null) {
      Song? song = await requestApi(base64);

      if (song != null) {
        setInitFavorite(song);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoundSong(
              song: song,
            ),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'No se encontro la cancion o hay un problema de conexion'),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    _listening = false;
    notifyListeners();
  }

  // favorite
  void setFavorite(Song song) {
    if (!_favorite)
      addFavoriteSong(song);
    else
      removeFavoriteSong(song);

    _favorite = !_favorite;
    notifyListeners();
  }

  void setInitFavorite(Song song) {
    _favorite = isFavorite(song);
    notifyListeners();
  }

  bool get getFavorite => _favorite;

  bool isFavorite(Song song) {
    for (var s in _songs) {
      if (s.title == song.title &&
          s.album == song.album &&
          s.artist == song.artist &&
          s.releaseDate == song.releaseDate &&
          s.image == song.image &&
          s.spotify == song.spotify &&
          s.deezer == song.deezer &&
          s.apple == song.apple &&
          s.auddIo == song.auddIo) {
        return true;
      }
    }
    return false;
  }

  // songs
  void addFavoriteSong(Song song) {
    _songs.insert(0, song);
  }

  void removeFavoriteSong(Song song) {
    _songs.removeWhere((s) =>
        s.title == song.title &&
        s.album == song.album &&
        s.artist == song.artist &&
        s.releaseDate == song.releaseDate &&
        s.image == song.image &&
        s.spotify == song.spotify &&
        s.deezer == song.deezer &&
        s.apple == song.apple &&
        s.auddIo == song.auddIo);

    notifyListeners();
  }

  List<Song> get getSongs => _songs;
}
