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
    final triesList = ref.watch(memosListStreamProvider);
    return triesList.when(
      data: (memos) => memos.isEmpty
          ? const Center(child: Text("No products found"))
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(height: 2),
              restorationId: 'memosListView',
              itemCount: memos.length,
              itemBuilder: (_, index) {
                final memo = memos[index];
                return MemoListCard(
                    memo: memo,
                    onPressed: () => context.pushNamed(AppRoute.memo.name,
                        pathParameters: {'id': memo.id}));
              },
            ),
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
