import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/demo_design_page.dart';
import 'package:uiux_dummy/pages/expandable_letter.dart';
import 'package:uiux_dummy/pages/home_screen/home_screen.dart';
import 'package:uiux_dummy/pages/list_design/item_list.dart';
import 'package:uiux_dummy/pages/movie/movie_home.dart';
import 'package:uiux_dummy/pages/slidable_cards.dart';
import 'package:uiux_dummy/pages/table_calendar.dart';
import 'package:uiux_dummy/pages/tutorial/transform_widget.dart';
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
                  child: const Text('Login Design')),
              TextButton(
                  onPressed: () {
                    Get.to(() => const SlidableCards());
                  },
                  child: const Text('slidable card')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ExpandableLetter());
                      },
                      child: const Text('Expandable Letter')),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ListItemIndex());
                      },
                      child: const Text('List Item')),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const TableCalendar());
                  },
                  child: const Text('table calendar')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => const TransformWidget());
                      },
                      child: const Text('transform tutorial')),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ValueNotifierTutorial());
                      },
                      child: const Text('value notifier tutorial')),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => HomeScreen());
                  },
                  child: const Text('home screen')),
              TextButton(
                  onPressed: () {
                    Get.to(() => MovieHome());
                  },
                  child: const Text('movie select'))
            ],
          ),
        ),
      ),
    );
  }
}
