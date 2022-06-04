import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
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
          title: Text(
            "Taken drug details",
            style: TextStyle(color: ColorConst.darck90),
          ),
        ),
        body: Column(
          children: [
            const Divider(thickness: 1.5),
            SizedBox(
              height: context.h * 0.8,
              width: context.w,
              child: ListView.builder(
                itemCount: drugDetalisInValue.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textDarck(drugDetalisInName[index], context,
                          size: FontConst.kMediumFont),
                      SizedBox(height: context.h * 0.01),
                      textDarck(
                        index == 0 || index == 1
                            ? drugDetalisInValue[index][index].toString()
                            : drugDetalisInValue[index].toString(),
                        context,
                        size: FontConst.kTextLargeFont,
                        color: ColorConst.darck90,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: context.h * 0.03)
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
