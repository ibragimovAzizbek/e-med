import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAppointment extends StatelessWidget {
  const AddNewAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return Text("data");
      },
    );
  }
}
