import 'package:spotify_ui_clone/core/models/album.dart';
import 'package:spotify_ui_clone/core/models/artist.dart';
import 'package:spotify_ui_clone/core/models/playlist.dart';
import 'package:spotify_ui_clone/core/models/song.dart';

class MockDataService {
  MockDataService._();

  static final MockDataService instance = MockDataService._();

  static const _coverBase =
      'https://images.unsplash.com/photo-';

  final List<Song> songs = [
    const Song(
      id: 's1',
      title: 'Blinding Lights',
      artistName: 'The Weeknd',
      albumName: 'After Hours',
      imageUrl:
          '${_coverBase}1493225457124-a3eb161ffa5f?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 20),
      isExplicit: false,
    ),
    const Song(
      id: 's2',
      title: 'Starboy',
      artistName: 'The Weeknd',
      albumName: 'Starboy',
      imageUrl:
          '${_coverBase}1470225620780-dba8ba953712?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 50),
      isExplicit: true,
    ),
    const Song(
      id: 's3',
      title: 'Save Your Tears',
      artistName: 'The Weeknd',
      albumName: 'After Hours',
      imageUrl:
          '${_coverBase}1511379938034-f79489023668?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 35),
    ),
    const Song(
      id: 's4',
      title: 'Levitating',
      artistName: 'Dua Lipa',
      albumName: 'Future Nostalgia',
      imageUrl:
          '${_coverBase}1514525253161-7a46d19cd819?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 23),
    ),
    const Song(
      id: 's5',
      title: 'Don\'t Start Now',
      artistName: 'Dua Lipa',
      albumName: 'Future Nostalgia',
      imageUrl:
          '${_coverBase}1459740669065-2aae185c825e?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 3),
    ),
    const Song(
      id: 's6',
      title: 'As It Was',
      artistName: 'Harry Styles',
      albumName: 'Harry\'s House',
      imageUrl:
          '${_coverBase}1511674788456-a343cbe0be86?w=400&h=400&fit=crop',
      duration: Duration(minutes: 2, seconds: 47),
    ),
    const Song(
      id: 's7',
      title: 'Watermelon Sugar',
      artistName: 'Harry Styles',
      albumName: 'Fine Line',
      imageUrl:
          '${_coverBase}1485579149621-3123dd979885?w=400&h=400&fit=crop',
      duration: Duration(minutes: 2, seconds: 54),
    ),
    const Song(
      id: 's8',
      title: 'Bad Guy',
      artistName: 'Billie Eilish',
      albumName: 'When We All Fall Asleep',
      imageUrl:
          '${_coverBase}1498038432885-c6f33f7d0a85?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 14),
      isExplicit: true,
    ),
    const Song(
      id: 's9',
      title: 'Happier Than Ever',
      artistName: 'Billie Eilish',
      albumName: 'Happier Than Ever',
      imageUrl:
          '${_coverBase}1506157786151-6a8c8e704403?w=400&h=400&fit=crop',
      duration: Duration(minutes: 4, seconds: 58),
    ),
    const Song(
      id: 's10',
      title: 'Flowers',
      artistName: 'Miley Cyrus',
      albumName: 'Endless Summer Vacation',
      imageUrl:
          '${_coverBase}1516280440614-379397bb6dac?w=400&h=400&fit=crop',
      duration: Duration(minutes: 3, seconds: 20),
    ),
  ];

  late final List<Album> albums = [
    Album(
      id: 'a1',
      title: 'After Hours',
      artistName: 'The Weeknd',
      imageUrl: songs[0].imageUrl,
      releaseYear: 2020,
      genres: ['R&B', 'Pop', 'Synth-pop'],
      songs: [songs[0], songs[2]],
    ),
    Album(
      id: 'a2',
      title: 'Future Nostalgia',
      artistName: 'Dua Lipa',
      imageUrl: songs[3].imageUrl,
      releaseYear: 2020,
      genres: ['Pop', 'Disco', 'Dance-pop'],
      songs: [songs[3], songs[4]],
    ),
    Album(
      id: 'a3',
      title: 'Harry\'s House',
      artistName: 'Harry Styles',
      imageUrl: songs[5].imageUrl,
      releaseYear: 2022,
      genres: ['Pop', 'Soft rock'],
      songs: [songs[5], songs[6]],
    ),
    Album(
      id: 'a4',
      title: 'Happier Than Ever',
      artistName: 'Billie Eilish',
      imageUrl: songs[8].imageUrl,
      releaseYear: 2021,
      genres: ['Alternative', 'Pop'],
      songs: [songs[7], songs[8]],
    ),
  ];

