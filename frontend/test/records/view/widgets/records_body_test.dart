// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siplicity/records/records.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecordsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: RecordsBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
