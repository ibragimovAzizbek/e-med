import 'package:emed/core/components/app_bar/sign_up_app_bar.dart';
import 'package:emed/core/functions/error_snak_bar.dart';
import 'package:emed/core/widgets/signIn/sign_in_view_widget.dart';
import 'package:emed/views/auth/cubit/auth_cubit.dart';
import 'package:emed/views/auth/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar('Sign In'),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showErrorSnackBar(context, "Another Error");
          }
        },
        builder: (context, state) {
          if (state is AuthInitial) {
            return SignInViewWidget();
          } else if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return showErrorSnackBar(context, "Another Error");
          }
        },
      ),
    );
  }
}
