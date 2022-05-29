import 'package:emed/views/infoDoctor/state/info_doctor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoDoctorCubit extends Cubit<InfoDoctorState> {
  InfoDoctorCubit() : super(InfoDoctorInitial());

  int? starIndex;
  changeIndex(index) {
    starIndex = index;
    emit(InfoDoctorInitial());
  }
}
