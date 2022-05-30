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

  List<Tab> tabs = [
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
      body: TabBarView(controller: _tabController, children: [
        currentTreatment(context),
        Container(
          height: 60,
          width: 300,
          color: ColorConst.blue,
        ),
        Container(
          height: 60,
          width: 300,
          color: ColorConst.black,
        ),
      ]),
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
                    doctorsInfoText(position[index], FontConst.kTextLargeFont,
                        fontWeight: FontWeight.bold),
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
              const Divider(indent: 20),
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
