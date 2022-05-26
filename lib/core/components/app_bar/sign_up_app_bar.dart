import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';

authAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: ColorConst.black,
      ),
    ),
  );
}
