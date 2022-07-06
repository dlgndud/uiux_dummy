import 'package:flutter/material.dart';
import 'dart:math';

class SlidableCards extends StatefulWidget {
  const SlidableCards({Key? key}) : super(key: key);

  @override
  State<SlidableCards> createState() => _SlidableCardsState();
}

class _SlidableCardsState extends State<SlidableCards> {
  double _page = 10;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(
      () {
        //print('pageController page! ${pageController.page}');
        setState(
          () {
            _page = pageController.page ?? 0;
          },
        );
      },
    );

    Size size = MediaQuery.of(context).size;

    List<String> imgURL = [
      'http://image.kyobobook.co.kr/images/book/large/204/l9791165345204.jpg',
      'http://image.kyobobook.co.kr/images/book/large/127/l9791196617127.jpg',
      'http://image.kyobobook.co.kr/images/book/large/716/l9788901260716.jpg',
      'http://image.kyobobook.co.kr/images/book/large/211/l9791165345211.jpg',
      'http://image.kyobobook.co.kr/images/book/large/221/l9791167960221.jpg',
      'http://image.kyobobook.co.kr/images/book/large/745/l9791170400745.jpg',
      'http://image.kyobobook.co.kr/images/book/large/359/l9791191426359.jpg',
      'http://image.kyobobook.co.kr/images/book/large/496/l9791190030496.jpg',
      'http://image.kyobobook.co.kr/images/book/large/841/l9791168761841.jpg',
      'http://image.kyobobook.co.kr/images/book/large/342/l9788934988342.jpg',
    ];

    // LayoutBuilder 레이아웃이 만들어진 후 로딩
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              child: Text(
                'Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 300,
              width: size.width * .90,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i < 10; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                            (boxConstraints.maxWidth - size.width * .75) -
                                ((boxConstraints.maxWidth - size.width * .75) /
                                        2) *
                                    -currentPageValue *
                                    (pageLocation ? 9 : 1),
                            0.0);

                    var customizableCard = Positioned.directional(
                      top: 20 + 30 * max(-currentPageValue, 0.0),
                      bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.15),
                                  blurRadius: 10)
                            ]),
                        child: Image.network(imgURL[i], fit: BoxFit.contain),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 10,
                controller: pageController,
                itemBuilder: (context, index) {
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
