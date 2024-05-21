import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';
import 'package:untask/src/features/memos/ui/memo_list_card.dart';
import 'package:untask/src/routing/app_router.dart';

class MemosList extends ConsumerWidget {
  const MemosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memosList = ref.watch(memosListStreamProvider);
    // IDEA: Create a provider that filters the memos to show only the ones that are not released
    return memosList.when(
      data: (memos) {
        final memosToShow = memos.where((memo) => !memo.isReleased).toList();
        // LATER: We also need to sort the memos here
        return memosToShow.isEmpty
            ? const Center(child: Text("All memos are released!"))
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(height: 2),
                restorationId: 'memosListView',
                itemCount: memosToShow.length,
                itemBuilder: (_, index) {
                  final memo = memosToShow[index];
                  return MemoListCard(
                      memo: memo,
                      onPressed: () => context.pushNamed(AppRoute.memo.name,
                          pathParameters: {'id': memo.id}));
                },
              );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
