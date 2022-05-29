import 'package:emed/core/components/app_bar/homeAppbar/home_app_bar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeViewWidget extends StatelessWidget {
  HomeViewWidget({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  // DateTime dropdownValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeAppBar,
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Today’s medications", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: context.h * 0.3),
          const Center(
            child: Text(
              "No medications",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: context.h * 0.02),
          const Center(
            child: Text(
              "They will appear here only when doctor\nadds them to your account.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: context.h * 0.25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text(
                  "Monthly appointments",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConst.grey,
                  ),
                ),
                onPressed: () {
                  context.read<HomeCubit>().changeIsViewAppointmentStatus();
                },
              ),
              SizedBox(width: context.w * 0.2),
              TextButton(
                child: const Text(
                  "May",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
              ),
              // DropdownButton(
              //   value: dropdownValue,
              //   icon: SvgPicture.asset('assets/icons/chevron_down.svg'),
              //   items: items,
              //   onChanged: (a) {},
              // ),
            ],
          ),
          context.watch<HomeCubit>().isViewAppointment
              ? viewAppoinments(context)
              : const SizedBox()
        ],
      ),
    );
  }

  Column viewAppoinments(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.h * 0.03),
        Center(
          child: SizedBox(
            width: context.w * 0.9,
            // height: context.h * 0.2,
            child: SfCalendar(
              cellEndPadding: 10,
              view: CalendarView.month,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text("Today’s medications", style: TextStyle(fontSize: 16)),
        ),
        SizedBox(height: context.h * 0.07),
        const Center(
          child: Text(
            "No appointments",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: context.h * 0.01),
        const Center(
          child: Text(
            "You haven’t added any appointment yet",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: context.h * 0.08),
        Center(
          child: ElevatedButton(
            child: Text("Add new appointment", style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
                primary: ColorConst.blue,
                fixedSize: Size(
                  context.w * 0.9,
                  context.h * 0.075,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              Navigator.pushNamed(context, '/addNewAppoinment');
            },
          ),
        ),
        SizedBox(height: context.h * 0.07)
      ],
    );
  }

  // List<String> moths = [
  //   "January",
  //   "February",
  //   "March",
  //   "April",
  //   "May",
  //   "June",
  //   "July",
  //   "August",
  //   "Setember",
  //   "Octobor",
  //   "November",
  //   "December"
  // ];

  // List<DropdownMenuItem<Widget>> items = const [
  //   DropdownMenuItem(child: Text("January")),
  //   DropdownMenuItem(child: Text("February")),
  //   DropdownMenuItem(child: Text("March")),
  //   DropdownMenuItem(child: Text("April")),
  //   DropdownMenuItem(child: Text("May")),
  //   DropdownMenuItem(child: Text("June")),
  //   DropdownMenuItem(child: Text("July")),
  //   DropdownMenuItem(child: Text("August")),
  //   DropdownMenuItem(child: Text("Setember")),
  //   DropdownMenuItem(child: Text("Octobor")),
  //   DropdownMenuItem(child: Text("November")),
  //   DropdownMenuItem(child: Text("December")),
  // ];

  Padding textInputName(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }
}
