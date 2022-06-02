import 'package:emed/core/components/app_bar/homeAppbar/home_app_bar.dart';
import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/widgets/search_data/search_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

class HomeHospetalBody extends StatelessWidget {
  const HomeHospetalBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeAppBarNotNotification,
            SearchData(searchName: "Search hospitals...", route: '/searchPage'),
            const Divider(),
            textDarck(
              "Recommended hospitals for you",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck60,
            ),
            SizedBox(height: context.h * 0.02),
            SizedBox(
              height: context.h,
              width: context.w,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return hospitalData(context, index: index);
                },
                itemCount: 8,
              ),
            ),
            SizedBox(height: context.h * 26),
          ],
        ),
      ),
    );
  }

  Column hospitalData(BuildContext context, {required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                height: context.h * 0.35,
                width: context.w * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/random/$index',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 30,
              child: Row(
                children: [
                  dateContainerView(
                    context,
                    w: 0.28,
                    icon: Icons.calendar_month_outlined,
                    text: "Mon-Sat",
                  ),
                  SizedBox(width: context.w * 0.03),
                  dateContainerView(
                    context,
                    w: 0.32,
                    icon: Icons.watch_later_outlined,
                    text: "09:00 - 18:00",
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: context.h * 0.014),
        textDarck(
          "Uzbekistan New International Clinic",
          context,
          size: FontConst.kTextLargeFont,
          color: ColorConst.darck90,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        textDarck(
          "Tashkent, Shaykhontokhur, Navoi street",
          context,
          size: FontConst.kMediumFont,
          color: ColorConst.darck60,
        ),
        SizedBox(height: context.h * 0.03),
      ],
    );
  }

  Container dateContainerView(
    BuildContext context, {
    required double w,
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: context.h * 0.03,
      width: context.w * w,
      decoration: BoxDecoration(
        color: ColorConst.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: ColorConst.darck60,
          ),
          Text(
            text,
            style: TextStyle(color: ColorConst.darck60),
          ),
        ],
      ),
    );
  }
}
