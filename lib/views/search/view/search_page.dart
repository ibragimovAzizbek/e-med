import 'package:emed/core/base/base_view/base_view.dart';
import 'package:emed/core/components/home_body_comp/text_darck_60_90.dart';
import 'package:emed/core/constants/color_const.dart';
import 'package:emed/core/constants/font_const.dart';
import 'package:emed/core/functions/error_snak_bar.dart';
import 'package:emed/extension/mq_extension.dart';
import 'package:emed/views/search/cubit/search_cubit.dart';
import 'package:emed/views/search/state/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: SearchPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: BlocConsumer<SearchCubit, SearchState>(
                  listener: (context, state) {
                    if (state is SearchError) {
                      // ignore: void_checks
                      return showErrorSnackBar(
                          context, 'Qatra urinib ko\'ring ...');
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller:
                                  context.watch<SearchCubit>().searchController,
                              decoration: const InputDecoration(hintText: "Type what you want to search for ..."),
                              onChanged: (value) {
                                context
                                    .read<SearchCubit>()
                                    .searchOnChanged(value);
                              },
                            ),
                          ),
                          SizedBox(height: context.h * 0.03),
                          context.watch<SearchCubit>().doctorsSet.isEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(top: context.h * 0.2),
                                  child: Center(
                                    child: LottieBuilder.asset(
                                      'assets/anim/search.json',
                                    ),
                                  ),
                                )
                              : searchFullPage(context)
                        ],
                      );
                    } else {
                      return showErrorSnackBar(context, 'Qandaydir muammo bor');
                    }
                  },
                ),
              ),
            ),
          );
        });
  }

  Column searchFullPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.h * 0.68,
          width: context.w,
          child: ListView.builder(
            itemCount: context.watch<SearchCubit>().doctorsSet.toList().length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://source.unsplash.com/random/$index',
                      ),
                    ),
                    title: textDarck(
                      context.watch<SearchCubit>().doctorsSet.toList()[index]
                          ['name'],
                      context,
                      size: FontConst.kTextLargeFont,
                      color: ColorConst.darck90,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/infoDoctor',
                        arguments: BlocProvider.of<SearchCubit>(context)
                            .doctorsSet
                            .toList()[index]['id'],
                      );
                    },
                  ),
                  Divider(indent: context.w * 0.1)
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
