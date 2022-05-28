import 'package:emed/views/home/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;

  bool isViewAppointment = false;

  changePageHome(index) {
    currentIndex = index;
    emit(HomeInitial());
  }

  changeIsViewAppointmentStatus() {
    isViewAppointment = !isViewAppointment;
    emit(HomeInitial());
  }
}
