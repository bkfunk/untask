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
    // List<Memo> memos = ref.watch(memosStreamProvider).value ?? [];
    // AsyncValue<List<Memo>> memosAsync = ref.watch(memosStreamProvider);

    // // print("Building MemosListView with memosAsync: $memosAsync");
    // final repo = ref.watch(memosRepositoryProvider);
    // final stream = repo.watchMemosList();
    // stream.listen((event) {
    //   print("MemosListView: $event");
    // });
    // print(
    //   "Building MemosListView with stream: $stream ~ ${stream.isEmpty} ~ ${stream.length}",
    // );
    AsyncValue<List<Memo>> memosAsync = ref.watch(memosListProvider);

    return Scaffold(
      // body: memos.isEmpty
      //     ? const Center(
      //         child: Text("No memos yet!"),
      //       )
      //     : ListView.builder(
      //         itemCount: memos.length,
      //         itemBuilder: (context, index) {
      //           print("Building memo card for index $index");
      //           return MemoListCard(
      //             memo: memos[index],
      //             onPressed: () => context.pushNamed(
      //               AppRoute.memo.name,
      //               pathParameters: {'id': memos[index].id},
      //             ),
      //           );
      //         },
      //       ),
      body: memosAsync.when(
        data: (memos) {
          if (memos.isEmpty) {
            return const Center(
              child: Text("No memos yet!"),
            );
          }
          debugPrint("Building list for memos: $memos");
          return ListView.builder(
            itemCount: memos.length,
            itemBuilder: (context, index) {
              print("Building memo card for index $index");
              return MemoListCard(
                memo: memos[index],
                onPressed: () => context.pushNamed(
                  AppRoute.memo.name,
                  pathParameters: {'id': memos[index].id},
                ),
              );
            },
          );
        },
        loading: () {
          print("Building loading indicator for memosAsync: $memosAsync");
          return const CircularProgressIndicator();
        },
        error: (Object e, StackTrace st) {
          print("Error: $e, $st");
          return ErrorMessageModal(e, st);
        },
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
