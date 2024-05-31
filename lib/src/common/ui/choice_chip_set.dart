// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";

// LATER: Add ChoiceChipSection with a divider and optional headline
// part 'choice_chip_set.g.dart';

// @riverpod
class ChoiceChipSet extends StatefulWidget {
  final double spacing;
  final List<ChoiceChipValue> choices;

  const ChoiceChipSet({
    super.key,
    this.spacing = 5.0,
    required this.choices,
  });

  @override
  State<ChoiceChipSet> createState() => _ChoiceChipSetState();
}

// @riverpod
class _ChoiceChipSetState extends State<ChoiceChipSet> {
  ChoiceChipValue? selectedChoice;

  @override
  Widget build(BuildContext context) {
    debugPrint("Choices: ${widget.choices.toString()}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: widget.spacing,
        children: [
          for (var choice in widget.choices)
            ChoiceChip(
              label: Text(choice.label),
              selected: selectedChoice == choice,
              onSelected: (isSelected) {
                setState(
                  () => isSelected
                      ? selectedChoice = choice
                      : selectedChoice = null,
                );
              },
            ),
        ],
      ),
    );
  }
}

/// A ChoiceChipValue is just a record that connects the label (for display)
/// to a value of type T
typedef ChoiceChipValue<T> = ({String label, T value});
