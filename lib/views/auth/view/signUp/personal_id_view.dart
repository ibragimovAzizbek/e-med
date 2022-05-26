import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalId extends StatelessWidget {
  const PersonalId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your personal ID",
          style: TextStyle(
            color: ColorConst.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(thickness: 1),
          SizedBox(height: context.h * 0.2),
          Center(
            child: SvgPicture.asset(
              'assets/icons/person_id.svg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: context.h * 0.04),
          const Center(
            child: Text(
              "Doctors use your ID to have an access to\nyour medical informations. We have sent this ID and\nyour password to your number so you don’t\nforget them",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: context.h * 0.05),
          Padding(
            padding: EdgeInsets.only(left: context.w * 0.1),
            child: const Text("Your ID", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: context.h * 0.02),
          Container(
            margin: EdgeInsets.only(left: context.w * 0.1),
            height: context.h * 0.06,
            width: context.w * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: ColorConst.blue),
              color: ColorConst.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text("45632189"),
            ),
          ),
          SizedBox(height: context.h * 0.1),
          Center(
            child: ElevatedButton(
              child: Text(
                "Go to your account",
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.8,
                  context.h * 0.07,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          )
        ],
      ),
    );
  }
}
