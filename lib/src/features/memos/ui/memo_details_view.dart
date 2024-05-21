import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';

class MemoDetailsView extends StatelessWidget {
  // NOW: Implement the MemoDetailsView so it actually shows the memo details
  const MemoDetailsView({super.key, required this.memoID});

  final String memoID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer(
          builder: (context, ref, child) {
            final memo = ref.watch(memoProvider(memoID));
            return memo.when(
                data: (memo) => memo == null
                    ? const Center(child: Text('Memo not found'))
                    : Center(
                        child: Column(children: [
                        Text(memo.title),
                        Checkbox(
                            value: memo.isReleased,
                            onChanged: (value) {
                              // ref.read(memosRepositoryProvider).updateMemo(
                              //     memo.copyWith(isReleased: value));
                              // NOW: Implement this onchanged to update the memo
                              print("Update memo to $value");
                            }),
                        Text(memo.isReleased.toString())
                      ])),
                error: (Object error, StackTrace stackTrace) {
                  return Center(
                    child: Text('Error: $error'),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                });
          },
        ));
  }
}
