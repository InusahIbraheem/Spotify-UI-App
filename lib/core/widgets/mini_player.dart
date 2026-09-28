import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_ui_clone/core/constants/app_constants.dart';
import 'package:spotify_ui_clone/core/constants/route_names.dart';
import 'package:spotify_ui_clone/core/services/player_service.dart';
import 'package:spotify_ui_clone/core/theme/app_colors.dart';
import 'package:spotify_ui_clone/core/widgets/glass_container.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key, required this.playerService});

  final PlayerService playerService;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: playerService,
      builder: (context, _) {
        final song = playerService.currentSong;
        if (song == null) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () => context.push(RouteNames.nowPlaying),
          child: GlassContainer(
            borderRadius: 0,
            blur: 16,
            opacity: 0.18,
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: playerService.progress,
                  minHeight: 2,
                  backgroundColor: AppColors.elevatedGray,
                  color: AppColors.spotifyGreen,
                ),
                SizedBox(
                  height: AppConstants.miniPlayerHeight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl: song.imageUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                song.artistName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColors.lightGray,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            playerService.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            color: AppColors.white,
                            size: 36,
                          ),
                          onPressed: playerService.togglePlayPause,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next, color: AppColors.white),
                          onPressed: () {
                            playerService.skipForward();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
