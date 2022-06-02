import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

class SearchData extends StatelessWidget {
  String searchName;
  String route;
  SearchData({Key? key, required this.searchName, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          height: context.h * 0.05,
          width: context.w * 0.8,
          decoration: BoxDecoration(
            color: ColorConst.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.search),
              Text(searchName),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
