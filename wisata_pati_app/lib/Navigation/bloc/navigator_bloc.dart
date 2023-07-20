import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wisata_pati_app/HalamanDuaTest.dart';
import 'package:wisata_pati_app/detail/bloc/detail_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_event.dart';
import 'package:wisata_pati_app/list_wisata/Pages/Screens/ListWisataScreens.dart';

import '../../detail/pages/screens/detail_page.dart';
import '../../list_wisata/bloc/ListWisataBloc.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(NavigatorInitial()) {
    on<NavigatePop>((event, emit) {
      Navigator.pop(event.context, event.returns);
    });
    on<NavigateToHalamanDuaTest>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              //placeholder
              BlocProvider<NavigatorBloc>(create: (context) => NavigatorBloc()),
            ],
            child: const HalamanDuaTest(),
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
              //placeholder
              BlocProvider<ListWisataBlocs>(create: (context) => ListWisataBlocs()),
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
              //placeholder
              BlocProvider<DetailBlocs>(create: (context) => DetailBlocs()..add(DetailLoadEvents())),
            ],
            child: DetailPage(index: event.index,),
          ),
        ),
      );
    });
  }
}
