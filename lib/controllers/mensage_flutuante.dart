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
        icon: Icon(Icons.add_location_alt_outlined, color: Color(0xFF607d8b), size: 90,),
        backgroundColor: Color(0xFF37474f),
          textStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
        message:
            "Clique no mapa para marca o local da ocorrência",
      ),
      additionalTopPadding: 85.0,
      persistent: true,
      onAnimationControllerInit: (controller) =>
          localAnimationController = controller,
    );
  }

  void recolherMensagem(context) {
    print("Is dmissed ${localAnimationController.isDismissed}");
    print("Is Completed ${localAnimationController.isCompleted}");

    if(!localAnimationController.isDismissed) {
      localAnimationController.reverse();
    }
  }
}
