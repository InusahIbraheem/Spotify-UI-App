import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/core/models/song.dart';
import 'package:spotify_ui_clone/core/theme/app_colors.dart';
import 'package:spotify_ui_clone/core/utils/formatters.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.index,
    this.onTap,
    this.trailing,
    this.showAlbum = false,
  });

  final Song song;
  final int index;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool showAlbum;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      leading: SizedBox(
        width: 40,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: song.imageUrl,
            fit: BoxFit.cover,
            placeholder: (_, _) => Container(color: AppColors.elevatedGray),
            errorWidget: (_, _, _) =>
                const Icon(Icons.music_note, color: AppColors.lightGray),
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              song.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          if (song.isExplicit)
            Container(
              margin: const EdgeInsets.only(left: 6),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                'E',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      subtitle: Text(
        showAlbum ? '${song.artistName} • ${song.albumName}' : song.artistName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.lightGray, fontSize: 13),
      ),
      trailing: trailing ??
          Text(
            Formatters.duration(song.duration),
            style: const TextStyle(color: AppColors.lightGray, fontSize: 13),
          ),
      onTap: onTap,
    );
  }
}
