import 'package:flutter/foundation.dart';
import 'package:spotify_ui_clone/core/models/song.dart';

class PlayerService extends ChangeNotifier {
  Song? _currentSong;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = const Duration(minutes: 3, seconds: 30);
  bool _isShuffle = false;
  bool _isRepeat = false;
  double _volume = 0.7;

  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  bool get isShuffle => _isShuffle;
  bool get isRepeat => _isRepeat;
  double get volume => _volume;
  bool get hasTrack => _currentSong != null;

  double get progress {
    if (_duration.inMilliseconds == 0) return 0;
    return (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0);
  }

  void playSong(Song song) {
    _currentSong = song;
    _duration = song.duration;
    _position = Duration.zero;
    _isPlaying = true;
    notifyListeners();
  }

  void togglePlayPause() {
    if (_currentSong == null) return;
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void seekTo(double value) {
    _position = Duration(
      milliseconds: (_duration.inMilliseconds * value).round(),
    );
    notifyListeners();
  }

  void skipForward() {
    final next = Duration(seconds: _position.inSeconds + 10);
    _position = next > _duration ? _duration : next;
    notifyListeners();
  }

  void skipBackward() {
    final prev = Duration(seconds: _position.inSeconds - 10);
    _position = prev.isNegative ? Duration.zero : prev;
    notifyListeners();
  }

  void toggleShuffle() {
    _isShuffle = !_isShuffle;
    notifyListeners();
  }

  void toggleRepeat() {
    _isRepeat = !_isRepeat;
    notifyListeners();
  }

  void setVolume(double value) {
    _volume = value.clamp(0.0, 1.0);
    notifyListeners();
  }

  void simulateProgress() {
    if (!_isPlaying || _currentSong == null) return;
    if (_position >= _duration) {
      _position = Duration.zero;
      _isPlaying = false;
    } else {
      _position += const Duration(seconds: 1);
    }
    notifyListeners();
  }
}
