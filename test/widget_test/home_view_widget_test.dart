// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/task_overview.dart';

import '../shared_setup/test_helper.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // TODO should build the app with mock data card list
    // cannot get the data using REST API
    await setupWidget(tester);

    // Tap on patient task card item
    await tester.tap(find.byKey(Key('PatientTaskCard 0')));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.byType(TaskOverview), findsOneWidget);
  });
}
