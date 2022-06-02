import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.chevron_left,
                color: ColorConst.blue,
              ),
              Text(
                "Back",
                style: TextStyle(
                    color: ColorConst.blue, fontSize: FontConst.kTextLargeFont),
              ),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Hospital",
          style: TextStyle(color: ColorConst.darck90),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: () {
              // * Filter button
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            SizedBox(height: context.h * 0.03),
            const Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/hospital.png'),
              ),
            ),
            SizedBox(height: context.h * 0.03),
            Center(
              child: textDarck(
                "Tashkent International Clinic",
                context,
                size: FontConst.kTextLargeFont,
                color: ColorConst.darck90,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.h * 0.03),
            textDarck(
              "Phone number",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck60,
            ),
            SizedBox(height: context.h * 0.003),
            Row(
              children: [
                textDarck(
                  "+998 97 210 11 12",
                  context,
                  size: FontConst.kTextLargeFont,
                  color: ColorConst.darck90,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: context.w * 0.45),
                SizedBox(
                  height: context.h * 0.05,
                  width: context.w * 0.065,
                  child: Image.asset('assets/images/call.png'),
                ),
              ],
            ),
            SizedBox(height: context.h * 0.02),
            textDarck(
              "Working time",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            SizedBox(height: context.h * 0.02),
            textDarck(
              "Monday - Saturday",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.01),
            textDarck(
              "10:00 - 16:00",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.02),
            textDarck(
              "Location",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            SizedBox(height: context.h * 0.01),
            textDarck(
              "Tashkent, Farabi street, 59",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.015),
            textDarck(
              "Location link",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            Padding(
              padding: EdgeInsets.only(left: context.w * 0.035),
              child: TextButton(
                child: Text(
                  "See on Google Maps",
                  style: TextStyle(
                    fontSize: FontConst.kMediumFont,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: context.h * 0.02),
            textDarck(
              "Website",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            Padding(
              padding: EdgeInsets.only(left: context.w * 0.035),
              child: TextButton(
                child: Text(
                  "tashclinic.org",
                  style: TextStyle(
                    fontSize: FontConst.kMediumFont,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: context.h * 0.03),
            textDarck(
              "Doctors at this hospital",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            SizedBox(height: context.h * 0.03),
            SizedBox(
              height: context.h * 0.87,
              width: context.w,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://source.unsplash.com/random/$index',
                          ),
                        ),
                        title: Text(doctors[index]),
                        subtitle: Text(position[index]),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/infoDoctor',
                            arguments: index,
                          );
                        },
                      ),
                      Divider(indent: context.w * 0.13, endIndent: 5),
                    ],
                  );
                },
                itemCount: doctors.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
