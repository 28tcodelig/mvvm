import 'package:complete_advance_flutter/presentation/resources/routes_manager.dart';
import 'package:complete_advance_flutter/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); //private named constructor

  static const MyApp instance =
      MyApp._internal(); //single instance -- singleton

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RountesGenerator.getRoute,
      initialRoute: Routes.splashRoutes,
      theme: getAppilicationTheme(),
    );
  }
}
