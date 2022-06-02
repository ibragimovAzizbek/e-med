import 'package:emed/core/components/app_bar/homeAppbar/home_app_bar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/widgets/search_data/search_data.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:flutter/material.dart';

class HomeDoctorBody extends StatelessWidget {
  const HomeDoctorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeAppBarNotNotification,
          SearchData(
            searchName: "Search doctors by name or position",
            route: '/searchDoctor',
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(left: context.w * 0.07),
            child: Text(
              "Recommended doctors for you",
              style: TextStyle(color: ColorConst.bottomLabel),
            ),
          ),
          SizedBox(
            height: context.h * 0.87,
            width: context.w,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/$index',
                        ),
                      ),
                      title: Text(doctors[index]),
                      subtitle: Text(position[index]),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/infoDoctor',
                          arguments: index,
                        );
                      },
                    ),
                    Divider(indent: context.w * 0.13, endIndent: 5),
                  ],
                );
              },
              itemCount: doctors.length,
            ),
          )
        ],
      ),
    );
  }
}
