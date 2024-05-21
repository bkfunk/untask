// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../motivations/models/motivation.dart';

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
//   })
//   Memo({
//     required this.id,
//     required this.title,
//     this.isReleased = false,
//     this.isTriaged = false,
//     this.estimatedMaxTime,
//     this.estimatedMinTime,
//     this.motivation,
//   });
// }

//   final MemoID id;
//   final String title;
//   final bool isReleased;
//   final bool isTriaged;
//   final int? estimatedMaxTime;
//   final int? estimatedMinTime;
//   final Motivation? motivation;

//   // @override
//   // String toString() {
//   //   // TODO: implement toString
//   //   return 'Memo($id)';
//   // }

//   // @override
//   // bool operator ==(Object other) {
//   //   if (identical(this, other)) return true;

//   //   return other is Memo &&
//   //       other.id == id &&
//   //       other.title == title &&
//   //       other.isReleased == isReleased &&
//   //       other.isTriaged == isTriaged;
//   // }

//   // @override
//   // // TODO: implement hashCode
//   // int get hashCode {
//   //   return id.hashCode ^
//   //       title.hashCode ^
//   //       isReleased.hashCode ^
//   //       isTriaged.hashCode;
//   // }

//   @override
//   String toString() {
//     return 'Memo(id: $id, title: $title, isReleased: $isReleased, isTriaged: $isTriaged, estimatedMaxTime: $estimatedMaxTime, estimatedMinTime: $estimatedMinTime, motivation: $motivation)';
//   }

//   @override
//   bool operator ==(covariant Memo other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.title == title &&
//         other.isReleased == isReleased &&
//         other.isTriaged == isTriaged &&
//         other.estimatedMaxTime == estimatedMaxTime &&
//         other.estimatedMinTime == estimatedMinTime &&
//         other.motivation == motivation;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         title.hashCode ^
//         isReleased.hashCode ^
//         isTriaged.hashCode ^
//         estimatedMaxTime.hashCode ^
//         estimatedMinTime.hashCode ^
//         motivation.hashCode;
//   }
// }
