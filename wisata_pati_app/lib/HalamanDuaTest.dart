import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Navigation/bloc/navigator_bloc.dart';

class HalamanDuaTest extends StatelessWidget {
  const HalamanDuaTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("INI BAPAK BUDI"),
        ),
        body: Column(
          children: [
            const Text("INI BAPAK BUDI"),
            ElevatedButton(
                onPressed: () {
                  context.read<NavigatorBloc>().add(NavigatePop(context));
                },
                child: const Text("tes Tombol BACK"))
          ],
        ));
  }
}
