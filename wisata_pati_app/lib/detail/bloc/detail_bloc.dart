import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_event.dart';
import 'package:wisata_pati_app/detail/bloc/detail_state.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';
import 'package:wisata_pati_app/detail/services/fetch.dart';

class DetailBlocs extends Bloc<DetailEvents, DetailState> {
  DetailBlocs() : super(DetailLoadingState()) {
    List<Datum>? data = [];

    on<DetailLoadEvents>((event, emit) async {
      debugPrint("DetailLoadEvents");
      data = await DetailFetch().readJson();
      emit(DetailLoadingState());
      try {
        debugPrint("AppLoadedState");
        emit(DetailLoadedState(data));
      } catch (e) {
        emit(DetailErrorState(e.toString()));
      }
    });
  }
}
