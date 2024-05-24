import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/memo.dart';

part 'memos_repository.g.dart';

abstract class MemosRepository {
  Future<Memo?> getMemo(MemoID id);
  Future<void> createMemo(Memo memo);
  Future<void> updateMemo(Memo memo);
  Future<void> deleteMemo(MemoID id);

  Stream<Memo> watchMemos();
  Stream<List<Memo>> watchMemosList();
  Stream<Memo?> watchMemo(MemoID id);

  Future<List<Memo>> fetchMemos();
  Future<Memo?> fetchMemo(MemoID id);
}

// SOON: Implement the real MemosRepository
@riverpod
class FakeMemosRepository extends _$FakeMemosRepository
    implements MemosRepository {
  @override
  Future<List<Memo>> build() async {
    return Future.value([
      Memo(title: "Call dentist"),
      Memo(title: "Build app"),
      Memo(title: "Buy more medicine"),
      Memo(title: "Drink water"),
      Memo(title: "Bring in dry cleaning"),
    ]);
  }

  @override
  Future<void> createMemo(Memo memo) async {
    final previousState = await future;
    state = AsyncData([...previousState, memo]);
  }

  @override
  Future<void> deleteMemo(MemoID id) async {
    final previousState = await future;
    state = AsyncData(previousState.where((memo) => memo.id != id).toList());
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    final previousState = await future;
    state = AsyncData([
      for (final m in previousState)
        if (m.id == memo.id) memo else m,
    ]);
  }

  @override
  Future<Memo?> getMemo(MemoID id) async {
    return _getMemo(await future, id);
  }

  @override
  Stream<Memo> watchMemos() async* {
    List<Memo> memos = await future;
    for (Memo memo in memos) {
      yield memo;
    }
  }

  @override
  Stream<List<Memo>> watchMemosList() async* {
    yield state.asData!.value;
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
  Future<List<Memo>> fetchMemos() {
    return future;
  }

  @override
  Future<Memo?> fetchMemo(MemoID id) {
    return fetchMemos().then((memos) => _getMemo(memos, id));
  }
}

@riverpod
FakeMemosRepository memosRepository(MemosRepositoryRef ref) {
  return FakeMemosRepository();
}

@riverpod
Stream<Memo> allMemos(AllMemosRef ref) {
  // SOON: Add filtering and sorting
  return ref.watch(memosRepositoryProvider).watchMemos();
}

@riverpod
Future<List<Memo>> fetchMemosList(FetchMemosListRef ref) {
  return ref.watch(memosRepositoryProvider).fetchMemos();
}
// AsyncValue<List<Memo>> memosListStream(MemosRepositoryRef ref) {
//   return ref.watch(memosRepositoryProvider).watchMemosList().asAsyncValue();
// }

// final memosRepositoryProvider = Provider<MemosRepository>((ref) {
//   return FakeMemosRepository();
// });

// final memosListStreamProvider = StreamProvider.autoDispose<List<Memo>>((ref) {
//   final memosRepository = ref.watch(memosRepositoryProvider);
//   return memosRepository.watchMemosList();
// });

// final memoProvider =
//     StreamProvider.autoDispose.family<Memo?, MemoID>((ref, id) {
//   final memosRepository = ref.watch(memosRepositoryProvider);
//   return memosRepository.watchMemo(id);
// });
