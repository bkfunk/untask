// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/common/ui/choice_chip_set_controller.dart';

// TODO: Add ChoiceChipSection with a divider and optional headline

class ChoiceChipSet extends ConsumerWidget {
  final ChoiceChipSetController controller;
  final double spacing;

  const ChoiceChipSet({
    super.key,
    required this.controller,
    this.spacing = 5.0,
  });
  // const ChoiceChipSet({
  //   Key? key,
  //   required this.chipLabels,
  //   this.spacing = 5.0,
  // }) : super(key: key);

  // final List<String> chipLabels;
  // final double spacing;
  // // final ChoiceChipSetController controller;

  // ChoiceChipSetValue? get selectedChoice {
  //   return foo;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: spacing,
          children: controller.choices.keys
              .map((label) => ChoiceChip(
                    label: Text(label),
                    selected: controller.selectedLabel == label,
                    onSelected: (isSelected) {
                      isSelected
                          ? controller.select(label)
                          : controller.unselect();
                    },
                  ))
              .toList(),
        ));
  }
}

typedef ChoiceChipValue<T> = (String label, T value);

// class _ChoiceChipSetState extends ConsumerState<ChoiceChipSet> {
//   int? _selected;
//   int foo = 3;

//   ChoiceChipSetValue? get selectedChoice {
//     if (_selected == null) return null;
//     return ChoiceChipSetValue(widget.chipLabels, _selected);
//   }
// }
