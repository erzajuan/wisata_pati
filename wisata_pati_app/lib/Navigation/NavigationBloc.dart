import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigatorAction {
  BuildContext? context;
  var data;
}

class NavigateOut extends NavigatorAction {
  NavigateOut(BuildContext? _context) {
    context = _context;
  }
}

class NavigateHalamanDuaTest extends NavigatorAction {
  NavigateHalamanDuaTest(BuildContext? _context) {
    context = _context;
  }
}

class NavigationBloc extends Bloc<NavigatorAction, dynamic> {
  NavigationBloc(this.navigatorKey) : super(null);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Stream<dynamic> mapEventToState(NavigatorAction event) async* {
    if (event is NavigateOut) {
      Navigator.pop(event.context!);
    } else if (event is NavigateHalamanDuaTest) {
      Navigator.pushNamed(event.context!, '/halaman_dua_test');
    }
  }
}
