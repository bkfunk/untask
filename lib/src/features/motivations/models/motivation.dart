import 'package:freezed_annotation/freezed_annotation.dart';

part 'motivation.freezed.dart';
part 'motivation.g.dart';

typedef MotivationID = String;

@freezed
class Motivation with _$Motivation {
  factory Motivation({
    MotivationID? id,
    required String description,
  }) = _Motivation;

  factory Motivation.fromJson(Map<String, dynamic> json) =>
      _$MotivationFromJson(json);
}
