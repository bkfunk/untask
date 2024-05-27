import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nanoid/nanoid.dart';

import '../models/memo.dart';

abstract class MemosRepository {
  Future<Memo?> getMemo(MemoID id);
  // Memo? createMemo(Memo memo);
  /// Default implementation of [createMemo] that generates an ID and timestamp.
  Future<Memo?> createMemo(Memo memo) {
    final newMemo = memo.copyWith(
      id: nanoid(),
      createdAt: DateTime.timestamp(),
    );
    insertMemo(newMemo);
    return Future.value(newMemo);
  }

  /// Inserts a [Memo] into the data store.
  Future<void> insertMemo(Memo memo);

  /// Updates an existing [Memo] in the data store.
  ///
  /// Uses the [Memo.id] to find the existing memo to update.
  Future<void> updateMemo(Memo memo);

  /// Deletes a [Memo] with a given [id] from the data store.
  Future<void> deleteMemo(MemoID id);

  Stream<List<Memo>> watchMemosList();
  Stream<List<Memo>> watchMemos();
  Stream<Memo?> watchMemo(MemoID id);

  List<Memo> getMemos();
}

/// Mixin to add a [createMemo] method to an implementation of [MemosRepository].
///
/// This ensures that all concrete implementations of [MemosRepository]
/// attach a unique ID and timestamp to the memo in the same way.
// mixin MemoCreatorMixin on MemosRepository {
//   @override
//   Memo? createMemo(Memo memo) {
//     final newMemo = memo.copyWith(
//       id: nanoid(),
//       createdAt: DateTime.timestamp(),
//     );
//     insertMemo(newMemo);
//     return newMemo;
//   }
// }

// SOON: Implement the real MemosRepository
class FakeMemosRepository extends MemosRepository {
  final int _delay = 1;
  final _memosController = StreamController<List<Memo>>.broadcast(
    onListen: () {
      print("Fake memos stream listener added");
    },
    onCancel: () {
      print("Fake memos stream listener removed");
    },
  );
  final List<Memo> fakeMemos;

  FakeMemosRepository() : fakeMemos = [] {
    _memosController.stream.listen((memos) {
      print("Emitting: Fake memos updated: $memos");
    });
    for (var m in [
      Memo(title: "Call dentist"),
      Memo(title: "Build app"),
      Memo(title: "Buy more medicine"),
      Memo(title: "Drink water"),
      Memo(title: "Bring in dry cleaning"),
      Memo(title: "Pick up groceries"),
    ]) {
      createMemo(m);
      _memosController.add(fakeMemos);
    }
  }

  @override
  Future<Memo?> getMemo(MemoID id) async {
    return _getMemo(fakeMemos, id);
  }

  @override
  Future<void> insertMemo(Memo memo) async {
    print('insertMemo called with: $memo');
    // await Future.delayed(Duration(seconds: _delay));
    fakeMemos.add(memo);
    _memosController.add(fakeMemos);
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    // await Future.delayed(Duration(seconds: _delay));
    fakeMemos[fakeMemos.indexWhere((memo) => memo.id == memo.id)] = memo;
    _memosController.add(fakeMemos);
  }

  @override
  Future<void> deleteMemo(MemoID id) async {
    // await Future.delayed(Duration(seconds: _delay));
    fakeMemos.removeWhere((memo) => memo.id == id);
    _memosController.add(fakeMemos);
  }

  @override
  Stream<List<Memo>> watchMemosList() {
    debugPrint(
      'watchMemosList called: ${fakeMemos.map((e) => e.title).toList()}',
    );
    debugPrint('isPaused: ${_memosController.isPaused}');
    debugPrint('isClosed: ${_memosController.isClosed}');
    if (_memosController.isPaused) {
      return const Stream.empty();
    }
    return _memosController.stream;
  }

  @override
  Stream<List<Memo>> watchMemos() {
    return Stream.fromIterable([
      fakeMemos,
    ]);
  }

  @override
  Stream<Memo?> watchMemo(MemoID id) {
    return watchMemosList().map((memos) => _getMemo(memos, id));
  }

  static Memo? _getMemo(List<Memo> memos, MemoID id) {
    try {
      return memos.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  List<Memo> getMemos() {
    return fakeMemos;
  }
}
