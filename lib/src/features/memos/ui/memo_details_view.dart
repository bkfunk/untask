import "package:flutter/material.dart";

import "../models/memo.dart";

class MemoDetailsView extends StatelessWidget {
  const MemoDetailsView({super.key, required this.memoID});

  // MemoDetailsView(required this.memoID});

  final MemoID memoID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
    );
  }
}
