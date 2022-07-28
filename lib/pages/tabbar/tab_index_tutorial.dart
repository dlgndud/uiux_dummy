import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/models/restaurant.dart';
import 'package:uiux_dummy/pages/tabbar/food_item.dart';
import 'package:uiux_dummy/pages/tabbar/restaurant_info.dart';
import 'package:uiux_dummy/pages/tabbar/tab_app_bar.dart';
import 'package:uiux_dummy/pages/tabbar/tab_list.dart';

class TabIndexTutorial extends StatefulWidget {
  const TabIndexTutorial({Key? key}) : super(key: key);

  @override
  State<TabIndexTutorial> createState() => _TabIndexTutorialState();
}

class _TabIndexTutorialState extends State<TabIndexTutorial> {
  late PageController _pageController;
  late Restaurant? _restaurant;
  late Function? _callback;

  int _selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    _restaurant = Restaurant.generateRestaurant();
    super.initState();
  }

  // void callback(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final category = _restaurant!.menu.keys.toList();
    //int selected = 0;
    //print(category);
    return Scaffold(
        backgroundColor: Colors.lime,
        body: Column(
          children: [
            TabAppBar(
              leftIcon: Icons.arrow_back,
              rightIcon: Icons.search,
              leftCallback: () {
                Get.back();
              },
            ),
            RestaurantInfo(),
            Container(
              color: Colors.black,
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, idx) => InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(category[idx],
                              style: TextStyle(
                                  color: _selectedIndex == idx
                                      ? Colors.yellow
                                      : Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          //print('$idx tab');
                          setState(() {
                            _selectedIndex = idx;
                          });
                        },
                      ),
                  separatorBuilder: (_, idx) => const SizedBox(height: 10),
                  itemCount: category.length),
            ),
            Expanded(
                child: TabList(
              selected: _selectedIndex,
              pageController: _pageController,
              callback: (int selectedIndex) {
                //print('페이지 인덱스! $selectedIndex');
                setState(() {
                  //print('setState call $selectedIndex');
                  _selectedIndex = selectedIndex;
                });
              },
            ))
          ],
        ));
  }
}
