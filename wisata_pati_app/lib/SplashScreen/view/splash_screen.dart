import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/bloc/splash_screen_bloc.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenAuthenticated) {
            context
                .read<NavigatorBloc>()
                .add(NavigateToHalamanDuaTest(context));
          }
        },
        child: Center(
            child: FlutterLogo(
          size: 40,
        )),
      ),
    );
  }
}
