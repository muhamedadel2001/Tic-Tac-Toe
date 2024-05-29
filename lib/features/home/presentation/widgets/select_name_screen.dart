import 'package:flutter/material.dart';
import 'package:game_challenge/core/utilits/const.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../home.dart';

class SelectNameScreen extends StatelessWidget {
  const SelectNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        backgroundColor: const Color(0xff323D5B),
        body: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Enter Names',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextForm(
                  textEditingController: playerOne, label: 'Player 1'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm(
                  textEditingController: playerTwo, label: 'Player 2'),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if (globalKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen(mode: 'multiPlayer')));
                  }
                  ;
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
