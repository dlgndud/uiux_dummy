import 'package:flutter/material.dart';

class DummyPageView extends StatelessWidget {
  const DummyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) {
            return Text('$idx', style: const TextStyle(color: Colors.yellow));
          },
          separatorBuilder: (_, idx) => const SizedBox(height: 10),
          itemCount: 5),
    );
  }
}
