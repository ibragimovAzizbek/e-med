import 'package:emed/core/components/app_bar/homeAppbar/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeHospetalBody extends StatelessWidget {
  const HomeHospetalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeAppBarNotNotification,
            
          ],
        ),
      ),
    );
  }
}
