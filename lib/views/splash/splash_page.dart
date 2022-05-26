import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/signInOrRegister');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.blue,
      body: Center(
        child: Text(
          "e-med",
          style: TextStyle(
            color: ColorConst.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
