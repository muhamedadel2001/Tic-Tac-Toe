import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_challenge/features/home/presentation/widgets/select_mode_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashSState();
}

class _SplashSState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SelectModeScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff323D5B),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/giphy.gif'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Flexible(
              child: Text(
                textAlign: TextAlign.center,
                'Tic-Tac-Toe',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            )
          ],
        ),
      ),
    );
  }
}
