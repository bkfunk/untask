import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';

import '../models/memo.dart';

class MemoDetailsView extends ConsumerWidget {
  const MemoDetailsView({super.key, required this.memoID});

  // MemoDetailsView(required this.memoID});

  final MemoID memoID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MemoID memoID = "foo";
    // final memoAsync = ref.read(memosRepositoryProvider).watchMemo(memoID);
    // final memoAsync = ref.watch(memoFutureProvider(memoID));

    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          return const Center(
              // child: memoAsync.when(
              //   data: (memo) => memo == null
              //       ? const Text('Memo not found')
              //       : Column(
              //           children: [
              //             Text(memo.title),
              //           ],
              //         ),
              //   error: (Object error, StackTrace stackTrace) {
              //     return Text('Error: $error');
              //   },
              //   loading: () {
              //     return const CircularProgressIndicator();
              //   },
              // ), // when
              );
        },
      ),
    );
  }
}
