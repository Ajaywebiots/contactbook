import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/layouts/semi_circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1>
    with TickerProviderStateMixin {
  Animation<Offset>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1))
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Stack(alignment: Alignment.center, children: [
              Stack(alignment: Alignment.topCenter, children: [
                Center(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffD4D4D4), shape: BoxShape.circle),
                        height: 340,
                        width: 340)),
                Positioned(
                    top: 10,
                    right: 0,
                    left: 0,
                    child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 6),
                                color: const Color(0xffF5F6F7),
                                shape: BoxShape.circle),
                            height: 335,
                            width: 420))),
                Positioned(
                    top: 25,
                    child: CustomPaint(
                        size: const Size(300, 300), painter: MyPainter2())),
                //animation helping hands
                Positioned(
                    bottom: 280,
                    left: 50,
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: 1,
                      child: SlideTransition(
                          position: animation!,
                          child: Image.asset(
                              "assets/demo_animation/Helping_hands.png",
                              height: 90.98)),
                    )),
                Positioned(
                    bottom: 335,
                    left: 95,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_1.png",
                            height: 139.61))),
                Positioned(
                    bottom: 350,
                    left: 120,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_2.png",
                            height: 136.84))),
                Positioned(
                    bottom: 370,
                    left: 190,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_4.png",
                            height: 125.19))),
                Positioned(
                    bottom: 360,
                    left: 160,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_3.png",
                            height: 136.15))),
                Positioned(
                    bottom: 360,
                    left: 200,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_5.png",
                            height: 101.38))),
                Positioned(
                    bottom: 390,
                    left: 230,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_6.png",
                            height: 157))),
                Positioned(
                    bottom: 340,
                    left: 280,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_7.png",
                            height: 128.31))),
                Positioned(
                    bottom: 290,
                    left: 320,
                    child: SlideTransition(
                        position: animation!,
                        child: Image.asset(
                            "assets/demo_animation/Helping_hands_8.png",
                            height: 90.3))),

                Image.asset("assets/demo_animation/postpage.png", height: 315)
                    .padding(top: 30),
                Image.asset("assets/demo_animation/Subtract.png", height: 190)
              ]),
              Stack(alignment: Alignment.center, children: [
                Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 30, color: Colors.white))),
                Positioned(
                    top: 38,
                    child: Container(
                        height: 333,
                        width: 420,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 6, color: Colors.white))))
              ])
            ])
          ]));
    });
  }
}
