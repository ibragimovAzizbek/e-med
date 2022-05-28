import 'package:emed/views/addNewAppointment/state/add_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAppointmentCubit extends Cubit<AddNewAppointmentState> {
  AddNewAppointmentCubit() : super(AddNewAppointmentInitial());
}
