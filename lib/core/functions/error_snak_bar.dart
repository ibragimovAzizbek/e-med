import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';

showErrorSnackBar(context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorConst.red,
      content: Text("Error: $msg"),
    ),
  );
}
