import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_ui_clone/core/utils/responsive.dart';
import 'package:spotify_ui_clone/widgets/animated_page.dart';
import 'package:spotify_ui_clone/widgets/glass_card.dart';
import 'package:spotify_ui_clone/widgets/premium_card.dart';
import 'package:spotify_ui_clone/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      title: 'Home',
      showBackButton: true,
      children: [
        GlassCard(
          child: Row(
            children: [
              Hero(
                tag: 'hero_home',
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.home_rounded, size: 32, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good evening', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Made for you playlists', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: Responsive.gridCount(context, mobile: 2, tablet: 3, desktop: 4),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.4,
          children: List.generate(4, (i) => PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_rounded, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 8),
                Text('Item ${i + 1}', style: const TextStyle(fontWeight: FontWeight.w600)),
                Text('Premium content', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          )),
        ),
        const SizedBox(height: 20),
        const SectionHeader(title: 'Quick Access'),
        
            PremiumCard(
              onTap: () => context.push('/splash'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Splash', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/login'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Login', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/search'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Search', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/library'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Library', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/playlist'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Playlist', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/album'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Album', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
        
      ],
    );
  }
}
