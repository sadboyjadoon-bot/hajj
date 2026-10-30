import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_widgets.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.location, required this.child, super.key});

  final String location;
  final Widget child;

  static const _destinations = <({String label, String path, IconData icon})>[
    (label: 'Home', path: '/home', icon: Icons.home_outlined),
    (label: 'Routine', path: '/routine', icon: Icons.route_outlined),
    (label: 'Prayers', path: '/prayers', icon: Icons.mosque_outlined),
    (label: 'Duas', path: '/duas', icon: Icons.menu_book_outlined),
    (label: 'Checklist', path: '/checklist', icon: Icons.checklist_rounded),
    (label: 'Settings', path: '/settings', icon: Icons.tune_rounded),
  ];

  int get _selectedIndex {
    if (location.startsWith('/routine') || location.startsWith('/ritual')) {
      return 1;
    }
    if (location.startsWith('/prayers')) return 2;
    if (location.startsWith('/duas')) return 3;
    if (location.startsWith('/checklist') || location.startsWith('/packing')) {
      return 4;
    }
    if (location.startsWith('/settings') || location.startsWith('/guide')) {
      return 5;
    }
    return 0;
  }

  void _navigate(BuildContext context, int index) {
    context.go(_destinations[index].path);
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 820;
    if (wide) {
      return Scaffold(
        body: Row(
          children: [
            Container(
              width: 218,
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 26),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.auto_awesome, color: gold),
                        SizedBox(width: 10),
                        Text(
                          'Hajj Companion',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  Expanded(
                    child: NavigationRail(
                      extended: true,
                      minExtendedWidth: 218,
                      backgroundColor: Colors.transparent,
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (index) =>
                          _navigate(context, index),
                      destinations: _destinations
                          .map(
                            (item) => NavigationRailDestination(
                              icon: Icon(item.icon),
                              label: Text(item.label),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'A gentle guide for your sacred journey',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      );
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => _navigate(context, index),
        destinations: _destinations
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
