import "dart:async";
import "package:repository/repository.dart";
import "package:untask/src/features/memos/data/dtos/isar_memo.dart";
import "package:untask/src/features/memos/data/repositories/memos_repository.dart";
import "package:untask/src/features/memos/models/memo.dart";

class IsarMemosRepository extends IsarRepository<Memo, IsarMemo, MemoID>
    with MemosRepository {
  IsarMemosRepository({required super.db});

  @override
  Future<void> delete(MemoID id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Memo?> get(MemoID id) {
    // return db.collection<IsarMemo>().where().memoIDEqualTo(id).findFirst().then(
    //   (value) {
    //     if (value != null) {
    //       return Memo(
    //         id: value.memoID,
    //         createdAt: value.createdAt,
    //         title: value.title,
    //       );
    //     }
    //     return null;
    //   },
    // );
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Memo>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Memo item) {
    // TODO: implement insert
    // throw UnimplementedError();
    return Future.value();
  }

  @override
  Future<void> update(Memo item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Memo?> watch(MemoID id) {
    // TODO: implement watch
    throw UnimplementedError();
  }

  @override
  Stream<List<Memo>> watchList() {
    // TODO: implement watchList
    return Stream.fromIterable([
      [Memo(title: "Call dentist")],
    ]);
    // throw UnimplementedError();
  }
}
// SOON: Implement the real MemosRepository
  // final int _delay = 1;
  // final _memosController = StreamController<List<Memo>>.broadcast(
  //   onListen: () {
  //     debugPrint("Fake memos stream listener added");
  //   },
  //   onCancel: () {
  //     debugPrint("Fake memos stream listener removed");
  //   },
  // );
  // final List<Memo> fakeMemos;

  // FakeMemosRepository() : fakeMemos = [] {
  //   _memosController.stream.listen((memos) {
  //     debugPrint("Emitting: Fake memos updated: $memos");
  //   });
  //   for (var m in [
  //     Memo(title: "Call dentist"),
  //     Memo(title: "Build app"),
  //     Memo(title: "Buy more medicine"),
  //     Memo(title: "Drink water"),
  //     Memo(title: "Bring in dry cleaning"),
  //     Memo(title: "Pick up groceries"),
  //   ]) {
  //     createMemo(m);
  //     _memosController.add(fakeMemos);
  //   }
  // }

  // @override
  // Future<Memo?> getMemo(MemoID id) async {
  //   return _getMemo(fakeMemos, id);
  // }

  // @override
  // Future<void> insertMemo(Memo memo) async {
  //   debugPrint('insertMemo called with: $memo');
  //   // await Future.delayed(Duration(seconds: _delay));
  //   fakeMemos.add(memo);
  //   _memosController.add(fakeMemos);
  // }

  // @override
  // Future<void> updateMemo(Memo memo) async {
  //   // await Future.delayed(Duration(seconds: _delay));
  //   fakeMemos[fakeMemos.indexWhere((memo) => memo.id == memo.id)] = memo;
  //   _memosController.add(fakeMemos);
  // }

  // @override
  // Future<void> deleteMemo(MemoID id) async {
  //   // await Future.delayed(Duration(seconds: _delay));
  //   fakeMemos.removeWhere((memo) => memo.id == id);
  //   _memosController.add(fakeMemos);
  // }

  // @override
  // Stream<List<Memo>> watchMemosList() {
  //   debugPrint(
  //     'watchMemosList called: ${fakeMemos.map((e) => e.title).toList()}',
  //   );
  //   debugPrint('isPaused: ${_memosController.isPaused}');
  //   debugPrint('isClosed: ${_memosController.isClosed}');
  //   if (_memosController.isPaused) {
  //     return const Stream.empty();
  //   }
  //   return _memosController.stream;
  // }

  // @override
  // Stream<List<Memo>> watchMemos() {
  //   return Stream.fromIterable([
  //     fakeMemos,
  //   ]);
  // }

  // @override
  // Stream<Memo?> watchMemo(MemoID id) {
  //   return watchMemosList().map((memos) => _getMemo(memos, id));
  // }

  // static Memo? _getMemo(List<Memo> memos, MemoID id) {
  //   try {
  //     return memos.firstWhere((element) => element.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // @override
  // List<Memo> getMemos() {
  //   return fakeMemos;
  // }

//   @override
//   Future<void> delete(MemoID id) {
//     // TODO: implement delete
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement fakeItems
//   List<Memo> get fakeItems => throw UnimplementedError();

//   @override
//   Future<Memo?> get(MemoID id) {
//     // TODO: implement get
//     throw UnimplementedError();
//   }

//   @override
//   List<Memo> getList() {
//     // TODO: implement getList
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> insert(Memo item) {
//     // TODO: implement insert
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> update(Memo item) {
//     // TODO: implement update
//     throw UnimplementedError();
//   }

//   @override
//   Stream<Memo?> watch(MemoID id) {
//     // TODO: implement watch
//     throw UnimplementedError();
//   }

//   @override
//   Stream<List<Memo>> watchList() {
//     // TODO: implement watchList
//     throw UnimplementedError();
//   }
// }
