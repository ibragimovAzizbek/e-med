import 'package:emed/views/auth/view/check_phone_number_view.dart';
import 'package:emed/views/auth/view/personal_id_view.dart';
import 'package:emed/views/auth/view/sign_in_view.dart';
import 'package:emed/views/auth/view/sign_in_or_register.dart';
import 'package:emed/views/auth/view/sign_up_view.dart';
import 'package:emed/views/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteController {
  static final RouteController _inheretence = RouteController._init();

  static RouteController get inherentce => _inheretence;

  RouteController._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => SplashPage());

      case '/signInOrRegister':
        return MaterialPageRoute(builder: (context) => SignInOrRegister());

      case '/signIn':
        return MaterialPageRoute(builder: (context) => SignInView());

      case '/signUp':
        return MaterialPageRoute(builder: (context) => SignUpView());

      case '/checkPhoneNumber':
        return MaterialPageRoute(builder: (context) => CheckPhoneNumber());

      case '/personalId':
        return MaterialPageRoute(builder: (context) => PersonalId());
    }
  }
}
