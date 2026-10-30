import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';

import '../data/hajj_data.dart';
import '../l10n/app_localizations.dart';
import '../models/hajj_models.dart';
import '../shared/providers/app_providers.dart';
import '../widgets/app_widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..forward();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1300), () {
      if (!mounted) return;
      final complete = ref.read(appStateProvider).hasCompletedOnboarding;
      context.go(complete ? '/home' : '/onboarding');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [emerald, emeraldDeep],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const IslamicPattern(opacity: 0.1),
          Center(
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeIn,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: gold.withValues(alpha: 0.7)),
                    ),
                    child: const Icon(
                      Icons.nights_stay_rounded,
                      color: gold,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Hajj Companion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A mindful guide for your sacred journey',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.76),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 720;
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 920),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: wide
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: SizedBox(
                                    height: 320,
                                    child: _OnboardingArt(),
                                  ),
                                ),
                                const SizedBox(width: 48),
                                const Expanded(child: _OnboardingCopy()),
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: constraints.maxHeight * 0.34,
                                  child: const _OnboardingArt(),
                                ),
                                const SizedBox(height: 24),
                                const _OnboardingCopy(),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingArt extends StatelessWidget {
  const _OnboardingArt();

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    constraints: const BoxConstraints(minHeight: 230),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      gradient: const LinearGradient(
        colors: [emerald, emeraldDeep],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: [
        const IslamicPattern(opacity: 0.13),
        Center(
          child: Container(
            width: 156,
            height: 156,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: gold.withValues(alpha: 0.7),
                width: 1.5,
              ),
              color: Colors.white.withValues(alpha: 0.06),
            ),
            child: const Icon(Icons.mosque_rounded, color: gold, size: 76),
          ),
        ),
        const Positioned(
          left: 24,
          bottom: 20,
          child: Text(
            'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white, fontSize: 25, height: 1.7),
          ),
        ),
      ],
    ),
  );
}

