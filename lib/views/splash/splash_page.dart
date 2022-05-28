import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Center(child: SvgPicture.asset('assets/icons/e-med_white.svg', fit: BoxFit.cover,)),
    );
  }
}
