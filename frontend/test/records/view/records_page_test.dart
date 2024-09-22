/* ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siplicity/records/records.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecordsPage', () {
    group('route', () {
      test('is routable', () {
        expect(RecordsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RecordsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RecordsPage()));
      expect(find.byType(RecordsView), findsOneWidget);
    });
  });
}
*/