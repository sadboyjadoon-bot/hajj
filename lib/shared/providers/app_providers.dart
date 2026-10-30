import 'package:flutter_riverpod/legacy.dart' show ChangeNotifierProvider;

import '../../providers/app_state.dart';

final appStateProvider = ChangeNotifierProvider<AppState>(
  (ref) => throw StateError(
    'AppState must be initialized and overridden at application startup.',
  ),
);
