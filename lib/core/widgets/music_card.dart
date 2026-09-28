import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:spotify_ui_clone/core/theme/app_colors.dart';
import 'package:spotify_ui_clone/core/utils/responsive.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.onTap,
    this.width,
    this.height,
    this.index = 0,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cardWidth = width ?? (Responsive.isMobile(context) ? 140.0 : 160.0);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Container(
                    color: AppColors.elevatedGray,
                    child: const Center(
                      child: Icon(Icons.music_note, color: AppColors.lightGray),
                    ),
                  ),
                  errorWidget: (_, _, _) => Container(
                    color: AppColors.elevatedGray,
                    child: const Icon(Icons.broken_image, color: AppColors.lightGray),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.lightGray,
                  ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: (index * 60).ms)
        .slideY(begin: 0.1, end: 0, duration: 400.ms, delay: (index * 60).ms);
  }
}
