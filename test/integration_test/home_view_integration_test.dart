import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../shared_setup/test_helper.dart';

// TODO Deprecated, cannot be run with null-safety. Waiting for a package update
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Pressing the icon button on home view, should open the scanView ready to scan a barcode',
      (WidgetTester tester) async {
    /// Arrange
    await setupWidget(tester);

    /// Act
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    /// Assert
    expect(find.byType(Text), findsNWidgets(2));
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
