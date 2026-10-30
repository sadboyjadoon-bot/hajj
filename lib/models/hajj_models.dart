enum RitualType { pillar, wajib, sunnah, optional }

extension RitualTypeLabel on RitualType {
  String get label => switch (this) {
    RitualType.pillar => 'Pillar',
    RitualType.wajib => 'Wajib',
    RitualType.sunnah => 'Sunnah',
    RitualType.optional => 'Optional',
  };
}

class RitualStep {
  const RitualStep({
    required this.title,
    required this.type,
    required this.description,
  });

  final String title;
  final RitualType type;
  final String description;
}

class HajjDay {
  const HajjDay({
    required this.day,
    required this.title,
    required this.location,
    required this.summary,
    required this.steps,
  });

  final int day;
  final String title;
  final String location;
  final String summary;
  final List<RitualStep> steps;
}

class Dua {
  const Dua({
    required this.id,
    required this.title,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    required this.reference,
    this.category = 'Hajj duas',
    this.repetitions,
  });

  final String id;
  final String title;
  final String arabic;
  final String transliteration;
  final String translation;
  final String reference;
  final String category;
  final int? repetitions;
}

class ChecklistItem {
  const ChecklistItem({
    required this.id,
    required this.title,
    required this.category,
    required this.type,
  });

  final String id;
  final String title;
  final String category;
  final RitualType type;
}
