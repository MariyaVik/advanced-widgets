import 'package:flutter/material.dart';

import '../../state/state_provider.dart';
import 'custom_widgets/inner_shadow.dart';
import 'custom_widgets/weather_icons.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({required this.scrollController, super.key});
  final ScrollController scrollController;

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
    final animationCurve = CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease));
    alignAnim = Tween<AlignmentGeometry>(
            begin: Alignment.topRight, end: Alignment.center)
        .animate(animationCurve);
    sizeAnim = Tween<double>(begin: 80, end: 300).animate(animationCurve);
    opacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(animationCurve);
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

  void scroll(DragUpdateDetails details) {
    widget.scrollController
        .jumpTo(widget.scrollController.offset - details.delta.dy);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return GestureDetector(
            onVerticalDragUpdate: moreInfo ? null : scroll,
            onTap: moreInfo ? startAnimation : null,
            child: ColoredBox(
              color: moreInfo
                  ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5)
                  : Colors.transparent,
              child: AlignTransition(
                alignment: alignAnim,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: startAnimation,
                  child: Container(
                    padding: EdgeInsets.all(sizeAnim.value / 20),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(opacityAnim.value),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(blurRadius: 25, color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WeatherIndicatorWidget(
                            currentValue: StateProvider.of(context).weatherCoef,
                            size: sizeAnim.value),
                        if (moreInfo)
                          FadeTransition(
                              opacity: opacityAnim,
                              child: Temperature(sizeAnim: sizeAnim)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class Temperature extends StatelessWidget {
  const Temperature({
    Key? key,
    required this.sizeAnim,
  }) : super(key: key);

  final Animation<double> sizeAnim;

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 5,
      color: StateProvider.of(context).theme.colorScheme.primary,
      offset: const Offset(5, 5),
      child: Text('21\u2070',
          style: TextStyle(
              color: StateProvider.of(context).theme.colorScheme.onPrimary,
              fontSize: sizeAnim.value / 3,
              fontWeight: FontWeight.w900)),
    );
  }
}
