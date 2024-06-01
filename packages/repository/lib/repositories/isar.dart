import 'package:isar/isar.dart';

import '../data_items/data_item.dart';
import '../repositories/repository.dart';

abstract class IsarRepository<T extends DataItem<I>, C, I extends IDType>
    extends Repository<T, I> {
  late final Isar db;

  IsarRepository({
    required this.db,
    // Insert constructor parameters here
  }) {
    // Do something with the parameters here
  }

  // Do something with the parameters here
  // @override
  // Future<void> delete(I id) {
  //   // TODO: implement delete
  //   throw UnimplementedError();
  // }

  // @override
  // Future<T?> get(I id) async {
  //   return db.collection<C>().where().id.equals(id).firstOrNull();
  // }

  // @override
  // Future<List<T>> getAll() {
  //   // TODO: implement getAll
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> insert(T item) {
  //   // TODO: implement insert
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> update(T item) {
  //   // TODO: implement update
  //   throw UnimplementedError();
  // }

  // @override
  // Stream<T?> watch(I id) {
  //   // TODO: implement watch
  //   throw UnimplementedError();
  // }

  // @override
  // Stream<List<T>> watchList() {
  //   // TODO: implement watchList
  //   throw UnimplementedError();
  // }
}
