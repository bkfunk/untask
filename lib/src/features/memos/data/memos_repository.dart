import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/memo.dart';

abstract class MemosRepository {
  Memo? getMemo(MemoID id);
  createMemo(Memo memo);
  updateMemo(Memo memo);
  deleteMemo(MemoID id);

  Stream<List<Memo>> watchMemosList();
  Stream<Memo?> watchMemo(MemoID id);
}

// SOON: Implement the real MemosRepository
class FakeMemosRepository implements MemosRepository {
  final List<Memo> fakeMemos;

  FakeMemosRepository()
      : fakeMemos = [
          Memo(id: "0", title: "Call dentist"),
          Memo(id: "1", title: "Build app"),
          Memo(id: "2", title: "Buy more medicine"),
          Memo(id: "3", title: "Drink water", isTriaged: true),
          Memo(id: "4", title: "Bring in dry cleaning", isReleased: true),
        ];

  @override
  Memo? getMemo(MemoID id) {
    return _getMemo(fakeMemos, id);
  }

  @override
  Stream<List<Memo>> watchMemosList() async* {
    yield fakeMemos;
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
  Memo createMemo(Memo memo) {
    new_id = fakeMemos.length.toString();
    Memo newMemo = memo.copyWith(id: new_id);
    fakeMemos.add(newMemo);
    return newMemo;
  }

  @override
  deleteMemo(MemoID id) {
    fakeMemos.removeWhere((memo) => memo.id == id);
  }

  @override
  updateMemo(Memo memo) {
    fakeMemos[fakeMemos.indexWhere((memo) => memo.id == memo.id)] = memo;
  }
}

final memosRepositoryProvider = Provider<MemosRepository>((ref) {
  return FakeMemosRepository();
});

final memosListStreamProvider = StreamProvider.autoDispose<List<Memo>>((ref) {
  final memosRepository = ref.watch(memosRepositoryProvider);
  return memosRepository.watchMemosList();
});

final memoProvider =
    StreamProvider.autoDispose.family<Memo?, MemoID>((ref, id) {
  final memosRepository = ref.watch(memosRepositoryProvider);
  return memosRepository.watchMemo(id);
});
