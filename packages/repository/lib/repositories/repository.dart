library repository;

import 'dart:async';

import '../data_items/data_item.dart';

/// An abstract class representing a repository for managing data items of type [MODEL].
///
/// The repository provides methods for CRUD operations (create, read, update, delete)
/// on data items of type [MODEL]. It also provides methods for watching changes to the
/// data items in real-time using streams.
abstract class Repository<MODEL extends DataItem<MODEL_ID>,
    MODEL_ID extends IDType> {
  /// The type of data items managed by this repository.
  final type = MODEL;

  /// Retrieves a data item with the specified [id] from the repository.
  /// Returns `null` if no item with the specified [id] exists.
  Future<MODEL?> get(MODEL_ID id);

  /// Creates a new data item and then [insert]s it into the repository.
  /// Returns the created item.
  Future<MODEL?> create(MODEL item);

  /// Updates a data item in the repository, or inserts it if it does not exist.
  Future<void> put(MODEL item) async {
    if (item.id == null) {
      throw Exception('Item ID cannot be null');
    }
    get(item.id!).then((existingOrNull) {
      if (existingOrNull != null) {
        update(item);
      } else {
        // ? Should this be `await create(item);` instead?
        insert(item);
      }
    });
  }

  /// Inserts a data item into the repository.
  Future<void> insert(MODEL item);

  /// Updates an existing data item in the repository.
  Future<void> update(MODEL item);

  /// Deletes a data item with the specified [id] from the repository.
  Future<void> delete(MODEL_ID id);

  /// Returns a stream of lists of data items.
  /// The stream emits a new list whenever the data items in the repository change.
  Stream<List<MODEL>> watchList();

  /// Returns a stream of a data item with the specified [id].
  /// The stream emits a new item whenever the data item with the specified [id] changes.
  Stream<MODEL?> watch(MODEL_ID id);

  /// Disposes of the resources used by this repository.
  ///
  /// This method should be called when the repository is no longer needed.
  void dispose();
}
