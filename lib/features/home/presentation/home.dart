import 'package:flutter/material.dart';
import 'package:game_challenge/core/utilits/const.dart';
import 'package:game_challenge/features/home/manager/home_cubit.dart';
import 'package:game_challenge/features/home/presentation/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  final String mode;
  const HomeScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff323D5B),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            playerOne.clear();
            playerTwo.clear();
            Navigator.pop(context);
            HomeCubit.get(context).resetGame();
            HomeCubit.get(context).easy = true;
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Tic-Tac-Toe',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: HomeBody(
        mode: mode,
      ),
    );
  }
}
