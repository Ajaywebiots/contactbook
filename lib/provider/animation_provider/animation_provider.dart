import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  double turns = 0.00;
  Animation<double>? rotationAnimation;
  AnimationController? animationController;

  onAnimationInit(SingleTickerProviderStateMixin sync) {
    animationController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 10))
          ..repeat();
    rotationAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(animationController!);
    notifyListeners();
  }

  onAnimationDispose() {
    animationController!.dispose();
    notifyListeners();
  }
}
