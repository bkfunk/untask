import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/ui/create_memo_form_controller.dart';

import '../../../common/ui/choice_chip_set_form_field.dart';

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
    // const ChoiceChipSet choiceChipSet =
    // ChoiceChipSet(chipLabels: ['1', '2', '3']);
    // final chipSet =
    // ChoiceChipSetController(ChoiceChipSetValue({'One': 1, 'Two': 2}));
    final chipField = ChoiceChipSetFormField<int>(const {'One': 1, 'Two': 2});
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
                chipField,
                // FormField<int>(
                //   builder: (field) {
                //     return ChoiceChipSet(controller: chipSet);
                //   },
                // ),
                /* TODO?: Somehow we have to have access to the choice chip set
                 selected value. But the choice chip set doesn't exist outside
                 the builder closure. So we can't get it out.
                 */
                // FormField<int?>(
                //   initialValue: null,
                //   builder: (field) {
                //     debugPrint("Form field: ${field.value}");
                //     return choiceChipSet;
                //   },
                //   onSaved: (newValue) {
                //     debugPrint("Saved: $newValue; ${choiceChipSet.");
                //   },
                // ),
                // ChoiceChipSetFormField(
                //   value: ChoiceChipSetValue(['a', 'b', 'c'], null),
                // ),
                ElevatedButton(onPressed: _submit, child: const Text('Submit'))
              ],
            )));
  }

  Future<void> _submit() async {
    setState(() {});
    _formKey.currentState?.save();
    final controller = ref.read(createMemoFormControllerProvider.notifier);
    final success = await controller.submit();
    final value = _formKey.currentState.toString();
    debugPrint("Success: $value $success");
    // TODO add params to submit
  }
}
// /// Form containing all the inputs for a memo
// class CreateMemoForm extends ConsumerStatefulWidget {
//   const CreateMemoForm({super.key});

//   @override
//   ConsumerState<CreateMemoForm> createState() => _CreateMemoFormState();
// }

// class _CreateMemoFormState extends ConsumerState<CreateMemoForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _timeSelection = <int>{};

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     // TODO: implement toString
//     return 'Foo';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: <Widget>[
//           TextFormField(autofocus: true),
//           // const ChoiceChipSet(
//           // chipLabels: ["< 2 min.", "< 10 min.", "< 30 min."]),
//           // const ChoiceChipSet(chipLabels: ["> 5 min.", "> 10 min"]),
//           const MotivationSelector(
//               // formKey: _formKey,
//               ),
//           ElevatedButton(
//             child: const Text('Submit'),
//             onPressed: () {
//               _formKey.currentState?.save();
//               // print(_formKey.currentState.toString());
//             },
//           )
//           // SegmentedButton(
//           //   segments: const [
//           //     ButtonSegment(value: 0, label: Text('< 2')),
//           //     ButtonSegment(value: 1, label: Text('2+')),
//           //   ],
//           //   selected: _timeSelection,
//           //   onSelectionChanged: (Set<int> newSelection) {
//           //     setState(() {
//           //       if (newSelection.isNotEmpty) {
//           //         _timeSelection = <int>{newSelection.first};
//           //       }
//           //     });
//           //   },
//           //   emptySelectionAllowed: true,
//           // ),
//         ],
//       ),
//     );
//   }
// }
