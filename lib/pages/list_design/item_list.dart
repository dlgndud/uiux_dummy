import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItemIndex extends StatefulWidget {
  const ListItemIndex({Key? key}) : super(key: key);

  @override
  State<ListItemIndex> createState() => _ListItemIndexState();
}

class _ListItemIndexState extends State<ListItemIndex> {
  // @override
  // Widget build(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [topContent(size: size), Expanded(child: MainContent())],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            topContentWidget(size: size),
            Column(
              children: List.generate(
                  10,
                  (index) => Container(
                        color: Colors.white70,
                        height: 100,
                        width: size.width,
                        child: Text('$index'),
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Widget topContentWidget({required Size size}) {
    return Container(
      height: 250,
      width: size.width,
      color: Colors.yellow,
      child: Center(child: Text('top')),
    );
  }

  Widget mainContentWidget({required Size size}) {
    return ListView.builder(
        itemBuilder: (ctx, idx) {
          return Container(
            child: Text('body'),
            color: Colors.grey,
            height: 100,
          );
        },
        itemCount: 10);
  }
}

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (ctx, idx) {
          return Container(
            child: Text('body'),
            color: Colors.amber,
            height: 100,
          );
        },
        itemCount: 10);
  }
}
