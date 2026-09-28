class Song {
  const Song({
    required this.id,
    required this.title,
    required this.artistName,
    required this.albumName,
    required this.imageUrl,
    required this.duration,
    this.isExplicit = false,
  });

  final String id;
  final String title;
  final String artistName;
  final String albumName;
  final String imageUrl;
  final Duration duration;
  final bool isExplicit;
}
