import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_event.dart';
import 'package:wisata_pati_app/detail/pages/screens/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBlocs>(
        create: (BuildContext context) =>
            DetailBlocs()..add(DetailLoadEvents()),
        child: MaterialApp(
          title: 'Persebaran UMKM',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const DetailPage(),
        ));
  }
}
