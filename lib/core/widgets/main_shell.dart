import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_ui_clone/core/constants/route_names.dart';
import 'package:spotify_ui_clone/core/services/player_service.dart';
import 'package:spotify_ui_clone/core/theme/app_colors.dart';
import 'package:spotify_ui_clone/core/widgets/mini_player.dart';

class MainShell extends StatelessWidget {
  const MainShell({
    super.key,
    required this.navigationShell,
    required this.playerService,
  });

  final StatefulNavigationShell navigationShell;
  final PlayerService playerService;

  int get _currentIndex => navigationShell.currentIndex;

  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: navigationShell),
          MiniPlayer(playerService: playerService),
          NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.library_music_outlined),
                selectedIcon: Icon(Icons.library_music),
                label: 'Library',
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.elevatedGray,
        foregroundColor: AppColors.white,
        onPressed: () => context.push(RouteNames.settings),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
