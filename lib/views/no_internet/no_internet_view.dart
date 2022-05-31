import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  child: LottieBuilder.asset('assets/anim/no_internet.json')),
              SizedBox(height: context.h * 0.05),
              Center(
                child: Text(
                  "Could not connect to internet.\n Please check again.",
                  style: TextStyle(
                    fontSize: FontConst.kLargeFont,
                    color: ColorConst.darck60,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
