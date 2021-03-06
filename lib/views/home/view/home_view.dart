// ignore_for_file: must_be_immutable

import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/functions/error_snak_bar.dart';
import 'package:emed/core/widgets/homeView/doctor/home_doctor_body.dart';
import 'package:emed/core/widgets/homeView/hospital/home_hospital_body.dart';
import 'package:emed/core/widgets/homeView/home/home_view_widget.dart';
import 'package:emed/core/widgets/homeView/treatments/treaments_body_view.dart';
import 'package:emed/views/home/cubit/home_cubit.dart';
import 'package:emed/views/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List<Widget> bodys = [
    HomeViewBodyWidget(),
    TreamentsBodyView(),
    const HomeDoctorBody(),
    const HomeHospetalBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: HomeView,
        onPageBuilder: (context, widget) {
          return Scaffold(
            body: SafeArea(
              child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeError) {
                    showErrorSnackBar(context, "Another Error");
                  }
                },
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return bodys[context.watch<HomeCubit>().currentIndex];
                  } else if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return showErrorSnackBar(context, "Another Error");
                  }
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: ColorConst.bottomLabel,
              currentIndex: context.watch<HomeCubit>().currentIndex,
              backgroundColor: ColorConst.bottomBackGround,
              items: itemsButton(context),
              onTap: (index) {
                context.read<HomeCubit>().changePageHome(index);
              },
            ),
          );
        });
  }

  itemsButton(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: "Home",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 0
              ? 'assets/icons/home.svg'
              : 'assets/icons/home_blue.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: "Treatments",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 1
              ? 'assets/icons/syringe.svg'
              : "assets/icons/syringe_blue.svg",
        ),
      ),
      BottomNavigationBarItem(
        label: "Doctors",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 2
              ? 'assets/icons/doctor.svg'
              : 'assets/icons/doctor_blue.svg',
        ),
      ),
      BottomNavigationBarItem(
        label: "Hospitals",
        icon: SvgPicture.asset(
          context.watch<HomeCubit>().currentIndex != 3
              ? 'assets/icons/hospital.svg'
              : 'assets/icons/hospital_blue.svg',
        ),
      ),
    ];
    return items;
  }
}
