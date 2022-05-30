import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

Padding textDarck(
  text,
  BuildContext context, {
  required double size,
  required Color color,
  fontWeight = FontWeight.normal,
}) {
  return Padding(
    padding: EdgeInsets.only(left: context.w * 0.06),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    ),
  );
}
