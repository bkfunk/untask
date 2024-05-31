library repository;

import 'dart:async';

import '../data_items/data_item.dart';

abstract class Repository<T extends DataItem<I>, I extends IDType> {
  final type = T;
  Future<T?> get(I id);
  Future<void> insert(T item);
  Future<void> update(T item);
  Future<void> delete(I id);
  Stream<List<T>> watchList();
  Stream<T?> watch(I id);
  Future<List<T>> getAll();
}
