import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/HalamanDuaTest.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/bloc/splash_screen_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/view/splash_screen.dart';

import 'list_wisata/Pages/Screens/ListWisataScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashScreenBloc>(
          create: (context) => SplashScreenBloc()..add(SplashScreenStarted()),
        ),
        BlocProvider<NavigatorBloc>(create: (context) => NavigatorBloc()),
      ],
      child: MaterialApp(
        title: 'Infinide',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
