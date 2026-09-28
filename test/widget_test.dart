import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_ui_clone/main.dart';

void main() {
  testWidgets('Spotify app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const SpotifyApp());
    await tester.pump();
  });
}
