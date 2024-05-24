import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:untask/src/common/ui/error_message_modal.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';
import 'package:untask/src/features/memos/models/memo.dart';
import 'package:untask/src/features/memos/ui/memo_list.dart';
import 'package:untask/src/features/memos/ui/memos_list_navbar.dart';
import 'package:untask/src/routing/app_router.dart';

import 'memo_list_card.dart';

class MemosListView extends ConsumerWidget {
  const MemosListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // me
    // List<Memo> memosList = ref.watch(memosProvider).when(
    //       data: (data) => ,
    //       error: (Object e, StackTrace st) => ErrorMessageModal(e, st),
    //       loading: () => const CircularProgressIndicator(),
    //     );
    // NOW: Look at the way Andrea returns streams/futures from repositories
    AsyncValue memos = ref.watch(fetchMemosListProvider);

    return Scaffold(
      body: memos.when(
        data: (data) => ListView.builder(
          itemBuilder: (context, index) {
            return MemoListCard(
              memo: data[index],
              onPressed: () => context.pushNamed(
                AppRoute.memo.name,
                pathParameters: {'id': data[index].id},
              ),
            );
          },
          itemCount: data.length,
        ),
        loading: () => const CircularProgressIndicator(),
        error: (Object e, StackTrace st) => ErrorMessageModal(e, st),
      ),
      bottomNavigationBar: const MemosListNavbar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushNamed(AppRoute.create.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
