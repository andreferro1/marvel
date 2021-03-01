import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:marvel_vrsoft/app/modules/character/character_page.dart';

void main() {
  testWidgets('CharacterPage has title', (tester) async {
      await tester.pumpWidget(buildTestableWidget(CharacterPage(title: 'Character')));
      final titleFinder = find.text('Character');
      expect(titleFinder, findsOneWidget);
  });
}
