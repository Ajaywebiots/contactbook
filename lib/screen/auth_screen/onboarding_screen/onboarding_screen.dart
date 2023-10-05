import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/screen/auth_screen/onboarding_screen/layouts/semi_circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  Animation<double>? animation1, cloud, cloud1, animation2;
  bool isOpacity = false;
  AnimationController? animationController1,
      cloudController,
      cloudController1,
      animationController2;

  @override
  void dispose() {
    animationController1!.dispose();
    animationController2!.dispose();
    cloudController!.dispose();
    cloudController1!.dispose();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..forward();
    animation1 =
        Tween<double>(begin: 0, end: -128).animate(animationController1!)
          ..addListener(() {
            setState(() {});
          });
    animationController2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    animation2 =
        Tween<double>(begin: 0, end: -128).animate(animationController2!)
          ..addListener(() {
            setState(() {});
          });

    cloudController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    cloud = CurvedAnimation(parent: cloudController!, curve: Curves.easeIn);

    cloudController1 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    cloud1 = CurvedAnimation(parent: cloudController1!, curve: Curves.easeIn);

    opacityChange();
  }

  opacityChange() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      isOpacity = true;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.blue,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Stack(alignment: Alignment.topCenter, children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffD2D3D4), shape: BoxShape.circle),
                  height: 325,
                  width: 320,
                ),
              ),
              Center(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFF5F6F7), shape: BoxShape.circle),
                      height: 315,
                      width: 400)),
              Positioned(
                  top: 10,
                  child: CustomPaint(
                      size: const Size(300, 300), painter: MyPainter())),
              Positioned(
                  top: 15,
                  left: 2,
                  right: 60,
                  child: FadeTransition(
                      opacity: cloud!,
                      child: Image.asset("assets/demo_animation/cloud.png",
                          height: 18))),
              Positioned(
                  top: 50,
                  left: 20,
                  right: 60,
                  child: FadeTransition(
                      opacity: cloud!,
                      child: Image.asset("assets/demo_animation/cloud.png",
                          height: 18))),
              Positioned(
                  top: 30,
                  left: 100,
                  right: 6,
                  child: FadeTransition(
                      opacity: cloud!,
                      child: Image.asset("assets/demo_animation/cloud1.png",
                          height: 10))),
              Positioned(
                top: 30,
                left: 110,
                right: 2,
                child: FadeTransition(
                  opacity: cloud1!,
                  child: Image.asset("assets/demo_animation/cloud1.png",
                      height: 10),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height / 15,
                  right: 0,
                  left: 0,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Opacity(
                      opacity: isOpacity == false ? 0 : 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Transform.translate(
                                      offset: Offset(0, animation1!.value),
                                      child: Image.asset(
                                          "assets/demo_animation/rock1.png",
                                          height: 8.28)),
                                  Transform.translate(
                                      offset: Offset(0, animation1!.value),
                                      child: Image.asset(
                                          "assets/demo_animation/Bulidings.png",
                                          height: 62.68)),
                                  const SizedBox(width: 20),
                                  Transform.translate(
                                      offset: Offset(0, animation2!.value),
                                      child: Image.asset(
                                          "assets/demo_animation/Bulidings1.png",
                                          height: 106)),
                                  Transform.translate(
                                      offset: Offset(0, animation1!.value),
                                      child: Image.asset(
                                          "assets/demo_animation/Bulidings.png",
                                          height: 47.54)),
                                ],
                              ).padding(left: 15),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Transform.translate(
                                        offset: Offset(0, animation1!.value),
                                        child: Image.asset(
                                            "assets/demo_animation/Bulidings.png",
                                            height: 90.65)),
                                    const SizedBox(width: 6),
                                    Transform.translate(
                                        offset: Offset(0, animation2!.value),
                                        child: Image.asset(
                                            "assets/demo_animation/Bulidings1.png",
                                            height: 75.55)),
                                    const SizedBox(width: 6),
                                    Transform.translate(
                                        offset: Offset(0, animation1!.value),
                                        child: Image.asset(
                                            "assets/demo_animation/Bulidings.png",
                                            height: 47.74)),
                                    Transform.translate(
                                        offset: Offset(0, animation1!.value),
                                        child: Image.asset(
                                            height: 8.28,
                                            "assets/demo_animation/rock1.png"))
                                  ]).padding(right: 16)
                            ]),
                      ),
                    ),
                    RotationTransition(
                        turns: const AlwaysStoppedAnimation(180 / 360),
                        child: CustomPaint(
                            size: const Size(200, 200),
                            painter: MyPainterWhite()))
                  ])),
              Image.asset(height: 380, "assets/demo_animation/girl.png")
            ])
          ]));
    });
  }
}
