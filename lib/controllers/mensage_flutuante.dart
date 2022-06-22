import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MensagemFloat extends GetxController {
  late AnimationController localAnimationController;

  void exibirMensagem(context) {
    showTopSnackBar(
      context,
      const CustomSnackBar.info(
        message:
            "There is some information. You need to do something with that",
      ),
      additionalTopPadding: 85.0,
      persistent: true,
      onAnimationControllerInit: (controller) =>
          localAnimationController = controller,
      /*onTap: () {
          localAnimationController.reverse();
        }*/
    );
  }

  void recolherMensagem() {
    localAnimationController.reverse();
  }
}
