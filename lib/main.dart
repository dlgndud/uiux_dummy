import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uiux_dummy/pages/my_app_index.dart';
import 'package:uiux_dummy/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      home: MyAppIndex(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()), // 최초 실행
        GetPage(
            name: "/index",
            page: () => MyAppIndex(),
            transition: Transition.native)
      ],
    );
  }
}
