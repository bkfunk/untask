// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'choice_chip_set_controller.g.dart';

// @riverpod
// class ChoiceChipSetController<T> extends _$ChoiceChipSetController {
//   // final ChoiceChipSetState _state = ChoiceChipSetState();

//   // String? get selectedLabel => state.selectedLabel;
//   // bool get hasSelection => state.hasSelection;
//   // T? get selectedValue => choices[selectedLabel!];
//   // @override

//   @override
//   ChoiceChipSetState build() {
//     // state = ChoiceChipSetState();
//     // return state;
//     return ChoiceChipSetState();
//   }

//   void setChoices(Map<String, T> choices) {
//     state.choices = choices;
//   }

//   // Map<String, dynamic> choices,
//   //   [String? selectedLabel]) {
//   // state = ChoiceChipSetState();
//   // state.choices = choices;
//   // state.selectedLabel = selectedLabel;
//   // return state;
//   // return ChoiceChipSetState(choices, selectedLabel);
//   // return ChoiceChipValue(choices, selectedLabel);

//   // If selected label is provided, then return a ChoiceChipValue record.
//   // Otherwise, return null.
//   // choices = choices;
//   // selectedLabel = selectedLabel;
//   // return selectedRecord;
//   // selectedLabel == null || choices[selectedLabel] != null
//   //     ? null
//   //     : (label: selectedLabel, value: );
//   // return null;

//   void select(String label) => state.select(label);
//   void unselect() => state.unselect();

//   Map<String, dynamic> get choices => state.choices;
//   String? get selectedLabel => state.selectedLabel;
//   // void select(String label) => selectedLabel = label;
//   // void unselect() => selectedLabel = null;

//   // bool get hasSelection => selectedLabel != null && selectedValue != null;
//   // T? get selectedValue => choices[selectedLabel];
//   // ChoiceChipValue<T>? get selectedRecord => hasSelection
//   //     ? (label: selectedLabel!, value: selectedValue!) as ChoiceChipValue<T>
//   //     : null;

//   // initState() {}
// }

// @riverpod
// class ChoiceChipSetState extends _$ChoiceChipSetState {
// //   // ChoiceChipSetState(this.choices, [this._selectedLabel]);

//   // @override
//   late final Map<String, dynamic> choices;
//   late String? selectedLabel;

//   // ChoiceChipSetState();
//   // ChoiceChipSetState(Map<String, dynamic> choices, [String? selectedLabel]);
//   // : _choices = choices,
//   // : _selectedLabel = selectedLabel;

//   // @override
//   // String? get selectedLabel => _selectedLabel;
// //   // T? get selectedValue => hasSelection ? choices[selectedLabel!] : null;

// //   bool get hasSelection => selectedLabel != null;

//   @override
//   void build() {}
//   // void build() {}; Map<String, dynamic> choices, String? selectedLabel) {}

//   void select(String label) {
//     selectedLabel = label;
//   }

// //   @override
// //   String toString() => 'ChoiceChipSetController(selectedIndex: $selectedLabel)';

//   unselect() {
//     selectedLabel = null;
//   }
// // }

// // class ChoiceChipSetValue<T> {
// //   final Map<String, T> choices;
// //   String? selectedLabel;

// //   ChoiceChipSetValue(this.choices, [this.selectedLabel]);

// //   bool get hasSelection => this.selectedLabel != null;
// //   T? get selectedValue => hasSelection ? choices[selectedLabel!] : null;

// //   void select(String? label) => selectedLabel = label;
// //   void unselect() => selectedLabel = null;

// //   @override
// //   String toString() =>
// //       'ChoiceChipSetValue(choices: $choices, selectedLabel: $selectedLabel)';

// //   @override
// //   bool operator ==(covariant ChoiceChipSetValue<T> other) {
// //     if (identical(this, other)) return true;

// //     return mapEquals(other.choices, choices) &&
// //         other.selectedLabel == selectedLabel;
// //   }

// //   @override
// //   int get hashCode => choices.hashCode ^ selectedLabel.hashCode;

// //   ChoiceChipSetValue<T> copyWith({
// //     Map<String, T>? choices,
// //     String? selectedLabel,
// //   }) {
// //     return ChoiceChipSetValue<T>(
// //       choices ?? this.choices,
// //       selectedLabel ?? this.selectedLabel,
// //     );
// //   }
// }
