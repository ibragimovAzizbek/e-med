import 'package:emed/core/constants/color_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/services/naigation/navigation_service.dart';
import 'package:flutter/material.dart';

infoAndAppointmentAppBar(index) => AppBar(
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
    );
