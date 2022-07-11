import 'package:flutter/material.dart';

class BannerDesign extends StatefulWidget {
  const BannerDesign({Key? key}) : super(key: key);

  @override
  State<BannerDesign> createState() => _BannerDesignState();
}

class _BannerDesignState extends State<BannerDesign> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width,
              height: 100,
              child: Text('이웃 별님의 서재를 방문해요'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFfed1c7),
                      Color(0xFFfe8dc6),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFf9ed32),
                      Color(0xFFfbb040),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF00ff8f),
                      Color(0xFF00a1ff),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF00aeef),
                      Color(0xFF2d388a),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
