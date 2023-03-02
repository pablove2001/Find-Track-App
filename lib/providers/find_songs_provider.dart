import 'package:flutter/material.dart';
import 'package:record/record.dart';

import '../utilities/record_utilities.dart';

class FindSongsProvider with ChangeNotifier {
  bool _listening = false;
  Record _audioRecorder = Record();

  // Listeninig
  void setListening() {
    _listening = !_listening;

    if (_listening)
      startRecord(_audioRecorder);
    else
      stopRecord(_audioRecorder);

    notifyListeners();
  }

  bool get getListening => _listening;
}
