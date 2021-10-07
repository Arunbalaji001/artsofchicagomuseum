import 'package:artsofchicagomuseum/providers/appdataprovider.dart';
import 'package:artsofchicagomuseum/screens/detail_page/detail_page.dart';
import 'package:artsofchicagomuseum/screens/list_page/list_page.dart';
import 'package:artsofchicagomuseum/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => appdataprovider(),
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash': (context) =>  SplashPage(),
        'home':(context)=>ListPage(),
      },
      title: 'Arts of Chicago Museum',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute:'splash',
      // home: ListPage(),
    );
  }
}

