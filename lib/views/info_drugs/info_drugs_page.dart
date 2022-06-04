import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:flutter/material.dart';

class InfoDrugPage extends StatelessWidget {
  int index;
  InfoDrugPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 75,
        leading: InkWell(
          child: Row(
            children: [
              const Icon(Icons.chevron_left),
              Text(
                "Back",
                style: TextStyle(
                  color: ColorConst.blue,
                  fontSize: FontConst.kTextLargeFont,
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(drugs[index]),
      ),
    );
  }
}
