import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:untask/src/common/ui/error_message_modal.dart";
import "package:untask/src/features/memos/models/memo.dart";
import "package:untask/src/routing/app_router.dart";

import "../../../app.dart";
import "memo_list_card.dart";

class MemosListView extends StatelessWidget {
  const MemosListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Future<List<Memo>> memos =
    //     AppController.of(context).memosRepository.getAll();

    // return Scaffold(
    //   body: FutureBuilder(
    //     future: memos,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         List<Memo> memoList = snapshot.data!;
    //         return ListView.builder(
    //           itemCount: memoList.length,
    //           itemBuilder: (context, index) {
    //             debugPrint("Building memo card for index $index");
    //             return MemoListCard(
    //               memo: memoList[index],
    //               onPressed: () => context.pushNamed(
    //                 AppRoute.memo.name,
    //                 pathParameters: {'id': memoList[index].id},
    //               ),
    //             );
    //           },
    //         );
    //       } else if (snapshot.hasError) {
    //         return ErrorMessageModal(
    //           snapshot.error!,
    //           snapshot.stackTrace!,
    //           errorMessage: snapshot.error.toString(),
    //         );
    //       } else {
    //         return const CircularProgressIndicator();
    //       }
    //     },
    //   ),
    return Scaffold(
      body: StreamBuilder<List<Memo>>(
        stream: AppController.of(context).memosRepository.watchList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Memo> memoList = snapshot.data!;
            return ListView.builder(
              itemCount: memoList.length,
              itemBuilder: (context, index) {
                debugPrint("Building memo card for index $index");
                return MemoListCard(
                  memo: memoList[index],
                  onPressed: () => context.pushNamed(
                    AppRoute.memo.name,
                    pathParameters: {"id": memoList[index].id},
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return ErrorMessageModal(
              snapshot.error!,
              snapshot.stackTrace!,
              errorMessage: snapshot.error.toString(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushNamed(AppRoute.create.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
  //   Stream<List<Memo>> memos = AppController.of(context).memosRepository.watchList();
  //   return Scaffold(
  //     body: ListView.builder(
  //       itemCount: memoList.length,
  //       itemBuilder: (context, index) {
  //         debugPrint("Building memo card for index $index");
  //         return MemoListCard(
  //           memo: memoList[index],
  //           onPressed: () => context.pushNamed(
  //             AppRoute.memo.name,
  //             pathParameters: {'id': memoList[index].id},
  //           ),
  //         );
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       child: const Icon(Icons.add),
  //       onPressed: () => context.pushNamed(AppRoute.create.name),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //   );
  // }
