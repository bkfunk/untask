import "package:flutter/material.dart";
import "package:untask/src/features/memos/data/memos_repository.dart";

import "routing/app_router.dart";

class AppController extends InheritedWidget {
  final FakeMemosRepository memosRepository;

  AppController({
    super.key,
    required super.child,
    FakeMemosRepository? memosRepository,
  }) : memosRepository = memosRepository ?? FakeMemosRepository();

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
  const UntaskApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppController(
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
