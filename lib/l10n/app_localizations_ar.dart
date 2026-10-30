// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'رفيق الحج';

  @override
  String get welcome => 'السلام عليكم';

  @override
  String get languageName => 'العربية';

  @override
  String get localTime => 'التوقيت المحلي للجهاز';

  @override
  String get goodMorning => 'صباح الخير';

  @override
  String get goodAfternoon => 'طاب نهاركم';

  @override
  String get goodEvening => 'مساء الخير';
}
