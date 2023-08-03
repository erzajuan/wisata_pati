import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/SplashScreen/bloc/splash_screen_bloc.dart';
import 'package:wisata_pati_app/Template/constant/const_style.dart';
import 'package:wisata_pati_app/Template/view/spacer.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenAuthenticated) {
            context.read<NavigatorBloc>().add(NavigateToParentTab(context));
          }
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/images/splash_bg.png",
              width: ConstStyle.widthOfDevice(context),
              height: ConstStyle.heightOfDevice(context),
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VSpacer(60),
                  Text(
                    "AR\nWISATA PATI",
                    textAlign: TextAlign.center,
                    style: ConstStyle.whiteTextStyle(
                        fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  const VSpacer(80),
                  Image.asset(
                    "assets/images/logo_pati.png",
                    width: 308,
                  ),
                  const Spacer(),
                  Text(
                    "Powered by dinas pariwisata dan olahraga",
                    style: ConstStyle.whiteTextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const VSpacer(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
