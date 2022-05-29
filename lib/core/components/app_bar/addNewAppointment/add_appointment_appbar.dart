import 'package:emed/core/constants/color_const.dart';
import 'package:emed/services/naigation/navigation_service.dart';
import 'package:flutter/material.dart';

get addNewAppointmentAppBar => AppBar(
      leadingWidth: 80,
      leading: TextButton(
        child: Text(
          "Cancel",
          style: TextStyle(
            fontSize: 18,
            color: ColorConst.blue,
          ),
        ),
        onPressed: () {
          NavigationService.pop();
        },
      ),
      centerTitle: true,
      title: Text(
        "Book an appointment",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorConst.black,
        ),
      ),
    );
