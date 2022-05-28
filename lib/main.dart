import 'package:emed/core/components/theme/theme_comp.dart';
import 'package:emed/routes/routes.dart';
import 'package:emed/views/auth/cubit/auth_cubit.dart';
import 'package:emed/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => HomeCubit())
      ],
      child: const MyApp(),
    ),
  );
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
