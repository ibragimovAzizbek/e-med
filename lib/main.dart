import 'package:emed/core/components/theme/theme_comp.dart';
import 'package:emed/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-med',
      theme: lightMode,
      initialRoute: '/splash',
      onGenerateRoute: RouteController.inherentce.onGenerateRoute,
    );
  }
}
