import "dart:async";

import "package:nanoid/nanoid.dart";
import "package:repository/repository.dart";

import "../../models/memo.dart";

mixin MemosRepository on Repository<Memo, MemoID> {
  Future<Memo?> createMemo(Memo memo) {
    final newMemo = memo.copyWith(
      id: nanoid(),
      createdAt: DateTime.timestamp(),
    );
    insert(newMemo);
    return Future.value(newMemo);
  }
}
