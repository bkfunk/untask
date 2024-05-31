// import 'package:flutter/material.dart';
// import 'package:untask/src/features/memos/data/memos_repository.dart';

// class RepositoryController extends InheritedWidget {
//   const RepositoryController({
//     Key? key,
//     required Widget child,
//     MemosRepository? memosRepository
//   }) : super(key: key, child: child);
//   memosRepository = memosRepository ?? FakeMemosRepository(){

//   };

//   static RepositoryController of(BuildContext context) {
//     final RepositoryController? result =
//         context.dependOnInheritedWidgetOfExactType<RepositoryController>();
//     assert(result != null, 'No RepositoryController found in context');
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(RepositoryController oldWidget) {
//     return repository != oldWidget.repository;
//   }
// }
