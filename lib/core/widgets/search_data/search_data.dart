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
          alignment: Alignment.center,
          height: context.h * 0.05,
          width: context.w * 0.8,
          decoration: BoxDecoration(
            color: ColorConst.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              SizedBox(width: context.w * 0.03),
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
