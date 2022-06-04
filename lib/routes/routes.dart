import 'package:emed/core/widgets/homeView/hospital/hospital_info_page.dart';
import 'package:emed/core/widgets/search_data/search_data.dart';
import 'package:emed/views/addNewAppointment/view/add_appoinmet_with_doctor_info_page.dart';
import 'package:emed/views/addNewAppointment/view/add_appointment_view.dart';
import 'package:emed/views/auth/view/signUp/check_phone_number_view.dart';
import 'package:emed/views/auth/view/signUp/personal_id_view.dart';
import 'package:emed/views/auth/view/sign_in/sign_in_view.dart';
import 'package:emed/views/auth/view/sign_in_or_register.dart';
import 'package:emed/views/auth/view/signUp/sign_up_view.dart';
import 'package:emed/views/home/view/home_view.dart';
import 'package:emed/views/infoDoctor/view/info_doctor_view.dart';
import 'package:emed/views/info_drugs/info_drugs_page.dart';
import 'package:emed/views/search/view/search_page.dart';
import 'package:emed/views/splash/splash_page.dart';
import 'package:emed/views/traetments/treatments_detalis_page.dart';
import 'package:flutter/material.dart';

class RouteController {
  static final RouteController _inheretence = RouteController._init();

  static RouteController get inherentce => _inheretence;

  RouteController._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashPage());

      case '/signInOrRegister':
        return MaterialPageRoute(
            builder: (context) => const SignInOrRegister());

      case '/signIn':
        return MaterialPageRoute(builder: (context) => const SignInView());

      case '/signUp':
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case '/checkPhoneNumber':
        return MaterialPageRoute(
            builder: (context) => const CheckPhoneNumber());

      case '/personalId':
        return MaterialPageRoute(builder: (context) => const PersonalId());

      case '/home':
        return MaterialPageRoute(builder: (context) => HomeView());

      case '/addNewAppoinment':
        return MaterialPageRoute(
            builder: (context) => const AddNewAppointmentView());

      case '/infoDoctor':
        return MaterialPageRoute(
          builder: (context) => InfoDoctorView(
            index: (args as int),
          ),
        );

      case '/addappointmetthedoctor':
        return MaterialPageRoute(
          builder: (context) => AddNewAppointmentPageDoctor(
            index: args as int,
          ),
        );

      case '/treatDetalis':
        return MaterialPageRoute(
          builder: (context) => TreanmentDetalisPage(
            indexDoctor: args as int,
          ),
        );

      case '/searchPage':
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );

      case '/infoHospital':
        return MaterialPageRoute(
          builder: (context) => const HospitalInfo(),
        );

      case '/infoDrug':
        return MaterialPageRoute(
            builder: (context) => InfoDrugPage(index: args as int));
    }
    return null;
  }
}
