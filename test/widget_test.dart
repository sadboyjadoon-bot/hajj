import 'dart:ui' show Size;

import 'package:flutter/material.dart' show Scrollable, ValueKey;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hajj_routine/app.dart';
import 'package:hajj_routine/providers/app_state.dart';
import 'package:hajj_routine/shared/providers/app_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('onboarding leads to the Hajj dashboard', (tester) async {
    final state = AppState();
    await state.load();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appStateProvider.overrideWith((ref) => state)],
        child: const HajjRoutineApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1400));
    await tester.pumpAndSettle();

    expect(find.textContaining('Your Hajj,'), findsOneWidget);
    await tester.tap(find.text('Begin your journey'));
    await tester.pumpAndSettle();

    expect(find.text('Your Hajj progress'), findsOneWidget);
    expect(find.text('SELECTED HAJJ DAY'), findsOneWidget);
    expect(find.byKey(const ValueKey('live-date-time')), findsOneWidget);
    expect(find.textContaining('Device local time'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Today’s focus'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Today’s focus'), findsOneWidget);
  });

  testWidgets('bottom navigation opens the routine screen', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    final state = AppState();
    await state.load();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appStateProvider.overrideWith((ref) => state)],
        child: const HajjRoutineApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1400));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Routine').last);
    await tester.pumpAndSettle();
    expect(find.text('Your days of Hajj'), findsOneWidget);
    expect(find.text('The great standing'), findsOneWidget);
  });

  testWidgets('Masnoon Azkar can be filtered by evening', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    final state = AppState();
    await state.load();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [appStateProvider.overrideWith((ref) => state)],
        child: const HajjRoutineApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1400));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Duas').last);
    await tester.pumpAndSettle();
    expect(find.text('Duas & Masnoon Azkar'), findsOneWidget);

    await tester.tap(find.text('Evening'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('O Allah, by You we enter the evening'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('O Allah, by You we enter the evening'), findsOneWidget);
    expect(find.text('O Allah, by You we enter the morning'), findsNothing);
  });
}
