import 'package:emed/core/components/app_bar/sign_up_app_bar.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/auth/cubit/auth_cubit.dart';
import 'package:emed/views/auth/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: signUpAppBar,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AuthInitial) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Divider(),
                    const Center(
                      child: Text(
                        "Sign up in order to get a full access to the\nsystem",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textInputName("Full name"),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller:
                                  context.watch<AuthCubit>().nameConrtoller,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter your full name...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return "Enter your name";
                                }
                              },
                            ),
                          ),
                          textInputName("Phone number"),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller: context
                                  .watch<AuthCubit>()
                                  .phonrNumberConrtoller,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Enter your phone number...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              validator: (number) {
                                if (number!.isEmpty) {
                                  return "Enter your name";
                                }
                              },
                            ),
                          ),
                          const Center(
                            child: Text(
                              "We will send confirmation code to this number",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: context.h * 0.045),
                          textInputName("Create password"),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(
                              controller:
                                  context.watch<AuthCubit>().passwordController,
                              obscureText: context.watch<AuthCubit>().isHidden,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    context.watch<AuthCubit>().isHidden
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<AuthCubit>(context)
                                        .changeHiddenPass();
                                  },
                                ),
                                hintText: "Create your new password...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              validator: (pass) {
                                if (pass!.isEmpty) {
                                  return "Enter new password";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ColorConst.blue,
                          fixedSize: Size(
                            context.w * 0.9,
                            context.h * 0.075,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: ColorConst.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/checkPhoneNumber');
                        }
                      },
                    ),
                  ],
                ),
              );
            } else if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is AuthError) {
              return showErrorSnackBar(context, "AuthError, try again");
            } else {
              return showErrorSnackBar(context, "Another Error");
            }
          },
        ),
      ),
    );
  }

  showErrorSnackBar(context, String msg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $msg")));
  }

  Padding textInputName(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }
}
