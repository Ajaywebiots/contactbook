import 'package:contactbook/screen/app_screen/date_&_time/layouts/flutter_time_picker_spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/animation_provider/animation_provider.dart';
import '../../../provider/onboarding_provider/stateful_wrapper.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({super.key});

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationProvider>(builder: (context, value, child) {
      return StatefulWrapper(
          onInit: () => value.onAnimationInit(this),
          onDispose: () => value.onAnimationDispose,
          child: Scaffold(
              backgroundColor: Colors.green,
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Stack(children: [
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff808CFF)),
                          height: 141,
                          width: 120),
                      if (value.rotationAnimation != null)
                        Positioned(
                            bottom: -80,
                            child: RotationTransition(
                                alignment: Alignment.topCenter,
                                turns: value.rotationAnimation!,
                                child: Image.asset(
                                    height: 148,
                                    "assets/demo_animation/hSlider.png")))
                    ])
                  ]))));
    });
  }
}
