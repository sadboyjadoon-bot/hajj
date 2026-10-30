import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  late SharedPreferences _preferences;
  final Set<String> _completedRituals = {};
  final Set<String> _completedPacking = {};
  final Set<String> _completedPrayers = {};
  final Set<String> _favoriteDuas = {};

  bool _isReady = false;
  bool _hasCompletedOnboarding = false;
  bool _isDarkMode = false;
  int _selectedHajjDay = 8;

  bool get isReady => _isReady;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding;
  bool get isDarkMode => _isDarkMode;
  int get selectedHajjDay => _selectedHajjDay;
  Set<String> get completedRituals => Set.unmodifiable(_completedRituals);
  Set<String> get completedPacking => Set.unmodifiable(_completedPacking);
  Set<String> get completedPrayers => Set.unmodifiable(_completedPrayers);
  Set<String> get favoriteDuas => Set.unmodifiable(_favoriteDuas);

  Future<void> load() async {
    _preferences = await SharedPreferences.getInstance();
    _hasCompletedOnboarding =
        _preferences.getBool('onboarding_complete') ?? false;
    _isDarkMode = _preferences.getBool('dark_mode') ?? false;
    _selectedHajjDay = _preferences.getInt('hajj_day') ?? 8;
    _completedRituals.addAll(
      _preferences.getStringList('completed_rituals') ?? const [],
    );
    _completedPacking.addAll(
      _preferences.getStringList('completed_packing') ?? const [],
    );
    _completedPrayers.addAll(
      _preferences.getStringList('completed_prayers') ?? const [],
    );
    _favoriteDuas.addAll(
      _preferences.getStringList('favorite_duas') ?? const [],
    );
    _isReady = true;
    notifyListeners();
  }

  Future<void> _save() async {
    final results = await Future.wait([
      _preferences.setBool('onboarding_complete', _hasCompletedOnboarding),
      _preferences.setBool('dark_mode', _isDarkMode),
      _preferences.setInt('hajj_day', _selectedHajjDay),
      _preferences.setStringList(
        'completed_rituals',
        _completedRituals.toList(),
      ),
      _preferences.setStringList(
        'completed_packing',
        _completedPacking.toList(),
      ),
      _preferences.setStringList(
        'completed_prayers',
        _completedPrayers.toList(),
      ),
      _preferences.setStringList('favorite_duas', _favoriteDuas.toList()),
    ]);
    if (results.any((saved) => !saved)) {
      throw StateError('Could not save your Hajj Routine preferences.');
    }
  }

  void completeOnboarding() {
    _hasCompletedOnboarding = true;
    notifyListeners();
    unawaited(_save());
  }

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
    unawaited(_save());
  }

  void selectHajjDay(int day) {
    if (day < 8 || day > 13) return;
    _selectedHajjDay = day;
    notifyListeners();
    unawaited(_save());
  }

  void toggleRitual(String id) {
    _toggle(_completedRituals, id);
  }

  void togglePacking(String id) {
    _toggle(_completedPacking, id);
  }

  void togglePrayer(String name) {
    _toggle(_completedPrayers, name);
  }

  void toggleFavorite(String id) {
    _toggle(_favoriteDuas, id);
  }

  void _toggle(Set<String> values, String value) {
    if (!values.add(value)) values.remove(value);
    notifyListeners();
    unawaited(_save());
  }
}
