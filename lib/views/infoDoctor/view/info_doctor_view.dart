import 'package:emed/core/constants/color_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/services/naigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoDoctorView extends StatelessWidget {
  int index;
  InfoDoctorView({Key? key, required this.index}) : super(key: key);

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
          doctors[index],
          style: TextStyle(color: ColorConst.black, fontSize: 18),
        ),
      ),
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
          textDarck60("Place of work", context),
          const SizedBox(height: 10),
          textDarck90("Pediatric hospital №14", context),
          // ? --------
          SizedBox(height: context.h * 0.04),
          textDarck60("Work location", context),
          const SizedBox(height: 10),
          textDarck90(
              "Shaykhantakhur district, st.\n \nZulfiyahonim, 18 Tashkent, 100128",
              context),

          // ? --------

          SizedBox(height: context.h * 0.04),
          textDarck60("Available time", context),
          const SizedBox(height: 10),
          textDarck90("Monday - Saturday\n\n10:00 - 16:00", context),

          SizedBox(height: context.h * 0.03),
          textDarck60("Rating", context),
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
                Navigator.pushNamed(context, '/addappointmetthedoctor');
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

  Padding textDarck90(text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.w * 0.06),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: ColorConst.darck90,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding textDarck60(text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.w * 0.06),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: ColorConst.darck60,
        ),
      ),
    );
  }
}
