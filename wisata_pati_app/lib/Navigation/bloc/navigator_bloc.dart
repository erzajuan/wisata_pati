import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wisata_pati_app/Home/bloc/home_bloc.dart';
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
              //placeholder
              BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc()..add(HomeClicked())),
            ],
            child: ParentTabScreen(),
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
              //placeholder
              BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc()..add(HomeClicked())),
            ],
            child: VirtualScreen(),
          ),
        ),
      );
    });
  }
}
