import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Home/bloc/home_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_event.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';
import 'package:wisata_pati_app/list_wisata/Pages/Screens/list_wisata_screens.dart';

import '../../detail/pages/screens/detail_page.dart';
import '../../list_wisata/bloc/list_wisata_bloc.dart';
import 'package:wisata_pati_app/ParentTab/view/parent_tab_screen.dart';
import 'package:wisata_pati_app/virtual/view/virtual_screen.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(NavigatorInitial()) {
    on<NavigatePop>((event, emit) {
      Navigator.pop(event.context, event.returns);
    });
    on<NavigateToParentTab>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ListWisataBlocs>(
                  create: (context) => ListWisataBlocs()),
            ],
            child: const ParentTabScreen(),
          ),
        ),
      );
    });
    on<NavigateToVirtual>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc()..add(HomeClicked())),
            ],
            child: VirtualScreen(
              data: event.data,
            ),
          ),
        ),
      );
    });
    on<NavigateToHome>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ListWisataBlocs>(
                  create: (context) => ListWisataBlocs()),
            ],
            child: const ListWisataScreens(),
          ),
        ),
      );
    });

    on<NavigateToDetailWisata>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<DetailBlocs>(
                  create: (context) => DetailBlocs()..add(DetailLoadEvents())),
            ],
            child: DetailPage(
              index: event.index,
            ),
          ),
        ),
      );
    });
  }
}
