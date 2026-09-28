import 'package:go_router/go_router.dart';
import 'package:spotify_ui_clone/core/constants/route_names.dart';
import 'package:spotify_ui_clone/core/services/player_service.dart';
import 'package:spotify_ui_clone/core/widgets/main_shell.dart';
import 'package:spotify_ui_clone/screens/onboarding_screen.dart';
import 'package:spotify_ui_clone/screens/album_screen.dart';
import 'package:spotify_ui_clone/screens/artist_screen.dart';
import 'package:spotify_ui_clone/screens/home_screen.dart';
import 'package:spotify_ui_clone/screens/library_screen.dart';
import 'package:spotify_ui_clone/screens/login_screen.dart';
import 'package:spotify_ui_clone/screens/now_playing_screen.dart';
import 'package:spotify_ui_clone/screens/playlist_screen.dart';
import 'package:spotify_ui_clone/screens/search_screen.dart';
import 'package:spotify_ui_clone/screens/settings_screen.dart';
import 'package:spotify_ui_clone/screens/splash_screen.dart';

class AppRouter {
  AppRouter({required this.playerService});

  final PlayerService playerService;

  late final GoRouter router = GoRouter(
    initialLocation: RouteNames.onboarding,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const SpotifyOnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.nowPlaying,
        builder: (context, state) => const NowPlayingScreen(),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '${RouteNames.playlist}/:id',
        builder: (context, state) => const PlaylistScreen(),
      ),
      GoRoute(
        path: '${RouteNames.album}/:id',
        builder: (context, state) => const AlbumScreen(),
      ),
      GoRoute(
        path: '${RouteNames.artist}/:id',
        builder: (context, state) => const ArtistScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(
            navigationShell: navigationShell,
            playerService: playerService,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.search,
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.library,
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

