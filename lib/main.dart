import 'package:flutter/material.dart';
import 'package:movie/controller/provider.dart';
import 'package:movie/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: SplashScreen(),
  debugShowCheckedModeBanner: false,
    );
  }
}