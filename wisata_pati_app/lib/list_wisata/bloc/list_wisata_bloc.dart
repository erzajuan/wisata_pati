import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';
import 'package:wisata_pati_app/detail/services/fetch.dart';

import 'list_wisata_event.dart';
import 'list_wisata_state.dart';

class ListWisataBlocs extends Bloc<ListWisataEvents, ListWisataState> {
  ListWisataBlocs() : super(ListWisataLoadingState()) {
    List<Datum>? data = [];

    on<ListWisataLoadEvents>((event, emit) async {
      data = await DetailFetch().readJson();
      emit(ListWisataLoadingState());
      try {
        emit(ListWisataLoadedState(data));
      } catch (e) {
        emit(ListWisataErrorState(e.toString()));
      }
    });
  }
}
