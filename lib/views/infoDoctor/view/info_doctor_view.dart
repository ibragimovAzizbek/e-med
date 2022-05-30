import 'package:emed/core/components/app_bar/info_and_appointment_appbar.dart';
import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoDoctorView extends StatelessWidget {
  int index;
  InfoDoctorView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAndAppointmentAppBar(index),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(thickness: 2),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage:
                  NetworkImage('https://source.unsplash.com/random/$index'),
            ),
          ),
          SizedBox(height: context.h * 0.027),
          Center(
            child: Text(
              doctors[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              position[index],
              style: TextStyle(
                fontSize: 16,
                color: ColorConst.darck60,
              ),
            ),
          ),
          SizedBox(height: context.h * 0.04),
          textDarck(
            "Place of work",
            context,
            color: ColorConst.darck60,
            size: FontConst.kMediumFont,
          ),
          const SizedBox(height: 10),
          textDarck(
            "Pediatric hospital №14",
            context,
            color: ColorConst.darck90,
            size: FontConst.kTextLargeFont,
            fontWeight: FontWeight.bold,
          ),
          // ? --------
          SizedBox(height: context.h * 0.04),
          textDarck(
            "Work location",
            context,
            color: ColorConst.darck60,
            size: FontConst.kMediumFont,
          ),
          const SizedBox(height: 10),
          textDarck(
            "Shaykhantakhur district, st.\n \nZulfiyahonim, 18 Tashkent, 100128",
            context,
            color: ColorConst.darck90,
            size: FontConst.kTextLargeFont,
            fontWeight: FontWeight.bold,
          ),

          // ? --------

          SizedBox(height: context.h * 0.04),
          textDarck(
            "Available time",
            context,
            color: ColorConst.darck60,
            size: FontConst.kMediumFont,
          ),
          const SizedBox(height: 10),
          textDarck(
            "Monday - Saturday\n\n10:00 - 16:00",
            context,
            color: ColorConst.darck90,
            size: FontConst.kTextLargeFont,
            fontWeight: FontWeight.bold,
          ),

          SizedBox(height: context.h * 0.03),
          textDarck(
            "Rating",
            context,
            color: ColorConst.darck60,
            size: FontConst.kMediumFont,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: ColorConst.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
          ),

          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.9,
                  context.h * 0.068,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/addappointmetthedoctor',
                    arguments: index);
              },
              child: const Text(
                "Add new appiontment",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
