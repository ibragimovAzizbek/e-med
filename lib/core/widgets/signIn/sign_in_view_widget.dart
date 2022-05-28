import 'package:emed/core/constants/color_const.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewWidget extends StatelessWidget {
  SignInViewWidget({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(),
          const Center(
            child: Text(
              "Log in to your account",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: context.h * 0.05),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInputName("Phone number"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller:
                        context.watch<AuthCubit>().phonrNumberConrtoller,
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
                SizedBox(height: context.h * 0.045),
                textInputName("Young password"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: context.watch<AuthCubit>().passwordController,
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
                      hintText: "Enter your password...",
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
          SizedBox(height: context.h * 0.06),
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
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
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
