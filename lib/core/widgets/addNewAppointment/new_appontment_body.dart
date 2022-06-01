import 'package:emed/core/components/addAppointmentComp/appointment_comp.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/addNewAppointment/cubit/add_new_appointment_cubit.dart';
import 'package:emed/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewAppointmentBodyWidget extends StatelessWidget {
  const AddNewAppointmentBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          inpuDataName("Region", context),
          const SizedBox(height: 16),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              items: itemsregion,
              text: "Choose hospital region...",
              value: context.watch<AddNewAppointmentCubit>().regionValue,
              mode: 0,
            ),
          ),
          SizedBox(height: context.h * 0.024),
          inpuDataName('District', context),
          SizedBox(height: context.h * 0.024),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(context,
                items: context.watch<AddNewAppointmentCubit>().districtValue ==
                        "Toshkent shahri"
                    ? itemsdistrictT
                    : itemsdistrictTV,
                text: "Choose hospital district...",
                value: context.watch<AddNewAppointmentCubit>().districtValue,
                mode: 1),
          ),
          SizedBox(height: context.h * 0.024),
          inpuDataName('Hospital', context),
          SizedBox(height: context.h * 0.024),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              items: itemsHospital,
              text: "Choose doctor’s workplace...",
              value: context.watch<AddNewAppointmentCubit>().hospitalValue,
              mode: 2,
            ),
          ),
          SizedBox(height: context.h * 0.024),
          inpuDataName("Doctor's position", context),
          SizedBox(height: context.h * 0.024),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              value:
                  context.watch<AddNewAppointmentCubit>().doctorPositionValue,
              items: itemsPosition,
              text: "Choose doctor’s position...",
              mode: 3,
            ),
          ),
          SizedBox(height: context.h * 0.024),
          inpuDataName("The doctor", context),
          SizedBox(height: context.h * 0.024),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              value: context.watch<AddNewAppointmentCubit>().doctorValue,
              items: itemsDoctor,
              text: "Choose the doctor you want...",
              mode: 4,
            ),
          ),
          SizedBox(height: context.h * 0.024),
          inpuDataName("Service type", context),
          SizedBox(height: context.h * 0.024),
          inputDataMethodWithMenu(
            context,
            dropdownButton: changeStatus(
              context,
              value: context.watch<AddNewAppointmentCubit>().serviceValue,
              items: itemsService,
              text: "Choose doctor’s service type...",
              mode: 5,
            ),
          ),
          SizedBox(height: context.h * 0.024),
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
                  shoSnackBarInCalendar(context);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.9,
                  context.h * 0.073,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                // ! KAMCHILIKLARINI TO"LDIR
                BlocProvider.of<HomeCubit>(context).currentIndex = 2;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  shoSnackBarInCalendar(context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return const Text("Date Time enter");
        },
      );
}
