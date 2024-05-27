import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untask/src/features/memos/data/memos_repository.dart';
import 'package:untask/src/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return _EagerInitialization(
      child: MaterialApp.router(
        // return MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: true,
        restorationScopeId: 'app',
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    // final result = ref.watch(memosRepositoryProvider);
    // print('Eagerly initialized: $result');
    return child;
  }
}
