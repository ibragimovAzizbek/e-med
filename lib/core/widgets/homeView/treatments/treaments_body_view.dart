// ignore_for_file: must_be_immutable

import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TreamentsBodyView extends StatefulWidget {
  TreamentsBodyView({Key? key}) : super(key: key);

  List<String> tabNames = [
    "Current tretment",
    "Medical history",
    "Drug history"
  ];

  @override
  State<TreamentsBodyView> createState() => _TreamentsBodyViewState();
}

class _TreamentsBodyViewState extends State<TreamentsBodyView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> tabs = const [
    Tab(
      icon: Text(
        "Current treatment",
        style: TextStyle(fontSize: 13),
      ),
    ),
    Tab(
      icon: Text(
        "Medical history",
        style: TextStyle(fontSize: 13),
      ),
    ),
    Tab(
      icon: Text(
        "Drug history",
        style: TextStyle(fontSize: 13),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/profile.png'),
        ),
        title: SvgPicture.asset("assets/icons/home_app_bar_icon.svg"),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/notifications.svg'),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
          labelColor: ColorConst.blue,
          unselectedLabelColor: ColorConst.darck60,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          currentTreatment(context),
          medicalHistory(context),
          SizedBox(
            height: context.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: drugs.length,
              itemBuilder: (context, index) {
                return SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }

  

  // ? ListView with builder history

  SizedBox medicalHistory(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return historyMedicalBody(context, index);
        },
      ),
    );
  }

  // * history mold basic

  Padding historyMedicalBody(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textDarck(
                  "Anthrax [Bacillus anthracis Infection]",
                  context,
                  size: FontConst.kTextLargeFont,
                  color: ColorConst.darck90,
                  fontWeight: FontWeight.bold,
                ),
                const Icon(
                  Icons.chevron_right_outlined,
                  size: 27,
                )
              ],
            ),
            SizedBox(height: context.h * 0.01),
            textDarck(
              doctors[index],
              context,
              size: FontConst.kTextLargeFont,
              color: ColorConst.darck90,
            ),
            SizedBox(height: context.h * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textDarck(
                  "Clinic Medion",
                  context,
                ),
                Padding(
                  padding: EdgeInsets.only(right: context.w * 0.03),
                  child: textDarck(
                    "25.06.2022",
                    context,
                  ),
                ),
              ],
            ),
            Divider(indent: context.w * 0.068, thickness: 1.5),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/infoDoctor', arguments: index);
        },
      ),
    );
  }

  SizedBox currentTreatment(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.w,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    doctorsInfoText(
                      position[index],
                      FontConst.kTextLargeFont,
                      fontWeight: FontWeight.bold,
                    ),
                    doctorsInfoText(doctors[index], FontConst.kMediumFont),
                    doctorsInfoText("Family Clinic №42", FontConst.kSmallFont),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/treatDetalis',
                    arguments: index,
                  );
                },
              ),
              const SizedBox(height: 5),
              const Divider(indent: 20, thickness: 1.5),
              SizedBox(height: FontConst.kExtraSmallFont),
            ],
          );
        },
        itemCount: doctors.length,
      ),
    );
  }

  Text doctorsInfoText(String text, double size,
      {fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
