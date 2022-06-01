import 'package:emed/core/components/app_bar/sign_up_app_bar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

class CheckPhoneNumber extends StatelessWidget {
  const CheckPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar("Sign Up"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          SizedBox(height: context.h * 0.03),
          const Center(
            child: Text(
              "We sent a confirmation code to your number.\nPlease, enter the code",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: context.h * 0.05),
          Padding(
            padding: EdgeInsets.only(left: context.w * 0.07),
            child: Text(
              "Confirmation code",
              style: TextStyle(
                fontSize: 16,
                color: ColorConst.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: context.h * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              inputChangeCode(context, first: true, last: false),
              inputChangeCode(context, first: true, last: false),
              inputChangeCode(context, first: true, last: false),
              inputChangeCode(context, first: true, last: false),
              inputChangeCode(context, first: true, last: true),
              // inputChangeCode(context, sixthController),
            ],
          ),
          SizedBox(height: context.h * 0.1),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.9,
                  context.h * 0.075,
                ),
              ),
              child: Text("Confirm",
                  style: TextStyle(fontSize: 18, color: ColorConst.white)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/personalId', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox inputChangeCode(BuildContext context,
      {required bool first, required bool last}) {
    return SizedBox(
      height: context.h * 0.06,
      width: context.w * 0.12,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          // controller: controller,
          autocorrect: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          keyboardType: TextInputType.number,
          maxLength: 1,
          onChanged: (v) {
            if (v.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (v.length == 1 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: ColorConst.blue),
                borderRadius: BorderRadius.circular(12)),
            hintText: "0",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ColorConst.blue),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
