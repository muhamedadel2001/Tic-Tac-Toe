import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_challenge/core/utilits/const.dart';

import '../../manager/home_cubit.dart';

class HomeBody extends StatefulWidget {
  final String mode;
  const HomeBody({super.key, required this.mode});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.mode == 'multiPlayer'
                    ? Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          HomeCubit.get(context).counter % 2 == 0
                              ? 'Turn ${playerOne.text}'
                              : 'Turn ${playerTwo.text}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24),
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (HomeCubit.get(context).easy == false) {
                                  HomeCubit.get(context).changeLevel();
                                  HomeCubit.get(context).resetGame();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HomeCubit.get(context).easy
                                      ? Colors.white
                                      : const Color(0xff0E1E3A),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: const Center(
                                  child: Text(
                                    'Easy',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (HomeCubit.get(context).easy == true) {
                                  HomeCubit.get(context).changeLevel();
                                  HomeCubit.get(context).resetGame();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HomeCubit.get(context).easy
                                      ? const Color(0xff0E1E3A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: const Center(
                                  child: Text(
                                    'Hard',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            widget.mode == 'multiPlayer'
                                ? HomeCubit.get(context)
                                    .putCharMultiPlayer(index, context)
                                : HomeCubit.get(context)
                                    .putCharSinglePlayer(index, context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xff0E1E3A),
                                border: Border.all(color: Colors.transparent)),
                            child: Center(
                              child: Text(
                                HomeCubit.get(context).board[index],
                                style: TextStyle(
                                    color:
                                        HomeCubit.get(context).board[index] ==
                                                'O'
                                            ? const Color(0xffE25041)
                                            : const Color(0xff1CBD9E),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60),
                              ),
                            ),
                          ));
                    }),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    HomeCubit.get(context).resetGame();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    child: const Text(
                      'Restart Game',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
