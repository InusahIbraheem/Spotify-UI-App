import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/core/services/player_service.dart';
import 'package:spotify_ui_clone/core/services/router.dart';
import 'package:spotify_ui_clone/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SpotifyApp());
}

class SpotifyApp extends StatefulWidget {
  const SpotifyApp({super.key});

  @override
  State<SpotifyApp> createState() => _SpotifyAppState();
}

class _SpotifyAppState extends State<SpotifyApp> {
  final PlayerService _playerService = PlayerService();
  late final AppRouter _appRouter = AppRouter(playerService: _playerService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Spotify UI Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: _appRouter.router,
    );
  }
}
