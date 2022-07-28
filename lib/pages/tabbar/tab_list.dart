import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiux_dummy/pages/models/restaurant.dart';
import 'package:uiux_dummy/pages/tabbar/food_item.dart';

class TabList extends StatefulWidget {
  PageController pageController;
  int selected;
  Function callback;

  TabList(
      {Key? key,
      required this.pageController,
      required this.selected,
      required this.callback})
      : super(key: key);

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  late Restaurant? _restaurant;

  @override
  void initState() {
    _restaurant = Restaurant.generateRestaurant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final category = _restaurant!.menu.keys.toList();
    //print(category);
    // PageView 스크롤 가능한 페이지 생성
    return Container(
        height: 250,
        child: PageView(
            controller: widget.pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) => widget.callback(index),
            children: category
                .map((e) => ListView.separated(
                      itemBuilder: (ctx, idx) => FoodItem(
                          food: _restaurant!
                              .menu[category[widget.selected]]![idx]),
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 10),
                      itemCount:
                          _restaurant!.menu[category[widget.selected]]!.length,
                    ))
                .toList()));
  }
}
