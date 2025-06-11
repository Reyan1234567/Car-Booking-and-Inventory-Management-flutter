import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterpolo/main.dart'; // Adjust import path if needed

void main() {
  testWidgets('MyApp widget renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that MyApp is rendered. This is a very basic check.
    // You might want to check for specific text or widgets once you know what's in your main app.
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Verify app title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
  });

  testWidgets('Verify counter increments', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Verify counter decrements', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Verify counter resets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);

    // Tap the reset button and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that our counter has reset.
    expect(find.text('0'), findsOneWidget);
  });

  // Add more widget tests here if needed
}