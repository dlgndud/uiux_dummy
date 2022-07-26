import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiux_dummy/pages/models/restaurant.dart';
import 'package:uiux_dummy/pages/tabbar/food_item.dart';

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

  void callback(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = _restaurant!.menu.keys.toList();
    //print(category);
    return Scaffold(
        appBar: AppBar(
          title: Text('Tab Index'),
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: (index) => callback(index),
            children: category
                .map((e) => ListView.separated(
                      itemBuilder: (ctx, idx) => FoodItem(
                          food: _restaurant!
                              .menu[category[_selectedIndex]]![idx]),
                      separatorBuilder: (_, index) => SizedBox(height: 10),
                      itemCount:
                          _restaurant!.menu[category[_selectedIndex]]!.length,
                    ))
                .toList()));
  }
}
