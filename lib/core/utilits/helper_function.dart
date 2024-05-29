import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

import '../../features/home/manager/home_cubit.dart';


class Helper {
  static awesomeDialog(BuildContext context, title) {
    return AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            btnOkText: 'Play Again',
            btnOkOnPress: () {
              HomeCubit.get(context).resetGame();
            },
            title: title)
        .show();
  }
}