class _OnboardingCopy extends ConsumerWidget {
  const _OnboardingCopy();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your Hajj,\\nguided with care.',
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w800, height: 1.13),
        ),
        const SizedBox(height: 16),
        Text(
          'A calm companion for each day of the journey, with rituals, duas, prayer reminders, and practical checklists.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.55),
        ),
        const SizedBox(height: 22),
        const _FeatureLine(
          icon: Icons.route_outlined,
          text: 'Step-by-step Hajj day guide',
        ),
        const _FeatureLine(
          icon: Icons.favorite_border,
          text: 'Duas to save and listen to',
        ),
        const _FeatureLine(
          icon: Icons.offline_pin_outlined,
          text: 'Your progress saved on this device',
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () {
              ref.read(appStateProvider).completeOnboarding();
              context.go('/home');
            },
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Begin your journey'),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'A learning aid, not a substitute for your Hajj scholar.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _FeatureLine extends StatelessWidget {
  const _FeatureLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    final complete = state.completedRituals.length;
    final percent = complete / ritualChecklist.length;
    final today = hajjDays.firstWhere(
      (day) => day.day == state.selectedHajjDay,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj Companion'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.tune_rounded),
          ),
        ],
      ),
      body: PageBody(
        children: [
          _WelcomeCard(day: state.selectedHajjDay, location: today.location),
          const SizedBox(height: 18),
          const _LiveDateTimeCard(),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Assalamu alaikum',
                  style: Theme.of(context).textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'One step at a time. May your journey be accepted.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          AppCard(
            onTap: () => context.go('/checklist'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Your Hajj progress',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '${(percent * 100).round()}%',
                      style: const TextStyle(
                        color: emerald,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: percent.clamp(0, 1),
                    minHeight: 8,
                    backgroundColor: Theme.of(context).colorScheme.primary
                        .withValues(alpha: 0.1),
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  '$complete of ${ritualChecklist.length} checklist items complete',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SectionHeading(
            'Today’s focus',
            action: 'View routine',
            onAction: () => context.go('/routine'),
          ),
          AppCard(
            onTap: () => context.push('/ritual/${state.selectedHajjDay}'),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: emerald.withValues(alpha: 0.09),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Icon(Icons.place_outlined, color: emerald),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${today.day} Dhul Hijjah · ${today.location}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        today.title,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionHeading('Your essentials'),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 520 ? 4 : 2;
              final items = <({String label, IconData icon, String route})>[
                (
                  label: 'Prayer times',
                  icon: Icons.mosque_outlined,
                  route: '/prayers',
                ),
                (
                  label: 'Duas & zikr',
                  icon: Icons.menu_book_outlined,
                  route: '/duas',
                ),
                (
                  label: 'Hajj checklist',
                  icon: Icons.checklist_rounded,
                  route: '/checklist',
                ),
                (
                  label: 'Packing list',
                  icon: Icons.backpack_outlined,
                  route: '/packing',
                ),
              ];
              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: columns == 4 ? 1.3 : 1.55,
                children: items
                    .map(
                      (item) => AppCard(
                        onTap: () => context.go(item.route),
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(item.icon, color: emerald),
                            Text(
                              item.label,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 18),
          const NoteBanner(
            title: 'A note on guidance',
            message: 'Ritual classifications and details vary by madhhab and Hajj type. Sample prayer times are illustrative; confirm local timings and rulings with your group and trusted scholar.',
          ),
        ],
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({required this.day, required this.location});

  final int day;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [emerald, emeraldDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const IslamicPattern(opacity: 0.1),
          Positioned(
            right: -9,
            bottom: -27,
            child: Icon(
              Icons.mosque_rounded,
              size: 176,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Text(
                    'SELECTED HAJJ DAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day $day · Dhul Hijjah',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 17,
                          color: gold,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.83),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveDateTimeCard extends StatefulWidget {
  const _LiveDateTimeCard();

  @override
  State<_LiveDateTimeCard> createState() => _LiveDateTimeCardState();
}

class _LiveDateTimeCardState extends State<_LiveDateTimeCard>
    with WidgetsBindingObserver {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    WidgetsBinding.instance.addObserver(this);
    _scheduleMinuteUpdate();
  }

  void _scheduleMinuteUpdate() {
    _timer?.cancel();
    final secondsToNextMinute = 60 - DateTime.now().second;
    _timer = Timer(Duration(seconds: secondsToNextMinute), () {
      if (!mounted) return;
      setState(() => _now = DateTime.now());
      _timer = Timer.periodic(const Duration(minutes: 1), (_) {
        if (mounted) setState(() => _now = DateTime.now());
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed || !mounted) return;
    setState(() => _now = DateTime.now());
    _scheduleMinuteUpdate();
  }

  String _greeting(AppLocalizations strings) => switch (_now.hour) {
    < 12 => strings.goodMorning,
    < 17 => strings.goodAfternoon,
    _ => strings.goodEvening,
  };

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final localizations = MaterialLocalizations.of(context);
    final localTime = localizations.formatTimeOfDay(
      TimeOfDay.fromDateTime(_now),
      alwaysUse24HourFormat: MediaQuery.of(context).alwaysUse24HourFormat,
    );

    return Semantics(
      key: const ValueKey('live-date-time'),
      label:
          '${localizations.formatFullDate(_now)}, ${strings.localTime}: $localTime',
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: emerald.withValues(alpha: 0.09),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.calendar_month_rounded, color: emerald),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting(strings),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    localizations.formatFullDate(_now),
                    style: Theme.of(context).textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${strings.localTime} · ${_now.timeZoneName}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              localTime,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutineScreen extends ConsumerWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(appStateProvider).selectedHajjDay;
    return Scaffold(
      appBar: AppBar(title: const Text('Hajj routine')),
      body: PageBody(
        children: [
          Text(
            'Your days of Hajj',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            'Choose a day to explore its rites and practical guidance.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hajjDays
                  .map(
                    (day) => Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: ChoiceChip(
                        label: Text('${day.day} Dhul Hijjah'),
                        selected: day.day == selectedDay,
                        onSelected: (_) =>
                            ref.read(appStateProvider).selectHajjDay(day.day),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 18),
          ...hajjDays.map(
            (day) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                onTap: () {
                  ref.read(appStateProvider).selectHajjDay(day.day);
                  context.push('/ritual/${day.day}');
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 52,
                      height: 58,
                      decoration: BoxDecoration(
                        color: emerald.withValues(alpha: 0.09),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: emerald,
                            ),
                          ),
                          const Text(
                            'DHUL',
                            style: TextStyle(
                              fontSize: 8,
                              color: emerald,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day.title,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            day.location,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: emerald),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            day.summary,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(height: 1.4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'School-specific guidance',
            message: 'Pillars and wajib rites are binding categories in common guidance, but legal terminology differs: Hanafi fiqh distinguishes fard from wajib, while other schools use related terms differently. Labels here are general; sequence and concessions also vary by school and Hajj type.',
          ),
        ],
      ),
    );
  }
}

class RitualDetailScreen extends ConsumerWidget {
  const RitualDetailScreen({required this.day, super.key});

  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ritual = hajjDays.firstWhere((item) => item.day == day);
    return Scaffold(
      appBar: AppBar(
        title: Text('${ritual.day} Dhul Hijjah'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
          tooltip: 'Back',
        ),
      ),
      body: PageBody(
        children: [
          Text(
            ritual.title,
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(Icons.place_outlined, color: emerald, size: 19),
              const SizedBox(width: 4),
              Text(ritual.location, style: const TextStyle(color: emerald)),
            ],
          ),
          const SizedBox(height: 14),
          Text(ritual.summary, style: const TextStyle(height: 1.55)),
          const SizedBox(height: 22),
          const SectionHeading('Rites for this day'),
          ...ritual.steps.map(
            (step) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            step.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        RitualTypeChip(step.type),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Text(step.description, style: const TextStyle(height: 1.5)),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'Please verify your plan',
            message: 'The sequence, timing, and legal classification of some rites vary between schools and Hajj types. Confirm your personal guidance with a qualified scholar and follow official crowd-management instructions.',
          ),
        ],
      ),
    );
  }
}

class PrayerScreen extends ConsumerWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completed = ref.watch(appStateProvider).completedPrayers;
    final doneCount = prayerTimes
        .where((prayer) => completed.contains(prayer.name))
        .length;
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer times')),
      body: PageBody(
        children: [
          Text(
            'A moment to reconnect',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text('Sample schedule · $doneCount of 5 marked complete'),
          const SizedBox(height: 18),
          ...prayerTimes.map(
            (prayer) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: emerald.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.access_time_rounded,
                        color: emerald,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prayer.name,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            prayer.note,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      prayer.time,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 5),
                    Checkbox(
                      value: completed.contains(prayer.name),
                      onChanged: (_) =>
                          ref.read(appStateProvider).togglePrayer(prayer.name),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          const NoteBanner(
            title: 'Times are examples only',
            message: 'Prayer times shown here are sample values and are not calculated for your location or date. Check a trusted local timetable or your Hajj group schedule before praying.',
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 12),
          const NoteBanner(
            title: 'Prayer while travelling',
            message: 'Rules for shortening or combining prayers during Hajj differ by school and circumstance. Follow the guidance of your scholar or group imam.',
          ),
        ],
      ),
    );
  }
}

class DuaScreen extends ConsumerStatefulWidget {
  const DuaScreen({super.key});

  @override
  ConsumerState<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends ConsumerState<DuaScreen> {
  final FlutterTts _tts = FlutterTts();
  String? _speakingDua;
  bool _showFavoritesOnly = false;
  String _selectedCategory = 'All';

  static const _categories = [
    'All',
    'Morning',
    'Evening',
    'Anytime',
    'Hajj duas',
  ];

  @override
  void initState() {
    super.initState();
    _tts.setCompletionHandler(_clearSpeakingDua);
    _tts.setCancelHandler(_clearSpeakingDua);
    _tts.setErrorHandler((message) {
      _clearSpeakingDua();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Audio playback failed: $message')),
      );
    });
  }

  void _clearSpeakingDua() {
    if (mounted) setState(() => _speakingDua = null);
  }

  Future<void> _toggleAudio(Dua dua) async {
    if (_speakingDua == dua.id) {
      await _tts.stop();
      if (mounted) setState(() => _speakingDua = null);
      return;
    }
    await _tts.stop();
    await _tts.setLanguage('ar-SA');
    await _tts.setSpeechRate(0.42);
    if (mounted) setState(() => _speakingDua = dua.id);
    await _tts.speak(dua.arabic);
  }

  @override
  void dispose() {
    unawaited(_tts.stop());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStateProvider);
    final visibleDuas = [...duas, ...masnoonAzkar]
        .where(
          (dua) =>
              (!_showFavoritesOnly || state.favoriteDuas.contains(dua.id)) &&
              switch (_selectedCategory) {
                'Morning' =>
                  dua.category == 'Morning' ||
                      dua.category == 'Morning & evening',
                'Evening' =>
                  dua.category == 'Evening' ||
                      dua.category == 'Morning & evening',
                'Anytime' => dua.category == 'Anytime',
                'Hajj duas' => dua.category == 'Hajj duas',
                _ => true,
              },
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duas & zikr'),
        actions: [
          IconButton(
            tooltip: _showFavoritesOnly ? 'Show all duas' : 'Show favorites',
            onPressed: () =>
                setState(() => _showFavoritesOnly = !_showFavoritesOnly),
            icon: Icon(
              _showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: PageBody(
        children: [
          Text(
            'Duas & Masnoon Azkar',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 7),
          Text(
            'Daily remembrances and Hajj duas, with references and repeat counts.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (_) =>
                            setState(() => _selectedCategory = category),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          if (visibleDuas.isEmpty)
            const AppCard(
              child: Text(
                'No saved duas yet. Tap the heart on a dua to add it here.',
              ),
            ),
          ...visibleDuas.map(
            (dua) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            dua.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: state.favoriteDuas.contains(dua.id)
                              ? 'Remove favorite'
                              : 'Add favorite',
                          onPressed: () =>
                              ref.read(appStateProvider).toggleFavorite(dua.id),
                          icon: Icon(
                            state.favoriteDuas.contains(dua.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: state.favoriteDuas.contains(dua.id)
                                ? const Color(0xFFB65D4D)
                                : null,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Chip(
                          label: Text(dua.category),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        if (dua.repetitions != null)
                          Chip(
                            avatar: const Icon(Icons.repeat_rounded, size: 15),
                            label: Text(
                              '${dua.repetitions} ${dua.repetitions == 1 ? 'time' : 'times'}',
                            ),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        dua.arabic,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 23,
                          height: 1.9,
                          fontFamilyFallback: ['Noto Naskh Arabic', 'serif'],
                        ),
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      dua.transliteration,
                      style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(fontStyle: FontStyle.italic, height: 1.5),
                    ),
                    const SizedBox(height: 8),
                    Text(dua.translation, style: const TextStyle(height: 1.5)),
                    const SizedBox(height: 8),
                    Text(
                      dua.reference,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton.icon(
                        onPressed: () => _toggleAudio(dua),
                        icon: Icon(
                          _speakingDua == dua.id
                              ? Icons.stop_circle_outlined
                              : Icons.volume_up_outlined,
                        ),
                        label: Text(
                          _speakingDua == dua.id
                              ? 'Stop audio'
                              : 'Listen in Arabic',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'Recite with understanding',
            message: 'Translations and transliterations are approximate aids. Counts and references are shown for sourced adhkar; the app does not track repetitions. Recitation audio uses your device’s Arabic speech engine, so pronunciation quality varies.',
          ),
        ],
      ),
    );
  }
}

class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    final ratio = state.completedRituals.length / ritualChecklist.length;
    final groups = <String, List<ChecklistItem>>{};
    for (final item in ritualChecklist) {
      groups.putIfAbsent(item.category, () => []).add(item);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hajj checklist'),
        actions: [
          IconButton(
            tooltip: 'Packing checklist',
            onPressed: () => context.go('/packing'),
            icon: const Icon(Icons.backpack_outlined),
          ),
        ],
      ),
      body: PageBody(
        children: [
          Text(
            'Keep your steps in view',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Row(
              children: [
                SizedBox(
                  width: 62,
                  height: 62,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: ratio.clamp(0, 1),
                        strokeWidth: 6,
                        backgroundColor: emerald.withValues(alpha: 0.1),
                      ),
                      Center(
                        child: Text(
                          '${(ratio * 100).round()}%',
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your progress',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${state.completedRituals.length} of ${ritualChecklist.length} items marked complete',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ...groups.entries.map(
            (group) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                padding: const EdgeInsets.fromLTRB(16, 15, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: emerald,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...group.value.map(
                      (item) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.completedRituals.contains(item.id),
                        onChanged: (_) =>
                            ref.read(appStateProvider).toggleRitual(item.id),
                        title: Text(
                          item.title,
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: RitualTypeChip(item.type),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'Personalize this checklist',
            message: 'Check items off for your own tracking. A completed checkmark is not a religious ruling or confirmation that a rite was valid.',
          ),
        ],
      ),
    );
  }
}

class PackingScreen extends ConsumerWidget {
  const PackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    final groups = <String, List<ChecklistItem>>{};
    for (final item in packingItems) {
      groups.putIfAbsent(item.category, () => []).add(item);
    }
    final ratio = state.completedPacking.length / packingItems.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Packing checklist')),
      body: PageBody(
        children: [
          Text(
            'Pack with peace of mind',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            '${state.completedPacking.length} of ${packingItems.length} essentials packed · ${(ratio * 100).round()}%',
          ),
          const SizedBox(height: 15),
          ...groups.entries.map(
            (group) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.key,
                      style: const TextStyle(
                        color: emerald,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    ...group.value.map(
                      (item) => CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: state.completedPacking.contains(item.id),
                        onChanged: (_) =>
                            ref.read(appStateProvider).togglePacking(item.id),
                        title: Text(item.title),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'Check current requirements',
            message: 'Packing rules can change. Confirm airline, accommodation, and Saudi Hajj authority requirements before travel.',
          ),
        ],
      ),
    );
  }
}

class GuideScreen extends ConsumerWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hajj guide')),
      body: PageBody(
        children: [
          Text(
            'Learn the essentials',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 7),
          Text(
            'A quick overview to read alongside trusted scholarly guidance.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ...guideItems.map(
            (guide) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                padding: EdgeInsets.zero,
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.symmetric(horizontal: 18),
                  childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  title: Text(
                    guide.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(guide.subtitle),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        guide.detail,
                        style: const TextStyle(height: 1.55),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const NoteBanner(
            title: 'Need a personal ruling?',
            message: 'Ask a qualified scholar familiar with your madhhab and Hajj type. Use official Hajj authority announcements for route and timing changes.',
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStateProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: PageBody(
        children: [
          Text(
            'Make it yours',
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          AppCard(
            padding: EdgeInsets.zero,
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined, color: emerald),
              title: const Text(
                'Dark appearance',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: const Text('Easier viewing at night'),
              value: state.isDarkMode,
              onChanged: ref.read(appStateProvider).setDarkMode,
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            onTap: () => context.go('/guide'),
            child: const _SettingsLink(
              icon: Icons.menu_book_outlined,
              title: 'Hajj guide',
              subtitle: 'Ihram, Tawaf, Arafat, and more',
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            onTap: () => context.go('/packing'),
            child: const _SettingsLink(
              icon: Icons.backpack_outlined,
              title: 'Packing checklist',
              subtitle: 'Your travel essentials',
            ),
          ),
          const SizedBox(height: 22),
          const NoteBanner(
            title: 'About this companion',
            message: 'This app provides general educational content. It does not replace a qualified scholar, official Hajj instructions, or medical advice. Prayer times are illustrative sample values.',
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Made with care for your journey',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsLink extends StatelessWidget {
  const _SettingsLink({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: emerald),
      const SizedBox(width: 14),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 3),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
      const Icon(Icons.chevron_right_rounded),
    ],
  );
}
