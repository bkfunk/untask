import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untask/src/common/ui/error_message_modal.dart';
import 'package:untask/src/features/memos/models/memo.dart';
import 'package:untask/src/features/memos/ui/memos_list_navbar.dart';
import 'package:untask/src/routing/app_router.dart';

import 'memo_list_card.dart';

class MemosListView extends StatelessWidget {
  const MemosListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Memo> memos = [];
    return Scaffold(
      body: ListView.builder(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushNamed(AppRoute.create.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
