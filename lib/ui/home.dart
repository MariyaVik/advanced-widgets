import 'package:flutter/material.dart';

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
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

// Slider(
//                 value: currentValue,
//                 onChanged: (value) {
//                   setState(() {
//                     currentValue = value;
//                   });
//                 })

class AnimAdvanced extends StatefulWidget {
  const AnimAdvanced({super.key});

  @override
  State<AnimAdvanced> createState() => _AnimAdvancedState();
}

class _AnimAdvancedState extends State<AnimAdvanced>
    with SingleTickerProviderStateMixin {
  // final _animatedListKey = GlobalKey<AnimatedListState>();

  late final AnimationController controller;
  late final Animation<AlignmentGeometry> alignAnim;
  late final Animation<double> sizeAnim;
  late final Animation<double> opacityAnim;
  double currentValue = 0.2;
  bool moreInfo = false;
  // List<Widget> myList = [];

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
    sizeAnim = Tween<double>(begin: 200, end: 300).animate(CurvedAnimation(
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
      // _animatedListKey.currentState!.removeItem(myList.length - 1,
      //     (context, animation) {
      //   print('5 $myList');

      //   return Center(
      //     child: FadeTransition(
      //       opacity: animation,
      //       child: Text('удаляем'),
      //     ),
      //   );
      // }, duration: Duration(seconds: 1));
      // myList.removeLast();
    } else {
      controller.forward();

      moreInfo = !moreInfo;

      // myList.insert(myList.length, const Text('-15 градусов'));
      // _animatedListKey.currentState?.insertItem(myList.length - 1,
      //     duration: Duration(seconds: 1));
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
            child: ColoredBox(
              color: Colors.purple.shade100,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: startAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WeatherIndicatorWidget(
                        currentValue: currentValue, size: sizeAnim.value),
                    // ColoredBox(
                    //   color: Colors.orange,
                    //   child: SizedBox(
                    //     width: sizeAnim.value,
                    //     child: AnimatedList(
                    //       clipBehavior: Clip.none,
                    //       shrinkWrap: true,
                    //       key: _animatedListKey,
                    //       initialItemCount: myList.length,
                    //       itemBuilder: (BuildContext context, int index,
                    //           Animation<double> animation) {
                    //         return Center(
                    //           child: FadeTransition(
                    //             opacity: animation
                    //                 .drive(Tween(begin: 0.0, end: 1.0)),
                    //             child: myList[index],
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),

                    if (moreInfo)
                      FadeTransition(
                          opacity: opacityAnim,
                          child: const Text('-15 градусов')),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
