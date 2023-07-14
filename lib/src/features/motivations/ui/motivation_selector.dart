// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../common/ui/async_value_widget.dart';
// import '../../../common/ui/choice_chip_set.dart';
// import '../data/motivations_repository.dart';

// class MotivationSelector extends ConsumerWidget {
//   const MotivationSelector({
//     super.key,
//     // required this.formKey,
//   });

//   // final GlobalKey formKey;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final motivationsAsyncValue = ref.watch(motivationsListStreamProvider);
//     return AsyncValueWidget(
//       asyncValue: motivationsAsyncValue,
//       dataLoadedBuilder: (motivations) => FormField<String>(
//         // key: formKey,
//         builder: (FormFieldState<String> state) => ChoiceChipSet(
//             // TODO: Fix the null case
//             chipLabels: motivations.map((m) => m.description).toList()),
//         onSaved: (newValue) {
//           print("Value: $newValue");
//         },
//       ),
//     );
//   }
// }
