import 'package:flutter/material.dart';
import 'package:votando/view/pages/login.dart';
import 'package:votando/view/pages/p_view/p_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login':(context)=>login(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch:Colors.blueGrey ,
        textTheme:TextTheme(
          subtitle1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.purple
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: p_view(),
    );
  }
}

