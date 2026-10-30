# Feature-first structure

Every feature has `data/`, `domain/`, and `presentation/` layers. Feature
implementations move into these folders incrementally so each migration stays
buildable and testable; existing screens are not duplicated as placeholders.

Feature areas: onboarding, dashboard, preparation, Hajj guide, Hajj routine,
rituals, prayer, Quran, duas, tasbeeh, maps, health, emergency, family, travel,
expenses, learning, and settings.
