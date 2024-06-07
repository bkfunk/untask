import 'package:isar/isar.dart';

import '../data_items/data_item.dart';
import '../repositories/repository.dart';

typedef IsarID = int;

abstract class IsarRepository<MODEL extends DataItem<MODEL_ID>, DTO,
    MODEL_ID extends IDType> extends Repository<MODEL, MODEL_ID> {
  late final Isar db;

  IsarRepository({
    required this.db,
    // EVENTUALLY: Make the db optional, and use the default db otherwise
    // Insert constructor parameters here
  }) {
    // Do something with the parameters here
  }

  /// The Isar collection for the data items managed by this repository.
  IsarCollection<IsarID, DTO> get collection => db.collection<IsarID, DTO>();

  DTO modelToDTO(MODEL model);
  MODEL dtoToModel(DTO dto);
  // IsarQuery<DTO> itemsWithID(MODEL_ID id);
  QueryBuilder<DTO, DTO, QAfterFilterCondition> itemsWithID(MODEL_ID id);

  @override
  Future<MODEL?> get(MODEL_ID id) {
    // We can use findFirst because the MODEL_ID is marked as @unique in the DTO
    return itemsWithID(id).findFirstAsync().then((dto) {
      return dto == null ? null : dtoToModel(dto);
    });
  }

// TODO: DO THIS NEXT
// NOW: Downgrade to Isar 3

  @override
  Future<void> put(MODEL item) {
    // In general, the [put] method checks if the item exists in the database,
    // and if it does, it updates it. If it does not, it creates it.
    //
    // Isar, however, has it's own [put] method that does this automatically.
    // So, we can just call that method here.
    db.write((isar) => collection.put(modelToDTO(item)));
    return Future.value();
  }

  @override
  Future<void> insert(MODEL item) {
    return put(item);
  }

  @override
  Future<void> update(MODEL item) {
    return put(item);
  }

  @override
  Future<bool> delete(MODEL_ID id) {
    return Future.value(itemsWithID(id).deleteFirst());
  }

  @override
  Stream<MODEL?> watch(MODEL_ID id) {
    return itemsWithID(id).watch().map(
        (dtos) => dtos.firstOrNull != null ? dtoToModel(dtos.first!) : null);
    // .map((dto) => dto != null ? dtoToModel(dto) : null));
  }

  @override
  Stream<List<MODEL>> watchList() {
    return collection
        .where()
        .watch(fireImmediately: true)
        .map((dtos) => dtos.map(dtoToModel).toList());
    // return collection.findAll().watch();
  }

  @override
  void dispose() {
    db.close();
  }
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
