import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInOrRegister extends StatelessWidget {
  const SignInOrRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/e-med_blue.svg'),
            SizedBox(height: context.h * 0.1),
            const Center(
              child: Text(
                "Your medical data\nis always with you",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: context.h * 0.03),
            const Text(
              "Nunc orci sed sed posuere volutpat varius\negestas sit. Amet, suscipit eget dis fusce\nquam in aliquet pulvinar.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.h * 0.18),
            ElevatedButton(
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.8,
                  context.h * 0.075,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/signUp");
              },
            ),
            SizedBox(height: context.h * 0.02),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: ColorConst.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fixedSize: Size(
                  context.w * 0.8,
                  context.h * 0.075,
                ),
              ),
              child: Text(
                "Log In",
                style: TextStyle(color: ColorConst.blue, fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/signIn");
              },
            )
          ],
        ),
      ),
    );
  }
}
