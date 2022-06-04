import 'package:emed/core/constants/font_const.dart';
import 'package:flutter/material.dart';

textBeforeInput(text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: FontConst.kMediumFont,
        ),
      ),
    );
