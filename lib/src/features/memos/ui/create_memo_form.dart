import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/common/ui/choice_chip_set.dart';
import 'package:untask/src/features/memos/ui/create_memo_form_controller.dart';
import 'package:untask/src/features/motivations/data/motivations_repository.dart';

class CreateMemoForm extends ConsumerStatefulWidget {
  const CreateMemoForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateMemoFormState();
}

class _CreateMemoFormState extends ConsumerState<CreateMemoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createMemoFormControllerProvider);

    final motivations = ref.watch(motivationsListProvider);
    debugPrint("Motivations: ${motivations.toString()}");
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            const Text('Title'),
            TextFormField(
              enabled: !state.isLoading,
              initialValue: "Foo",
            ),
            const Text('I can do this in...'),
            motivations.when(
              data: (motivs) {
                debugPrint("Motivations: ${motivs.toString()}");
                return ChoiceChipSet(
                    choices: motivs
                        .map((e) => (label: e.description, value: e.id))
                        .toList());
              },
              loading: () => const Text('loading'),
              error: (error, stackTrace) => const Text('Error'),
            ),
            ElevatedButton(onPressed: _submit, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    // NOW: When a create memo form is submitted, it should create the memo in the repository
    setState(() {});
    _formKey.currentState?.save();
    final controller = ref.read(createMemoFormControllerProvider.notifier);
    final success = await controller.submit();
    final value = _formKey.currentState.toString();
    debugPrint("Success: $value $success");
    // TODO add params to submit
  }
}
