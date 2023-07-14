import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untask/src/features/memos/ui/memo_list.dart';
import 'package:untask/src/features/memos/ui/memos_list_navbar.dart';
import 'package:untask/src/routing/app_router.dart';

class MemosListView extends ConsumerWidget {
  const MemosListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Center(child: MemosList()),
      bottomNavigationBar: const MemosListNavbar(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.pushNamed(AppRoute.create.name)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
