import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemIndex extends StatefulWidget {
  const ListItemIndex({Key? key}) : super(key: key);

  @override
  State<ListItemIndex> createState() => _ListItemIndexState();
}

class _ListItemIndexState extends State<ListItemIndex> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            topContentWidget(size: size),
            Column(
              children: List.generate(
                  10,
                  (index) => Container(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 10, bottom: 10),
                        child: mainContentWidget(size: size),
                        decoration: const BoxDecoration(color: Colors.black12),
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Widget topContentWidget({required Size size}) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: size.width,
          color: Colors.yellow,
          child: Center(child: Text('top')),
        ),
        Positioned(
          child: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
          top: 30,
          left: 30,
        )
      ],
    );
  }

  Widget mainContentWidget({required Size size}) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.network(
                'https://lh3.googleusercontent.com/a-/AFdZucq-JnWpTjIL6QKHRQvD7A1oYkZIl6zol2dPppOE7w=s96-c',
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('이웃별님의 서재입니다.'), Text('책 210권')],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          print('mate lib');
                        },
                        icon: Icon(Icons.chevron_right))
                  ],
                ),
                color: Colors.white,
                height: 80,
              ),
            ),
          ],
        ));
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
