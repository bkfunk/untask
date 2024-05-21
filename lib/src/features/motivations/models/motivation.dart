// ignore_for_file: public_member_api_docs, sort_constructors_first
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

//   final MotivationID id;
//   final String description;

//   @override
//   String toString() => 'Motivation(id: $id, description: $description)';

//   @override
//   bool operator ==(covariant Motivation other) {
//     if (identical(this, other)) return true;

//     return other.id == id && other.description == description;
//   }

//   @override
//   int get hashCode => id.hashCode ^ description.hashCode;
// }
