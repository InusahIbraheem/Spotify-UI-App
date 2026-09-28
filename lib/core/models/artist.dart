import 'package:spotify_ui_clone/core/models/album.dart';
import 'package:spotify_ui_clone/core/models/song.dart';

class Artist {
  const Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.monthlyListeners,
    required this.bio,
    required this.topSongs,
    required this.albums,
    required this.relatedArtists,
  });

  final String id;
  final String name;
  final String imageUrl;
  final int monthlyListeners;
  final String bio;
  final List<Song> topSongs;
  final List<Album> albums;
  final List<String> relatedArtists;
}
