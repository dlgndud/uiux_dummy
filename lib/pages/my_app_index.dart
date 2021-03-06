import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/animation/container_transition.dart';
import 'package:uiux_dummy/pages/animation/container_transition_custom.dart';
import 'package:uiux_dummy/pages/animation/page_animation.dart';
import 'package:uiux_dummy/pages/demo_design_page.dart';
import 'package:uiux_dummy/pages/expandable_letter.dart';
import 'package:uiux_dummy/pages/home_screen/home_screen.dart';
import 'package:uiux_dummy/pages/list_design/item_list.dart';
import 'package:uiux_dummy/pages/list_design/star2book_itemlist.dart';
import 'package:uiux_dummy/pages/movie/movie_home.dart';
import 'package:uiux_dummy/pages/slidable_cards.dart';
import 'package:uiux_dummy/pages/tabbar/tab_index_tutorial.dart';
import 'package:uiux_dummy/pages/table_calendar.dart';
import 'package:uiux_dummy/pages/tutorial/sliver_widget.dart';
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
                      child: const Text('PageView ListView')),
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
              Container(
                color: Colors.black12,
                child: Column(
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
                    TextButton(
                        onPressed: () {
                          Get.to(() => const SliverTutorial());
                        },
                        child: const Text('sliver widget tutorial')),
                  ],
                ),
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
                  child: const Text('movie select')),
              TextButton(
                  onPressed: () {
                    Get.to(() => OpenContainerTransformCustomDemo());
                  },
                  child: const Text('page transition custom')),
              TextButton(
                  onPressed: () {
                    Get.to(() => OpenContainerTransformCustomDemo());
                  },
                  child: const Text('page transition')),
              TextButton(
                  onPressed: () {
                    Get.to(() => const Star2BookItemList());
                  },
                  child: const Text('star2book item list')),
              TextButton(
                  onPressed: () {
                    Get.to(() => const TabIndexTutorial());
                  },
                  child: const Text('tab index tutorial')),
            ],
          ),
        ),
      ),
    );
  }
}
