# Architecture foundation

The application is being migrated in phases to a feature-first, offline-first
structure. Each feature owns its `data`, `domain`, and `presentation` layers.
Shared infrastructure lives under `core/`; shared UI, models, and Riverpod
providers live under `shared/`.

## Current foundation

- Flutter + Material 3 theme tokens: `core/constants` and `core/theme`
- GoRouter configuration and named path constants: `core/routing`
- Riverpod `ProviderScope` and application state provider: `shared/providers`
- Drift database with schema version 1 and a settings table: `core/database`
- SharedPreferences for existing lightweight progress and appearance settings
- Flutter Secure Storage key store: `core/security`
- Existing Hajj screens remain in `screens/` during the initial migration;
  feature screens and repositories are introduced as each phase is completed.

## Data protection status

The secure key store creates and protects a random 256-bit key using the
platform secure-storage plugin. The current Drift database is not yet encrypted
with that key. SQLCipher integration, key rotation, encrypted backups, and
restore flows are security-critical work for later database/security phases;
do not store sensitive travel or medical records in the database until then.

## Feature layers

- `data`: local data sources, Drift access, and repository implementations
- `domain`: entities, repository contracts, and use cases
- `presentation`: feature screens, view models, and feature widgets
