// ignore_for_file: public_member_api_docs, sort_constructors_first
typedef MotivationID = String;

class Motivation {
  Motivation(
    this.id,
    this.description,
  );

  final MotivationID id;
  final String description;

  @override
  String toString() => 'Motivation(id: $id, description: $description)';

  @override
  bool operator ==(covariant Motivation other) {
    if (identical(this, other)) return true;

    return other.id == id && other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
