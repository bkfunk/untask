import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// import '../../motivations/models/motivation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

typedef MemoID = String;

@freezed
class Memo with _$Memo {
  const factory Memo({
    required MemoID id,
    required String title,
    // @Default(false) bool isReleased,
    // @Default(false) bool isTriaged,
    // int? estimatedMaxTime,
    // int? estimatedMinTime,
    // Motivation? motivation,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
