typedef IDType = Comparable;

abstract interface class DataItem<I extends IDType> {
  final I? id;

  DataItem(this.id);
}
