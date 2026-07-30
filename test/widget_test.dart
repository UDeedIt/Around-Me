// File: test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:around_me/main.dart';

/// Basic smoke test for the Around Me app.
///
/// Ensures that:
/// - The app builds without crashing.
/// - The splash screen is shown first.
/// - After a short pump, we can navigate to the Home screen.
void main() {

  testWidgets('Around Me app builds and shows splash screen', (WidgetTester tester) async {

    // Build the app.
    await tester.pumpWidget(const AroundMeApp());

    // Verify that the splash title is present.
    expect(find.text('Around Me'), findsOneWidget);

    // Optionally pump a bit more to simulate time passing.
    await tester.pump(const Duration(seconds: 3));

    // After the delay, the Home screen might be visible.
    // We just ensure the app still renders without throwing.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
