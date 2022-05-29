import 'package:emed/views/addNewAppointment/state/add_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewAppointmentCubit extends Cubit<AddNewAppointmentState> {
  AddNewAppointmentCubit() : super(AddNewAppointmentInitial());

  String? regionValue;
  String? districtValue;
  String? hospitalValue;
  String? doctorPositionValue;
  String? doctorValue;
  String? serviceValue;
  String? timeValue;

  int indexDistrict = 0;

  changeRegion(String region) {
    regionValue = region;
    emit(AddNewAppointmentInitial());
  }

  changeDistrict(String district) {
    districtValue = district;
    emit(AddNewAppointmentInitial());
  }

  changeHospital(String hospital) {
    hospitalValue = hospital;
    emit(AddNewAppointmentInitial());
  }

  changeDoctorPosition(String position) {
    doctorPositionValue = position;
    emit(AddNewAppointmentInitial());
  }

  changeDoctor(String doctor) {
    doctorValue = doctor;
    emit(AddNewAppointmentInitial());
  }

  changeService(String service) {
    serviceValue = service;
    emit(AddNewAppointmentInitial());
  }

  changeTime(String time) {
    timeValue = time;
    emit(AddNewAppointmentInitial());
  }
}
