import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/ui/create_memo_form.dart';
import 'package:untask/src/localization/string_hardcoded.dart';

class CreateMemoView extends ConsumerWidget {
  const CreateMemoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: const CreateMemoForm(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // NOW: Make the Create and Triage Later buttons work
          FloatingActionButton.extended(
              heroTag: null, onPressed: () {}, label: Text("Create".hardcoded)),
          FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {},
              label: Text("Triage Later".hardcoded))
        ]),
      ),
      bottomNavigationBar: const BottomAppBar(
          child: Row(
        children: [Icon(Icons.save)],
      )),
    );
  }
}
