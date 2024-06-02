import "package:repository/repository.dart";
import "package:untask/src/features/memos/data/repositories/memos_repository.dart";
import "package:untask/src/features/memos/models/memo.dart";

class FakeMemosRepository extends FakeRepository<Memo, MemoID>
    with MemosRepository {
  FakeMemosRepository() : super(fakeItems: _defaultFakeItems<Memo>());

  static List<T> _defaultFakeItems<T>() {
    return <T>[
      Memo(title: "Call dentist") as T,
      Memo(title: "Pick up child") as T,
      Memo(title: "Make dinner") as T,
      Memo(title: "Sign form") as T,
      Memo(title: "Go to the gym") as T,
    ];
  }
}
