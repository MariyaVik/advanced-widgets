import 'package:flutter/material.dart';

import '../../state/state_provider.dart';
import 'custom_widgets/inner_shadow.dart';
import 'custom_widgets/weather_icons.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<AlignmentGeometry> alignAnim;
  late final Animation<double> sizeAnim;
  late final Animation<double> opacityAnim;
  bool moreInfo = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    alignAnim = Tween<AlignmentGeometry>(
            begin: Alignment.topRight, end: Alignment.center)
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.ease)));
    sizeAnim = Tween<double>(begin: 80, end: 300).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease)));
    opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    if (moreInfo) {
      controller.animateBack(0).whenComplete(() {
        moreInfo = !moreInfo;
      });
    } else {
      controller.forward();
      moreInfo = !moreInfo;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return AlignTransition(
            alignment: alignAnim,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: startAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WeatherIndicatorWidget(
                      currentValue: StateProvider.of(context).weatherCoef,
                      size: sizeAnim.value),
                  if (moreInfo)
                    FadeTransition(
                        opacity: opacityAnim,
                        child: InnerShadow(
                          blur: 5,
                          color: StateProvider.of(context)
                              .theme
                              .colorScheme
                              .primary,
                          offset: const Offset(5, 5),
                          child: Text('21\u2070',
                              style: TextStyle(
                                  color: StateProvider.of(context)
                                      .theme
                                      .colorScheme
                                      .onPrimary,
                                  fontSize: sizeAnim.value / 3,
                                  fontWeight: FontWeight.w900)),
                        )),
                ],
              ),
            ),
          );
        });
  }
}
