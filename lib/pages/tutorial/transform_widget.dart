import 'dart:math';

import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

/*
https://medium.com/flutter-community/a-deep-dive-into-transform-widgets-in-flutter-4dc32cd575a9
The Transform widget gives us a few constructors to help simplify the creation of transformations.
Common operations such as scaling, rotation or translation are all provided via constructors.

Transform (default constructor)
Transform.rotate
Transform.scale
Transform.translate

 */
class _TransformWidgetState extends State<TransformWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.rotate(
                angle: 2.0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.pink,
                )),
            Transform.rotate(
                angle: pi / 4,
                origin: Offset(50, 50),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                )),
            Transform.scale(
                scale: 0.5,
                origin: Offset(-20, 30),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.black,
                )),
            Transform.scale(
                scale: 1.2,
                origin: Offset(50, 50),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                )),
            Transform.translate(
              offset: Offset(100.0, 0.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
              ),
            ),
            Transform(
              transform: Matrix4.skewY(0.3)
                ..rotateZ(3.14 / 12.0),
              origin: Offset(50.0, 50.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.camera),
                  Container(
                    height: 100,

                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  )
                ],
              ),
              label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat')
        ],
      ),
    );
  }
}
