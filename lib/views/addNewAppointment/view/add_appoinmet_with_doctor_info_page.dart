// ignore_for_file: must_be_immutable

import 'package:emed/core/components/addAppointmentComp/appointment_comp.dart';
import 'package:emed/core/components/app_bar/info_and_appointment_appbar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/addNewAppointment/cubit/add_new_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewAppointmentPageDoctor extends StatelessWidget {
  int index;
  AddNewAppointmentPageDoctor({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAndAppointmentAppBar(index),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          SizedBox(height: context.h * 0.03),
          Padding(
            padding: EdgeInsets.only(
                left: context.w * 0.06, bottom: context.w * 0.1),
            child: Text(
              "Appointment to:",
              style: TextStyle(
                fontSize: 18,
                color: ColorConst.darck60,
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(
                "https://source.unsplash.com/random/$index",
              ),
            ),
            title: Text(
              doctors[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              position[index] + ", Pediatric hospital №${index + 1}",
              style: TextStyle(
                color: ColorConst.darck60,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: context.h * 0.02),
          Divider(
            indent: context.w * 0.02,
            endIndent: context.h * 0.01,
            thickness: 1,
          ),
          SizedBox(height: context.h * 0.03),
          inpuDataName("Service type", context),
          SizedBox(height: context.h * 0.02),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              value: context.watch<AddNewAppointmentCubit>().serviceValue,
              items: itemsService,
              mode: 5,
              text: "Choose doctor’s service type...",
            ),
          ),
          SizedBox(height: context.h * 0.03),
          inpuDataName("Enter the time", context),
          SizedBox(height: context.h * 0.02),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 10),
              width: context.w * 0.9,
              height: context.h * 0.075,
              decoration: BoxDecoration(
                border: Border.all(color: ColorConst.grey05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading:
                    SvgPicture.asset('assets/icons/calendar.svg', width: 20),
                title: const Text("DD.MM.YYYY/ HH:MM"),
                trailing: SvgPicture.asset(
                  'assets/icons/arrow_drop_down.svg',
                  width: 25,
                ),
                onTap: () {
                  // showDateTimeInput(context);
                },
              ),
            ),
          ),
          SizedBox(height: context.h * 0.1),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ColorConst.blue,
                  fixedSize: Size(
                    context.w * 0.9,
                    context.h * 0.073,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        title: Column(
                          children: [
                            SvgPicture.asset('assets/icons/Union.svg'),
                            SizedBox(height: context.h * 0.03),
                            const Text(
                              "You have successfully booked\n an appointment",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: context.h * 0.03),
                            Text(
                              "You can go to ${doctors[index]}\non May 30 at 10:00 - 11: 00",
                              style: TextStyle(
                                  color: ColorConst.darck60, fontSize: 14),
                            ),
                            SizedBox(height: context.h * 0.03),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ColorConst.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  fixedSize:
                                      Size(context.w * 0.9, context.h * 0.073),
                                ),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/home', (route) => false);
                                },
                                child: const Text(
                                  "Go home",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // showDateTimeInput(context) {
  //   return ScaffoldMessenger.of(context).
  // }
}
