import 'package:flutter_test/flutter_test.dart';

import 'package:bullet_buddy/main.dart';

void main() {
  testWidgets('App title found', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Text Widget that displays the app title exists
    expect(find.text('Bullet Buddy'), findsOneWidget);
  });
}
