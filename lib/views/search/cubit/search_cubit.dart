import 'package:emed/data/mock/regions_district/mock_data.dart';
import 'package:emed/views/search/state/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  TextEditingController searchController = TextEditingController();
  Set<Map> doctorsSet = {};
  SearchCubit() : super(SearchInitial());

  searchOnChanged(String value) {
    doctorsSet.clear();
    for (var i = 0; i < doctors.length; i++) {
      if (value.isEmpty) {
        doctorsSet.clear();
      } else if (doctors[i]
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        doctorsSet.add({"id": i, "name": doctors[i], "position": position[i]});
      }
      // value.toLowerCase() == doctors[i].toLowerCase()) {
      // doctorsSet.add({"id": i, 'name': doctors[i], 'position': position[i]});
    }
    debugPrint("SETTTTT: !!!  $doctorsSet.toString()");
    emit(SearchInitial());
  }
}
