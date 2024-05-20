import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/models/memo.dart';

class MemoListCard extends ConsumerWidget {
  final Memo memo;
  final VoidCallback? onPressed;

  const MemoListCard({super.key, required this.memo, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NOW: Add a checkbox to mark the memo as done
    return ListTile(
        title: Text(memo.title),
        subtitle: Text(memo.toString()),
        onTap: onPressed);

    // InkWell(onTap: onPressed, child: Text(memo.title));
  }
}
