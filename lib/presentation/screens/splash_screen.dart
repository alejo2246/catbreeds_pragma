import 'package:catsbreeds_apg/presentation/screens/landing_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cat Breeds',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset(
              'assets/images/cat_splash.png',
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 115),
              child: LinearProgressIndicator(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
