import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/memo.dart';

part 'memos_repository.g.dart';

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
  Stream<Memo> watchMemos();
  Stream<Memo?> watchMemo(MemoID id);
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
  final List<Memo> fakeMemos;

  FakeMemosRepository()
      : fakeMemos = [
          Memo(id: "0", title: "Call dentist"),
          Memo(id: "1", title: "Build app"),
          Memo(id: "2", title: "Buy more medicine"),
          Memo(id: "3", title: "Drink water"),
          Memo(
            id: "4",
            title: "Bring in dry cleaning",
          ),
        ];

  @override
  Future<Memo?> getMemo(MemoID id) async {
    return _getMemo(fakeMemos, id);
  }

  @override
  Future<void> insertMemo(Memo memo) async {
    await Future.delayed(Duration(seconds: _delay));
    fakeMemos.add(memo);
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    await Future.delayed(Duration(seconds: _delay));
    fakeMemos[fakeMemos.indexWhere((memo) => memo.id == memo.id)] = memo;
  }

  @override
  Future<void> deleteMemo(MemoID id) async {
    await Future.delayed(Duration(seconds: _delay));
    fakeMemos.removeWhere((memo) => memo.id == id);
  }

  @override
  Stream<List<Memo>> watchMemosList() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield fakeMemos;
  }

  @override
  Stream<Memo> watchMemos() {
    // TODO: implement watchMemos
    throw UnimplementedError();
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
}

@riverpod
MemosRepository memosRepository(MemosRepositoryRef ref) {
  return FakeMemosRepository();
}

@riverpod
Stream<List<Memo>> memosStream(MemosStreamRef ref) {
  return ref.watch(memosRepositoryProvider).watchMemosList();
}

@riverpod
Future<Memo?> memoFuture(MemoFutureRef ref, MemoID id) {
  return ref.watch(memosRepositoryProvider).getMemo(id);
}
