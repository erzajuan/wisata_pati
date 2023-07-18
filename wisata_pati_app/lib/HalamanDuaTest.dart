import 'package:flutter/material.dart';

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
                  Navigator.pop(context);
                },
                child: const Text("tes Tombol BACK"))
          ],
        ));
  }
}
