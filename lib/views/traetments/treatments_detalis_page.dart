import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/services/naigation/navigation_service.dart';
import 'package:flutter/material.dart';

class TreanmentDetalisPage extends StatelessWidget {
  int indexDoctor;
  TreanmentDetalisPage({Key? key, required this.indexDoctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          child: Row(
            children: [
              Icon(
                Icons.chevron_left,
                color: ColorConst.blue,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConst.blue,
                ),
              ),
            ],
          ),
          onPressed: () {
            NavigationService.pop();
          },
        ),
        title: Text(
          "Treatment details",
          style: TextStyle(color: ColorConst.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(thickness: 2),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/random/$indexDoctor'),
              ),
            ),
            SizedBox(height: context.h * 0.027),
            Center(
              child: Text(
                doctors[indexDoctor],
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                position[indexDoctor],
                style: TextStyle(
                  fontSize: 16,
                  color: ColorConst.darck60,
                ),
              ),
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Clinic",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "Clinic Medion",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Clinic location",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "Shaykhantakhur district, st.\nZulfiyahonim, 18 Tashkent, 100128",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Start date",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "20.11.2022",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Complaints",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "Redness on the skin",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Diagnosis",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "Skin psoriasis",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Treatment",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              "Diet, Ozone therapy / 6 days, tivortin\n100.0 / 6 days",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Analysis",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: context.w * 0.06),
              child: Text(
                "blood, urine, ultirasound, hormones",
                style: TextStyle(
                  color: ColorConst.blue,
                  fontSize: FontConst.kTextLargeFont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Drugs being taken",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            SizedBox(
              height: context.h * 0.22,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: drugs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        drugsBeingToken(
                          context,
                          drugs[index],
                          drugsMl[index],
                          index,
                        ),
                        const Divider(),
                      ],
                    );
                  }),
            ),
            SizedBox(height: context.h * 0.04),
            textDarck(
              "Conclusion",
              context,
              size: FontConst.kMediumFont,
              color: ColorConst.darck60,
            ),
            const SizedBox(height: 10),
            textDarck(
              """You will need a blood test for your doctor to find out if you have hypokalemia. They will ask you about your health history. They’ll want to know if you’ve had any illness that involved vomiting or diarrhea. They’ll ask about any conditions you might have that could be causing it.
Since low potassium sometimes can affect your blood pressure, your doctor will check that, too.""",
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: context.h * 0.03),
          ],
        ),
      ),
    );
  }

  drugsBeingToken(BuildContext context, title, mg, mode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: FontConst.kTextLargeFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  mg,
                  style: TextStyle(
                    color: ColorConst.darck60,
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            context: context,
            builder: (context) {
              return Container(
                height: context.h * 0.75,
                width: context.w,
                decoration: BoxDecoration(
                  color: ColorConst.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: context.w,
                      height: context.h * 0.07,
                      decoration: BoxDecoration(
                        color: ColorConst.grey05,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: context.w * 0.1),
                          Center(
                            child: textDarck(
                              drugs[mode],
                              context,
                              size: FontConst.kTextLargeFont,
                              color: ColorConst.darck90,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(
                                color: ColorConst.blue,
                                fontSize: FontConst.kTextLargeFont,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.03),
                    textDarck(
                      'Drug name',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      drugs[mode],
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                    textDarck(
                      'Dose',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      drugsMl[mode],
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                    textDarck(
                      'Taking dates (start-end)',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      "20.11.2022 - 30.11.2022",
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                    textDarck(
                      'Associated with',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      "Multiple sclerosis",
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                    textDarck(
                      'Comments',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      "Consume without water. It lessens the effect",
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                    textDarck(
                      'Drug name',
                      context,
                      size: FontConst.kMediumFont,
                      color: ColorConst.darck60,
                    ),
                    const SizedBox(height: 10),
                    textDarck(
                      drugs[mode],
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: context.h * 0.04),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
