import 'package:flutter/material.dart';
import 'package:skillbox_14_6/state/state_provider.dart';

import 'navigation.dart';
import 'weather/weather_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NavRouteName.settings);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const AnimAdvanced(),
      floatingActionButton: FloatingActionButton(
        onPressed: StateProvider.of(context).updateWeater,
        child: const Icon(Icons.update),
      ),
    );
  }
}

class AnimAdvanced extends StatefulWidget {
  const AnimAdvanced({super.key});

  @override
  State<AnimAdvanced> createState() => _AnimAdvancedState();
}

class _AnimAdvancedState extends State<AnimAdvanced>
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
                        child: const Text('-15 градусов')),
                ],
              ),
            ),
          );
        });
  }
}
