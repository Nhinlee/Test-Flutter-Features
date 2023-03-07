// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_new_feature/main.dart' as m;

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const m.MyApp());

    // Swipe the item to dismiss it.
    await tester.drag(
      find.byKey(
        Key('Drag item: 0'),
      ),
      const Offset(0, 500.0),
    );

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // await Future.delayed(const Duration(seconds: 10));
  });
}
