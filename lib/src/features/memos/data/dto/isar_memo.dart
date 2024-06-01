import "package:isar/isar.dart";

import "../../models/memo.dart";

part "isar_memo.g.dart";

@collection
class IsarMemo {
  final int id;

  // Will this just make it slow, to always have to convert between the two IDs?
  // Basically every time we want to get a memo from the repository, we have to use a where clause
  @Index(unique: true)
  MemoID memoID;
  DateTime createdAt;
  String title;

  IsarMemo({
    required this.id,
    required this.memoID,
    required this.createdAt,
    required this.title,
  });

  // IsarMemo(Memo memo)
  //     : memoID = memo.id,
  //       createdAt = memo.createdAt,
  //       title = memo.title;
}
