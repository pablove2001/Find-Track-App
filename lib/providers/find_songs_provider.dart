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

    String? v2 = base64;

    if (base64 != null) {
      Song? song = await requestApi(base64);

      if (song != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoundSong(
              song: song,
            ),
          ),
        );
      }
    }

    _listening = false;
    notifyListeners();
  }

  // favorite
  void setFavorite() {
    if (!_favorite) {
      _favorite = true;
    }
    notifyListeners();
  }

  bool get getFavorite => _favorite;

  void addFavoriteSong(Song song) {}
}
