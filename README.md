# Hajj Companion

An offline-first Flutter app foundation for Hajj preparation and worship. Work
is being delivered in phases; this increment completes the architecture and
shared infrastructure foundation while preserving the existing usable app.

## Run and verify

```shell
flutter pub get
flutter run
flutter analyze
flutter test
```

Generate Drift database code after changing a table:

```shell
dart run build_runner build
```

Generate localization code after editing ARB files:

```shell
flutter gen-l10n
```

## Foundation structure

- `lib/core/` — colors/theme, GoRouter, Drift database, security, services,
  storage, and shared utilities
- `lib/features/` — feature-first data/domain/presentation areas for onboarding,
  dashboard, preparation, Hajj guide/routine, worship, maps, health, emergency,
  travel, expenses, learning, and settings
- `lib/shared/` — common providers, models, and widgets
- `lib/l10n/` — English, Arabic, and Urdu localization resources
- `lib/screens/`, `lib/data/`, and `lib/models/` — existing app surfaces kept in
  place during the phased feature migration

See [the architecture notes](lib/ARCHITECTURE.md) for what is implemented and
which security work is intentionally deferred.

## Current foundation

- Riverpod is the application state-management integration; GoRouter remains
  the navigation layer.
- SharedPreferences continues to store the current lightweight checklist,
  favorites, onboarding, day selection, and theme settings.
- Drift schema v1 currently provides a normalized key/value settings table and
  a memory-backed database test.
- Flutter Secure Storage backs a 256-bit key store for later encryption work.
- Material 3 themes use the requested emerald/gold palette. English, Arabic,
  and Urdu localization resources are configured; translated screen copy and
  user language selection are being delivered in later phases.

## Security boundary

The current Drift database is **not encrypted** with the secure key yet. SQLCipher
key integration, migrations for the complete domain schema, encrypted backups,
and secure restore must be completed and reviewed before storing sensitive
health or travel data. The key store alone does not encrypt database contents.

No Firebase, Supabase, cloud database, or mandatory sign-in is used.

## Religious and travel guidance

Prayer times in the app are illustrative, not location-aware. Hajj rulings,
ritual order, and concessions can vary by school and Hajj type. Verify current
prayer times, religious guidance, medical needs, and crowd-management
instructions with trusted local sources and qualified professionals.
