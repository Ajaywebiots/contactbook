import 'dart:developer';

import 'package:flutter/cupertino.dart';

class OnBoardingCtrl2 extends ChangeNotifier {
  bool sizeA = false;
  bool sizeB = false;
  Animation<Offset>? animation, frameAnimation;
  Animation<double>? animation1;
  AnimationController? animationController,
      animationController1,
      frameController;
  bool val = false;
  OnBoardingCtrl2? onBoardingCtrl2;

  newFunc() async {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      sizeA = true;
      sizeB = true;

      notifyListeners();
    });
  }

  onAnimationCtrlDispose(){
    animationController!.dispose();
    animationController1!.dispose();
    frameController!.dispose();
    notifyListeners();
  }

  onAnimation(TickerProvider sync) {
    log("READU");
    animationController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
    animation =
        Tween<Offset>(begin: const Offset(-1.5, 1), end: const Offset(0, 1))
            .animate(CurvedAnimation(
                parent: animationController!, curve: Curves.elasticOut));

    animationController1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: sync,
    )..forward();

    animation1 =
        CurvedAnimation(parent: animationController1!, curve: Curves.easeIn);

    frameController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
    frameAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 10))
        .animate(
            CurvedAnimation(parent: frameController!, curve: Curves.easeInOut));

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      val = true;

      notifyListeners();
    });
    log("frameAnimation : $val");
    newFunc();
  }

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }
}
