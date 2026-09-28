import 'package:spotify_ui_clone/models/app_item.dart';

class DataService {
  static List<AppItem> get items => List.generate(8, (i) => AppItem(
        id: 'item_$i',
        title: 'Premium Item ${i + 1}',
        subtitle: 'Curated content for Spotify UI Clone',
        imageUrl: 'https://picsum.photos/seed/spotify_ui_clone$i/400/300',
      ));
}
