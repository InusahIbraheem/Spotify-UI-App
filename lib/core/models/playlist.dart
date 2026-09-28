import 'package:spotify_ui_clone/core/models/song.dart';

class Playlist {
  const Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.owner,
    required this.songs,
    required this.followers,
    required this.isPublic,
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String owner;
  final List<Song> songs;
  final int followers;
  final bool isPublic;

  Duration get totalDuration =>
      songs.fold(Duration.zero, (sum, song) => sum + song.duration);
}
