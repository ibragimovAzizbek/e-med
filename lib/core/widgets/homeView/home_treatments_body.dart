import 'package:emed/core/components/app_bar/homeAppbar/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeTrarmentsBody extends StatelessWidget {
  const HomeTrarmentsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          homeAppBar,
          Center(
            child: Text("Adahbs"),
          )
        ],
      ),
    );
  }
}
