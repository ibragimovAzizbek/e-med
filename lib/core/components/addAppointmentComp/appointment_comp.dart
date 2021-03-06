import 'package:emed/core/constants/color_const.dart';
import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/addNewAppointment/cubit/add_new_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DropdownButton changeStatus(
  BuildContext context, {
  required value,
  required items,
  required int mode,
  required String text,
}) =>
    DropdownButton(
      hint: Text(text),
      value: value,
      borderRadius: BorderRadius.circular(12),
      items: items,
      onChanged: (status) {
        switch (mode) {
          case 0:
            context.read<AddNewAppointmentCubit>().changeRegion(status);
            break;
          case 1:
            context.read<AddNewAppointmentCubit>().changeDistrict(status);
            break;
          case 2:
            context.read<AddNewAppointmentCubit>().changeHospital(status);
            break;
          case 3:
            context.read<AddNewAppointmentCubit>().changeDoctorPosition(status);
            break;
          case 4:
            context.read<AddNewAppointmentCubit>().changeDoctor(status);
            break;
          case 5:
            context.read<AddNewAppointmentCubit>().changeService(status);
            break;
        }
      },
    );

Padding inpuDataName(String name, BuildContext context) => Padding(
      padding: EdgeInsets.only(left: context.w * 0.05),
      child: Text(name, style: const TextStyle(fontSize: 16)),
    );

Center inputDataMethodWithMenu(BuildContext context,
    {required DropdownButton dropdownButton}) {
  return Center(
    child: Container(
      padding: const EdgeInsets.only(left: 15, right: 10),
      width: context.w * 0.9,
      height: context.h * 0.075,
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.grey05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(child: dropdownButton),
    ),
  );
}

// ? -- -- -- -- -- -- -- -- -- -- -- -- -- items bottom

List<DropdownMenuItem<String>> itemsregion = [
  DropdownMenuItem(
    value: 'toshkent',
    child: Text(mockData['regions'][0]['region']),
  ),
  DropdownMenuItem(
    value: 'toshkentV',
    child: Text(mockData['regions'][1]['region']),
  ),
];

List<DropdownMenuItem<String>> itemsdistrictT = [
  DropdownMenuItem(
    value: mockData['regions'][0]['districts'][0],
    child: Text(mockData['regions'][0]['districts'][0]),
  ),
  DropdownMenuItem(
    value: mockData['regions'][0]['districts'][1],
    child: Text(mockData['regions'][0]['districts'][1]),
  ),
];

List<DropdownMenuItem<String>> itemsdistrictTV = [
  DropdownMenuItem(
    value: mockData['regions'][1]['districts'][0],
    child: Text(mockData['regions'][1]['districts'][0]),
  ),
  DropdownMenuItem(
    value: mockData['regions'][1]['districts'][1],
    child: Text(mockData['regions'][1]['districts'][1]),
  ),
];

List<DropdownMenuItem<String>> itemsHospital = const [
  DropdownMenuItem(
    value: 'central',
    child: Text("Central hospital"),
  ),
  DropdownMenuItem(
    value: "child",
    child: Text("Child Hospital"),
  ),
];

List<DropdownMenuItem<String>> itemsPosition = const [
  DropdownMenuItem(
    value: 'derotolog',
    child: Text("Dermotolog"),
  ),
  DropdownMenuItem(
    value: "nurse",
    child: Text("Nurse"),
  ),
];

List<DropdownMenuItem<String>> itemsDoctor = const [
  DropdownMenuItem(
    value: 'ali',
    child: Text("Ali"),
  ),
  DropdownMenuItem(
    value: "vali",
    child: Text("Vali"),
  ),
];

List<DropdownMenuItem> itemsService = const [
  DropdownMenuItem(
    value: 'concultation',
    child: Text("Concultation\n30 minutes"),
  ),
  DropdownMenuItem(
    value: 'coolService',
    child: Text("Some cool service\n1 hour"),
  ),
  DropdownMenuItem(
    value: 'coolAnother',
    child: Text("Another cool service\n40 minutes"),
  ),
];
