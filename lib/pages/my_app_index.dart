import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/demo_design_page.dart';

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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(() => DemoDesignPage());
                },
                child: Text('Demo Design'))
          ],
        ),
      ),
    );
  }
}
