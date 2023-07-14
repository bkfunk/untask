import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_memo_form_controller.g.dart';

@riverpod
class CreateMemoFormController extends _$CreateMemoFormController {
  @override
  FutureOr build() {}

  Future<bool> submit() async {
    return Future.value(true);
  }
}
