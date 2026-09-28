import 'package:spotify_ui_clone/core/models/song.dart';

class Album {
  const Album({
    required this.id,
    required this.title,
    required this.artistName,
    required this.imageUrl,
    required this.releaseYear,
    required this.songs,
    required this.genres,
  });

  final String id;
  final String title;
  final String artistName;
  final String imageUrl;
  final int releaseYear;
  final List<Song> songs;
  final List<String> genres;

  Duration get totalDuration =>
      songs.fold(Duration.zero, (sum, song) => sum + song.duration);
}
