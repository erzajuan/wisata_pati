import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wisata_pati_app/Home/service/home_service.dart';
import 'package:wisata_pati_app/detail/model/datum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeClicked>((event, emit) async {
      emit(HomeLoadInProgress());
      final List<Datum>? data = await HomeService().readJson();
      try {
        emit(HomeLoadSuccess(data ?? []));
      } catch (e) {
        emit(const HomeLoadFailure("Server sedang error"));
      }
    });
  }
}
