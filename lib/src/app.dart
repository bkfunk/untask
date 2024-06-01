import "package:flutter/material.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:untask/src/features/memos/data/dto/isar_memo.dart";
import "package:untask/src/features/memos/data/memos_repository.dart";

import "routing/app_router.dart";

class AppController extends InheritedWidget {
  final MemosRepository memosRepository;
  late final Isar db;

  AppController({
    super.key,
    required this.db,
    required super.child,
    MemosRepository? memosRepository,
  }) : memosRepository = memosRepository ?? FakeMemosRepository() {
    _initDB();
  }

  Future<void> _initDB() async {}

  static AppController of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppController>();
    if (result == null) {
      throw Exception("AppController not found in context");
    }
    return result;
  }

  @override
  bool updateShouldNotify(covariant AppController oldWidget) {
    return memosRepository != oldWidget.memosRepository;
  }
}

class UntaskApp extends StatelessWidget {
  final Isar db;
  const UntaskApp({
    super.key,
    required this.db,
  });

  @override
  Widget build(BuildContext context) {
    return AppController(
      db: db,
      memosRepository: IsarMemosRepository(db: db),
      child: MaterialApp.router(
        // return MaterialApp.router(
        routerConfig: getGoRouter(),
        debugShowCheckedModeBanner: true,
        restorationScopeId: "app",
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
