import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateMemoForm extends StatefulWidget {
  const CreateMemoForm({super.key});

  @override
  State<StatefulWidget> createState() => _CreateMemoFormState();
}

// IDEA: We should use the same form to both display and edit a memo?
class _CreateMemoFormState extends State<CreateMemoForm> {
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
      // NOW: Save the memo to the repository
      Navigator.of(context).pop();
    } else {
      debugPrint("Invalid: ${_formKey.currentState?.value.toString()}");
    }
  }
}
