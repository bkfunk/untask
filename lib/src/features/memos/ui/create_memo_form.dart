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
            // LATER: Add motivations
            // LATER: Add a "+" button to add more motivations
            ElevatedButton(onPressed: _submit, child: const Text('Submit')),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    // Validate and save the form values
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      ref.read(memosListProvider.notifier).addMemo(
            Memo(title: _formKey.currentState!.value['Memo Name'] as String),
          );
      // Valid data, so save the memo to the repository

      // ref
      //     .read(memosRepositoryProvider)
      //     .createMemo(
      //       // The repository will handle creating an ID and createdAt timestamp
      //       Memo(title: _formKey.currentState!.value['Memo Name'] as String),
      //     )
      //     .then((value) {
      //   debugPrint("Valid: ${value.toString()}");
      Navigator.of(context).pop();
    } else {
      debugPrint("Invalid: ${_formKey.currentState?.value.toString()}");
    }
  }
}
