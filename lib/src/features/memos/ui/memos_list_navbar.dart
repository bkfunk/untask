import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemosListNavbar extends ConsumerWidget {
  const MemosListNavbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'Today'),
      ],
      // backgroundColor:
      //     Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    );
  }
}
