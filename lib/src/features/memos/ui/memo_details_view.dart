import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';

class MemoDetailsView extends StatelessWidget {
  const MemoDetailsView({super.key, required this.memoID});

  final String memoID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer(
          builder: (context, ref, child) {
            return const Center(
              child: Text("Test"),
            );
            // final memo = ref.watch(memoProvider(memoID));
            // return memo.when(
            //     data: (memo) => memo == null
            //         ? const Center(child: Text('Memo not found'))
            //         : Center(
            //             child: Column(children: [
            //             Text(memo.title),
            //           ])),
            //     error: (Object error, StackTrace stackTrace) {
            //       return Center(
            //         child: Text('Error: $error'),
            //       );
            //     },
            //     loading: () {
            //       return const Center(child: CircularProgressIndicator());
            //     });
          },
        ));
  }
}
