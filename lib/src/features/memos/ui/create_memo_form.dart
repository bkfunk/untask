import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untask/src/common/ui/choice_chip_set.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';
import 'package:untask/src/features/motivations/data/motivations_repository.dart';

import '../models/memo.dart';

class CreateMemoForm extends ConsumerStatefulWidget {
  const CreateMemoForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateMemoFormState();
}

// IDEA: We should use the same form to both display and edit a memo?
class _CreateMemoFormState extends ConsumerState<CreateMemoForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            FormBuilderTextField(
              name: 'Memo Name',
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Thing to do'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(3),
              ]),
            ),
            // const Text('I can do this in...'),
            // motivations.when(
            //   data: (motivs) {
            //     debugPrint("Motivations: ${motivs.toString()}");
            //     return ChoiceChipSet(
            //         choices: motivs
            //             .map((e) => (label: e.description, value: e.id))
            //             .toList());
            //   },
            //   loading: () => const Text('loading'),
            //   error: (error, stackTrace) => const Text('Error'),
            // ),
            // LATER: Add a "+" button to add more motivations
            const Spacer(),
            ElevatedButton(onPressed: _submit, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    // Validate and save the form values
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint("Valid: ${_formKey.currentState?.value.toString()}");
      ref.read(memosRepositoryProvider).createMemo(
            Memo(title: _formKey.currentState!.value['Memo Name'] as String),
          );
    } else {
      debugPrint("Invalid: ${_formKey.currentState?.value.toString()}");
    }
    Navigator.of(context).pop();

    // On another side, can access all field values without saving form with instantValues
    // _formKey.currentState?.validate();
    // debugPrint(_formKey.currentState?.instantValue.toString());
    //   // NOW: When a create memo form is submitted, it should create the memo in the repository
    //   setState(() {});
    //   _formKey.currentState?.save();
    //   final controller = ref.read(createMemoFormControllerProvider.notifier);
    //   final success = await controller.submit();
    //   final value = _formKey.currentState.toString();
    //   debugPrint("Success: $value $success");
    //   // TODO add params to submit
  }
}
