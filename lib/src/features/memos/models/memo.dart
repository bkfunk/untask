import "package:freezed_annotation/freezed_annotation.dart";
import "package:flutter/foundation.dart";
import "package:isar/isar.dart";
import "package:nanoid/nanoid.dart";
import "package:repository/data_items/data_item.dart";

// import '../../motivations/models/motivation.dart';

part "memo.freezed.dart";
part "memo.g.dart";

typedef MemoID = String;

@freezed
class Memo with _$Memo implements DataItem<MemoID> {
  // Private constructor for @freezed, requiring all fields to be passed
  const factory Memo._({
    required MemoID id,
    required DateTime createdAt,
    required String title,
  }) = _Memo;

  // Public constructor for creating a new Memo, where the ID and createdAt are
  // automatically generated
  factory Memo({
    MemoID? id,
    DateTime? createdAt,
    required String title,
    // IDEA: @Default(false) bool isReleased,
    // IDEA: @Default(false) bool isTriaged,
    // IDEA: int? estimatedMaxTime,
    // IDEA: int? estimatedMinTime,
    // IDEA: Motivation? motivation,
  }) {
    return Memo._(
      id: id ?? nanoid(8),
      createdAt: createdAt ?? DateTime.timestamp(),
      title: title,
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}

@collection
class IsarMemo {
  Id id = Isar.autoIncrement;

  // Will this just make it slow, to always have to convert between the two IDs?
  // Basically every time we want to get a memo from the repository, we have to use a where clause
  @Index(type: IndexType.hash, unique: true)
  MemoID memoID;
  DateTime createdAt;
  String title;

  IsarMemo._({
    required this.memoID,
    required this.createdAt,
    required this.title,
  });

  IsarMemo(Memo memo)
      : memoID = memo.id,
        createdAt = memo.createdAt,
        title = memo.title;
}
