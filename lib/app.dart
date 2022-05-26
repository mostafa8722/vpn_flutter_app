import 'package:flutter/material.dart';
import 'package:vpn_flutter_app/screens/splash/splash_screen.dart';

 class App extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: SplashScreen(),
    );
  }
 }