import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration:  Duration(seconds: 2),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    controller.forward();
    Timer(
       Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MyHome()),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              "assets/—Pngtree—modern camera and movie logo_4814458.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover, 
            ),
          ),
        ),
      ),
    );
  }
}
