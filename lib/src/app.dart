import 'package:flutter/material.dart';

import 'routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // return MaterialApp.router(
      routerConfig: getGoRouter(),
      debugShowCheckedModeBanner: true,
      restorationScopeId: 'app',
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // ),
    );
  }
}
