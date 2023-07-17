
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/HalamanDuaTest.dart';

import '../main.dart';

const String myHomePage = '/my_home_page';
const String halamanDuaTest = '/halaman_dua_test';


class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case myHomePage:
      //   return MaterialPageRoute(
      //     builder: (context) => MultiBlocProvider(providers: const [
      //       // BlocProvider<DashboardBloc>(
      //       //   create: (context) {
      //       //     return DashboardBloc(GetProgress());
      //       //   },
      //       // ),
      //     ], child: MyHomePage()),
      //   );
      case myHomePage: //HALAMAN DETAIL IMAGE CLICKED
        return MaterialPageRoute(
          builder: (context) =>
              MyHomePage(),
        );
      case halamanDuaTest: //HALAMAN DETAIL IMAGE CLICKED
        return MaterialPageRoute(
          builder: (context) =>
              const HalamanDuaTest(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text(
                      'No route defined for ${settings.name}')) /*Container()*/,
            ));
    }
  }
}
