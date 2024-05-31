import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:repository/data_items/data_item.dart';
import 'package:repository/repositories/repository.dart';

class FakeRepository<T extends DataItem<I>, I extends IDType>
    extends Repository<T, I> {
  final List<T> fakeItems;
  final StreamController<List<T>> _controller;

  final Duration delay;

  FakeRepository({
    this.delay = const Duration(milliseconds: 500),
    this.fakeItems = const [],
  }) : _controller = StreamController<List<T>>.broadcast() {
    _controller
      ..onListen = () async {
        debugPrint("Fake items stream listener added");
        // Give the listener a chance to be added before emitting
        await Future.delayed(const Duration(milliseconds: 100));
        _controller.add(fakeItems);
      }
      ..onCancel = () => debugPrint("Fake items stream listener removed");
    _controller.stream.listen((items) {
      debugPrint("Emitting: Fake items updated: $items");
    });
  }

  void dispose() {
    _controller.close();
  }

  Future<void> _delayed() async {
    return await Future.delayed(delay);
  }

  @override
  Future<T?> get(I id) async {
    await _delayed();
    return _get(fakeItems, id);
  }

  @override
  Future<List<T>> getAll() async {
    await _delayed();
    return Future.value(fakeItems);
  }

  @override
  Future<void> insert(T item) async {
    await _delayed();
    fakeItems.add(item);
    _controller.add(fakeItems);
  }

  @override
  Future<void> update(T item) async {
    await _delayed();
    fakeItems[fakeItems.indexWhere((i) => i.id == item.id)] = item;
    _controller.add(fakeItems);
  }

  @override
  Future<void> delete(I id) async {
    await _delayed();
    fakeItems.removeWhere((item) => item.id == id);
    _controller.add(fakeItems);
  }

  @override
  Stream<List<T>> watchList() {
    return _controller.stream;
  }

  @override
  Stream<T?> watch(I id) {
    return watchList().map((items) => _get(items, id));
  }

  // Synchronous helper method
  T? _get(List<T> items, I id) {
    try {
      return items.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FakeRepository &&
          runtimeType == other.runtimeType &&
          fakeItems == other.fakeItems &&
          delay == other.delay;

  @override
  int get hashCode => fakeItems.hashCode ^ delay.hashCode;

  // static List<T> _defaultFakeItems<T>() {
  //   return <T>[];
  // }
}
