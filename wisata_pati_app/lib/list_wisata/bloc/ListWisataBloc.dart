import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';
import 'package:wisata_pati_app/detail/services/fetch.dart';

import 'ListWisataEvent.dart';
import 'ListWisataState.dart';

class ListWisataBlocs extends Bloc<ListWisataEvents, ListWisataState> {
  ListWisataBlocs() : super(ListWisataLoadingState()) {
    List<Datum>? data = [];

    on<ListWisataLoadEvents>((event, emit) async {
      debugPrint("DetailLoadEvents");
      data = await DetailFetch().readJson();
      emit(ListWisataLoadingState());
      try {
        debugPrint("AppLoadedState");
        emit(ListWisataLoadedState(data));
      } catch (e) {
        emit(ListWisataErrorState(e.toString()));
      }
    });
  }
}
