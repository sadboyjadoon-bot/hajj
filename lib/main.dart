import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'providers/app_state.dart';
import 'shared/providers/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.load();
  runApp(
    ProviderScope(
      overrides: [appStateProvider.overrideWith((ref) => appState)],
      child: const HajjRoutineApp(),
    ),
  );
}
