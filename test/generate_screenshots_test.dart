import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:spotify_ui_clone/core/theme/app_theme.dart';
import 'package:spotify_ui_clone/screens/onboarding_screen.dart';
import 'package:spotify_ui_clone/screens/home_screen.dart';
import 'package:spotify_ui_clone/screens/search_screen.dart';
import 'package:spotify_ui_clone/screens/library_screen.dart';
import 'package:spotify_ui_clone/screens/now_playing_screen.dart';
import 'package:spotify_ui_clone/screens/playlist_screen.dart';
import 'package:spotify_ui_clone/screens/album_screen.dart';
import 'package:spotify_ui_clone/screens/artist_screen.dart';
import 'package:spotify_ui_clone/screens/login_screen.dart';
import 'package:spotify_ui_clone/screens/settings_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Generate high-res screenshots for Spotify UI Clone App', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;

    final screens = <String, Widget>{
      '01_onboarding': const SpotifyOnboardingScreen(),
      '02_home': const HomeScreen(),
      '03_search': const SearchScreen(),
      '04_library': const LibraryScreen(),
      '05_now_playing': const NowPlayingScreen(),
      '06_playlist': const PlaylistScreen(),
      '07_album': const AlbumScreen(),
      '08_artist': const ArtistScreen(),
      '09_login': const LoginScreen(),
      '10_settings': const SettingsScreen(),
    };

    final dir = Directory('screenshots');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    for (final entry in screens.entries) {
      final repaintBoundaryKey = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: RepaintBoundary(
            key: repaintBoundaryKey,
            child: entry.value,
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final boundary = repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2.0);
          final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          if (byteData != null) {
            final pngBytes = byteData.buffer.asUint8List();
            final file = File('screenshots/${entry.key}.png');
            await file.writeAsBytes(pngBytes);
            // ignore: avoid_print
            print('Saved screenshot: screenshots/${entry.key}.png (${pngBytes.length} bytes)');
          }
        });
      }
    }
  });
}
