import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:repository/data_items/data_item.dart';
import 'package:repository/repositories/repository.dart';

class FakeRepository<MODEL extends DataItem<MODEL_ID>, MODEL_ID extends IDType>
    extends Repository<MODEL, MODEL_ID> {
  final List<MODEL> fakeItems;
  final StreamController<List<MODEL>> _controller;

  final Duration delay;

  FakeRepository({
    this.delay = const Duration(milliseconds: 500),
    this.fakeItems = const [],
  }) : _controller = StreamController<List<MODEL>>.broadcast() {
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

  @override
  void dispose() {
    _controller.close();
  }

  Future<void> _delayed() async {
    return await Future.delayed(delay);
  }

  @override
  Future<MODEL?> get(MODEL_ID id) async {
    await _delayed();
    return _get(fakeItems, id);
  }

  @override
  Future<MODEL?> create(MODEL item) {
    insert(item);
    return Future.value(item);
  }

  @override
  Future<void> insert(MODEL item) async {
    await _delayed();
    fakeItems.add(item);
    _controller.add(fakeItems);
  }

  @override
  Future<void> update(MODEL item) async {
    await _delayed();
    fakeItems[fakeItems.indexWhere((i) => i.id == item.id)] = item;
    _controller.add(fakeItems);
  }

  @override
  Future<void> delete(MODEL_ID id) async {
    await _delayed();
    fakeItems.removeWhere((item) => item.id == id);
    _controller.add(fakeItems);
  }

  @override
  Stream<List<MODEL>> watchList() {
    return _controller.stream;
  }

  @override
  Stream<MODEL?> watch(MODEL_ID id) {
    return watchList().map((items) => _get(items, id));
  }

  // Synchronous helper method
  MODEL? _get(List<MODEL> items, MODEL_ID id) {
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
}
