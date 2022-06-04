import 'package:emed/views/profile/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfile());
  int tabIndex = 0;
  int selected = 0;
  bool checkTable = false;
  int gender = 0;
  bool profileVisibility = false;
  TextEditingController nameController =
      TextEditingController(text: "Bobur Mavlonov");
  TextEditingController dataBirhtController =
      TextEditingController(text: "24.11.2000");
  TextEditingController addressController =
      TextEditingController(text: "TAshkent city Shayhontohur district");
  TextEditingController phonenumberController =
      TextEditingController(text: "+998");
  TextEditingController emailController =
      TextEditingController(text: "bobur@gmail.com");

  TextEditingController nameConroller = TextEditingController();
  TextEditingController phoneNumberConroller = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();

  changeProfileVis() {
    profileVisibility = !profileVisibility;
    emit(InitialProfile());
  }

  selectGender(index) {
    gender = index;
    emit(InitialProfile());
  }

  changeTab(index) {
    tabIndex = index;
    emit(InitialProfile());
  }

  checkingTable() {
    checkTable = !checkTable;
    emit(InitialProfile());
  }

  changePage(index) {
    selected = index;
    emit(InitialProfile());
  }
}
