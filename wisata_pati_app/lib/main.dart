import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Navigation/NavigationBloc.dart';
import 'package:wisata_pati_app/Utill.dart';

import 'Navigation/Router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(Utill.navigatorKey),
        ),
        // Add other Bloc providers if needed
      ],
      child: MaterialApp(
        navigatorKey: Utill.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: '/my_home_page',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigationBloc.add(NavigateHalamanDuaTest(context));
              },
              child: Text('Go to Halaman Dua Test'),
            ),
            ElevatedButton(
              onPressed: () {
                navigationBloc.add(NavigateOut(context));
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
