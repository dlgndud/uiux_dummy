import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/demo_design_page.dart';
import 'package:uiux_dummy/pages/expandable_letter.dart';
import 'package:uiux_dummy/pages/home_screen/home_screen.dart';
import 'package:uiux_dummy/pages/movie/movie_home.dart';
import 'package:uiux_dummy/pages/slidable_cards.dart';
import 'package:uiux_dummy/pages/table_calendar.dart';
import 'package:uiux_dummy/pages/tutorial/value_notifier.dart';

class MyAppIndex extends StatefulWidget {
  String? title;

  MyAppIndex({Key? key, this.title}) : super(key: key);

  @override
  State<MyAppIndex> createState() => _MyAppIndexState();
}

class _MyAppIndexState extends State<MyAppIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(() => DemoDesignPage());
                  },
                  child: const Text('Demo Design')),
              TextButton(
                  onPressed: () {
                    Get.to(() => SlidableCards());
                  },
                  child: const Text('slidable card')),
              TextButton(
                  onPressed: () {
                    Get.to(() => const ExpandableLetter());
                  },
                  child: const Text('Expandable Letter')),
              TextButton(
                  onPressed: () {
                    Get.to(() => TableCalendar());
                  },
                  child: const Text('table calendar')),
              TextButton(
                  onPressed: () {
                    Get.to(() => ValueNotifierTutorial());
                  },
                  child: Text('value notifier tutorial')),
              TextButton(
                  onPressed: () {
                    Get.to(() => HomeScreen());
                  },
                  child: Text('home screen')),
              TextButton(
                  onPressed: () {
                    Get.to(() => MovieHome());
                  },
                  child: Text('movie select'))
            ],
          ),
        ),
      ),
    );
  }
}
