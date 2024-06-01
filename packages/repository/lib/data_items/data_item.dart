import 'package:isar/isar.dart';

typedef IDType = Comparable;

abstract interface class DataItem<I extends IDType> {
  final I? id;

  DataItem(this.id);

  static Schema getSchema() {
    throw UnimplementedError();
  }
}
