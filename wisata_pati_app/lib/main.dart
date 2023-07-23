import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/parentTab/bloc/parent_tab_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/bloc/splash_screen_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/view/splash_screen.dart';
import 'package:wisata_pati_app/template/constant/const_style.dart';

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
        BlocProvider<ParentTabBloc>(create: (context) => ParentTabBloc()),
      ],
      child: MaterialApp(
        title: 'Wisata Pati',
        theme: ThemeData(
          primarySwatch: ConstStyle.darkGreySwatch,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
