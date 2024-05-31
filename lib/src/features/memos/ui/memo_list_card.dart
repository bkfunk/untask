import "package:flutter/material.dart";
import "package:untask/src/features/memos/models/memo.dart";

class MemoListCard extends StatelessWidget {
  final Memo memo;
  final VoidCallback? onPressed;

  const MemoListCard({super.key, required this.memo, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // NOW: Add a checkbox to mark the memo as done
    return ListTile(
      title: Text(memo.title),
      subtitle: Text(memo.toString()),
      onTap: onPressed,
    );

    // InkWell(onTap: onPressed, child: Text(memo.title));
  }
}
