import 'package:emed/core/components/app_bar/info_and_appointment_appbar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TreanmentDetalisPage extends StatelessWidget {
  int indexDoctor;
  TreanmentDetalisPage({Key? key, required this.indexDoctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAndAppointmentAppBar(indexDoctor),
      body: Column(
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
