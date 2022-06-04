import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

Padding textModal(BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: context.w * 0.25, vertical: context.h * 0.02),
    child: Text(
      text,
      style: TextStyle(
        fontSize: FontConst.kLargeFont,
        fontWeight: FontWeight.w600,
        color: ColorConst.blue,
      ),
    ),
  );
}
