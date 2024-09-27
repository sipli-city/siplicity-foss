// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:siplicity/workspace/widgets/record_trees.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkspaceBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: InputRecordsBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
