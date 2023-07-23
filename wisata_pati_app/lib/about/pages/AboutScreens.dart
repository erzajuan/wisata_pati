import 'package:flutter/material.dart';
import 'package:wisata_pati_app/Template/constant/const_style.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';

import '../../Template/view/spacer.dart';

class AboutScreens extends StatelessWidget {
  const AboutScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

           children: [
             const VSpacer(16),
             Text("Tentang", style: ConstStyle.blackTextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
             const VSpacer(16),
              Text("lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsumlorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsum",style: ConstStyle.blackTextStyle(),),
           ],
          ),
        ),
      )
    );
  }
}
