import 'package:emed/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

get homeAppBar => AppBar(
      iconTheme: IconThemeData(color: ColorConst.black),
      leading: IconButton(
        icon: CircleAvatar(
          radius: 15,
          backgroundColor: ColorConst.grey05,
          child: Icon(
            Icons.person,
            size: 26,
            color: ColorConst.grey05,
          ),
        ),
        onPressed: () {
          // ! Person Icon pressed
        },
      ),
      centerTitle: true,
      title: SvgPicture.asset('assets/icons/home_app_bar_icon.svg'),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/notifications.svg',
            fit: BoxFit.cover,
          ),
          onPressed: () {},
        )
      ],
    );

get homeAppBarNotNotification => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Image.asset('assets/images/profile.png'),
            onPressed: () {},
          ),
          SvgPicture.asset('assets/icons/home_app_bar_icon.svg'),
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter.svg'),
            onPressed: () {},
          ),
        ],
      ),
    );
