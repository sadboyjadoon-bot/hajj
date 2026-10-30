import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hajj_routine/core/database/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase(executor: NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('settings are persisted and updated by key', () async {
    await database.writeSetting('locale', 'ur');
    expect(await database.readSetting('locale'), 'ur');

    await database.writeSetting('locale', 'ar');
    expect(await database.readSetting('locale'), 'ar');
    expect(await database.readSetting('missing'), isNull);
  });
}
