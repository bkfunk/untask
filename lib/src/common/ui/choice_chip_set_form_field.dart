// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:untask/src/common/ui/choice_chip_set_controller.dart';

// import 'choice_chip_set.dart';

// class ChoiceChipSetFormField extends StatefulWidget {
//   const ChoiceChipSetFormField({
//     Key? key,
//     required this.value,
//   }) : super(key: key);
//   final ChoiceChipSetValue value;

//   @override
//   State<ChoiceChipSetFormField> createState() => _ChoiceChipSetFormFieldState();
// }

// class _ChoiceChipSetFormFieldState extends State<ChoiceChipSetFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return FormField<ChoiceChipSetValue>(
//       builder: (FormFieldState<ChoiceChipSetValue> fieldState) {
//         debugPrint('Building: ${widget.value}');
//         return ChoiceChipSet(chipLabels: widget.value.choices);
//       },
//       onSaved: (newValue) => debugPrint("New value: $newValue"),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:untask/src/common/ui/choice_chip_set_controller.dart';

import 'choice_chip_set.dart';

class ChoiceChipSetFormField<T> extends FormField<ChoiceChipValue<T>> {
  /// Controls the ChoiceChipSet
  ///
  /// If null, a ChoiceChipSetController will be created.
  final ChoiceChipSetController? controller;

  final Map<String, T> choices;

  ChoiceChipSetFormField(this.choices, {super.key, this.controller})
      : super(
          builder: (FormFieldState<ChoiceChipValue<T>> field) {
            final _ChoiceChipFormFieldState state =
                field as _ChoiceChipFormFieldState;
            return ChoiceChipSet(controller: state.controller);
          },
        );

  @override
  FormFieldState<ChoiceChipValue<T>> createState() =>
      _ChoiceChipFormFieldState<T>();
}

class _ChoiceChipFormFieldState<T> extends FormFieldState<ChoiceChipValue<T>> {
  ChoiceChipSetController? _controller;
  ChoiceChipSetController get controller =>
      _choiceChipFormField.controller ?? _controller!;
  ChoiceChipSetFormField get _choiceChipFormField =>
      super.widget as ChoiceChipSetFormField;

  @override
  void initState() {
    super.initState();

    if (_choiceChipFormField.controller == null) {
      _controller = ChoiceChipSetController();
      _controller?.setChoices(_choiceChipFormField.choices);
    } else {
      // _choiceChipFormField.controller!.addListener(() => didChange(controller.value))
    }
  }
}