  late final List<Playlist> playlists = [
    Playlist(
      id: 'p1',
      title: 'Today\'s Top Hits',
      description: 'The hottest tracks right now.',
      imageUrl: songs[0].imageUrl,
      owner: 'Spotify',
      followers: 34200000,
      isPublic: true,
      songs: [songs[0], songs[3], songs[5], songs[9]],
    ),
    Playlist(
      id: 'p2',
      title: 'Chill Vibes',
      description: 'Relax and unwind with mellow tunes.',
      imageUrl: songs[6].imageUrl,
      owner: 'inusah_ibraheem',
      followers: 128400,
      isPublic: true,
      songs: [songs[6], songs[2], songs[4], songs[7]],
    ),
    Playlist(
      id: 'p3',
      title: 'Workout Energy',
      description: 'High tempo tracks to keep you moving.',
      imageUrl: songs[1].imageUrl,
      owner: 'inusah_ibraheem',
      followers: 89200,
      isPublic: false,
      songs: [songs[1], songs[3], songs[5], songs[9]],
    ),
    Playlist(
      id: 'p4',
      title: 'Late Night Drive',
      description: 'Perfect soundtrack for midnight cruises.',
      imageUrl: songs[2].imageUrl,
      owner: 'Spotify',
      followers: 2100000,
      isPublic: true,
      songs: [songs[2], songs[0], songs[8], songs[4]],
    ),
  ];

  late final List<Artist> artists = [
    Artist(
      id: 'ar1',
      name: 'The Weeknd',
      imageUrl: songs[0].imageUrl,
      monthlyListeners: 98500000,
      bio:
          'The Weeknd is a Canadian singer-songwriter known for his distinctive voice and dark R&B sound that shaped modern pop music.',
      topSongs: [songs[0], songs[1], songs[2]],
      albums: [albums[0]],
      relatedArtists: ['Drake', 'Dua Lipa', 'Post Malone'],
    ),
    Artist(
      id: 'ar2',
      name: 'Dua Lipa',
      imageUrl: songs[3].imageUrl,
      monthlyListeners: 87200000,
      bio:
          'Dua Lipa is a British-Albanian pop star whose disco-infused hits have dominated charts worldwide since 2017.',
      topSongs: [songs[3], songs[4]],
      albums: [albums[1]],
      relatedArtists: ['The Weeknd', 'Harry Styles', 'Doja Cat'],
    ),
    Artist(
      id: 'ar3',
      name: 'Harry Styles',
      imageUrl: songs[5].imageUrl,
      monthlyListeners: 65400000,
      bio:
          'Harry Styles is an English singer and actor who evolved from boy band fame into a critically acclaimed solo artist.',
      topSongs: [songs[5], songs[6]],
      albums: [albums[2]],
      relatedArtists: ['Billie Eilish', 'Dua Lipa', 'Lizzo'],
    ),
    Artist(
      id: 'ar4',
      name: 'Billie Eilish',
      imageUrl: songs[7].imageUrl,
      monthlyListeners: 92100000,
      bio:
          'Billie Eilish is an American singer-songwriter who redefined pop with whispery vocals and cinematic production.',
      topSongs: [songs[7], songs[8]],
      albums: [albums[3]],
      relatedArtists: ['Finneas', 'Lorde', 'Harry Styles'],
    ),
  ];

  final List<String> browseCategories = [
    'Podcasts',
    'Made For You',
    'New Releases',
    'Charts',
    'Hip-Hop',
    'Pop',
    'Rock',
    'Jazz',
    'Classical',
    'Indie',
    'Afrobeats',
    'K-Pop',
  ];

  late final List<Map<String, dynamic>> recentlyPlayed = [
    {'title': 'Liked Songs', 'type': 'Playlist', 'imageUrl': songs[0].imageUrl},
    {'title': 'After Hours', 'type': 'Album', 'imageUrl': songs[0].imageUrl},
    {'title': 'The Weeknd', 'type': 'Artist', 'imageUrl': songs[0].imageUrl},
    {'title': 'Chill Vibes', 'type': 'Playlist', 'imageUrl': songs[6].imageUrl},
  ];

  Song? getSongById(String id) {
    try {
      return songs.firstWhere((song) => song.id == id);
    } catch (_) {
      return null;
    }
  }

  Album? getAlbumById(String id) {
    try {
      return albums.firstWhere((album) => album.id == id);
    } catch (_) {
      return null;
    }
  }

  Playlist? getPlaylistById(String id) {
    try {
      return playlists.firstWhere((playlist) => playlist.id == id);
    } catch (_) {
      return null;
    }
  }

  Artist? getArtistById(String id) {
    try {
      return artists.firstWhere((artist) => artist.id == id);
    } catch (_) {
      return null;
    }
  }

  List<Song> search(String query) {
    if (query.trim().isEmpty) return [];
    final lower = query.toLowerCase();
    return songs.where((song) {
      return song.title.toLowerCase().contains(lower) ||
          song.artistName.toLowerCase().contains(lower) ||
          song.albumName.toLowerCase().contains(lower);
    }).toList();
  }
}

