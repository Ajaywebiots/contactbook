
import 'package:contactbook/provider/onboarding_provider/onboarding_provider2.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/layouts/semi_circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingCtrl2>(builder: (context, onboard, child) {
      double height = onboard.heightMQ(context);
      double width = onboard.widthMQ(context);
      return StatefulWrapper(
          onInit: () => onboard.onAnimation(this),
          onDispose: () => onboard.onAnimationCtrlDispose,
          child: WillPopScope(
              onWillPop: () async {
                setState(() {
                  onboard.sizeA = false;
                  onboard.sizeB = false;
                  onboard.val = false;
                });
                return true;
              },
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(alignment: Alignment.center, children: [
                          Stack(alignment: Alignment.topCenter, children: [
                            Center(
                                child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffD2D3D4),
                                  shape: BoxShape.circle),
                              height: 340,
                              width: 340,
                            )),
                            Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                child: Center(
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Color(0xffF5F6F7),
                                            shape: BoxShape.circle),
                                        height: 335,
                                        width: 420))),
                            Positioned(
                                top: height / 35,
                                child: CustomPaint(
                                    size: const Size(300, 300),
                                    painter: MyPainter2())),
                            Positioned(
                                top: height * 0.1,
                                left: width * 0.3,
                                child: AnimatedSize(
                                    curve: Curves.easeIn,
                                    duration: const Duration(milliseconds: 500),
                                    child: Image.asset(
                                        "assets/demo_animation/Group2.png",
                                        width: onboard.sizeB == true ? 22 : 0,
                                        height:
                                            onboard.sizeA == true ? 26 : 0))),
                            Positioned(
                                top: height * 0.05,
                                left: width * 0.2,
                                child: AnimatedSize(
                                    curve: Curves.easeIn,
                                    duration: const Duration(milliseconds: 500),
                                    child: Image.asset(
                                        "assets/demo_animation/Group1.png",
                                        width: onboard.sizeB == true ? 31 : 0,
                                        height:
                                            onboard.sizeB == true ? 37 : 0))),
                            if (onboard.frameAnimation != null)
                              Positioned(
                                  top: height * -0.05,
                                  left: width * 0.57,
                                  child: SlideTransition(
                                      position: onboard.frameAnimation!,
                                      child: Image.asset(
                                          "assets/demo_animation/Frame.png",
                                          height: 11))),
                            if (onboard.frameAnimation != null)
                              Positioned(
                                  top: height * -0.07,
                                  left: width * 0.35,
                                  child: SlideTransition(
                                      position: onboard.frameAnimation!,
                                      child: Image.asset(
                                          "assets/demo_animation/Frame.png",
                                          height: 11))),
                            if (onboard.animation1 != null)
                              Positioned(
                                  right: width * 0.117,
                                  top: height * 0.048,
                                  child: Stack(children: [
                                    FadeTransition(
                                        opacity: onboard.animation1!,
                                        child: Image.asset(
                                            "assets/demo_animation/WINDOW.png",
                                            fit: BoxFit.fill,
                                            height: 150,
                                            width: 70)),
                                    AnimatedPositioned(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        left: onboard.val == true
                                            ? 0
                                            : width * -0.2,
                                        top: 0,
                                        bottom: height * 0.02,
                                        child: Image.asset(
                                            "assets/demo_animation/GroupB.png",
                                            height: 200)),
                                    AnimatedPositioned(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        left: onboard.val == true
                                            ? width * 0.11
                                            : width * 2,
                                        top: 0,
                                        bottom: height * 0.02,
                                        child: Image.asset(
                                            "assets/demo_animation/GROUPA.png",
                                            height: 200))
                                  ])),
                            if (onboard.animation1 != null)
                              Positioned(
                                  top: height * 0.03,
                                  left: width * 0.13,
                                  child: SlideTransition(
                                      position: onboard.animation!,
                                      child: Image.asset(
                                          height: 75,
                                          "assets/demo_animation/Plant.png"))),
                            Positioned(
                                top: height * 0.05,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                    "assets/demo_animation/girl2.png",
                                    height: 255)),
                            Image.asset(
                                height: 190,
                                "assets/demo_animation/Subtract.png")
                          ]),
                          Stack(alignment: Alignment.center, children: [
                            Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 30, color: Colors.white))),
                            Positioned(
                                top: height * 0.0415,
                                child: Container(
                                    height: 333,
                                    width: 420,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 6, color: Colors.white))))
                          ])
                        ])
                      ]))));
    });
  }
}
