import 'package:flutter/material.dart';
import 'package:wisata_pati_app/detail/pages/screens/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DetailPage(
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris porta arcu eget ultricies molestie. Aenean in fermentum nulla.',
          destinationName: 'Wisata curug',
          location: "Pati, Jawa Tengah",
          imageUrl: 'https://www.wisataidn.com/tempat-wisata-di-pati/',
        ));
  }
}
