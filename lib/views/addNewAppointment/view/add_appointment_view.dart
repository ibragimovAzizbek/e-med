import 'package:emed/core/components/app_bar/addNewAppointment/add_appointment_appbar.dart';
import 'package:emed/core/widgets/addNewAppointment/new_appontment_body.dart';
import 'package:emed/views/addNewAppointment/cubit/add_new_appointment_cubit.dart';
import 'package:emed/views/addNewAppointment/state/add_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAppointmentView extends StatelessWidget {
  const AddNewAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addNewAppointmentAppBar,
      body: BlocConsumer<AddNewAppointmentCubit, AddNewAppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AddNewAppointmentInitial) {
            return AddNewAppointmentBodyWidget();
          } else if (state is AddNewAppointmentLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else {
            return const Center(child: Text("NIMADIR XATO"));
          }
        },
      ),
    );
  }
}
