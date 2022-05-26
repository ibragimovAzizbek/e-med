import 'package:emed/views/auth/state/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController nameConrtoller = TextEditingController();
  TextEditingController phonrNumberConrtoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isHidden = true;

  changeHiddenPass() {
    isHidden = !isHidden;
    emit(AuthInitial());
  }
}
