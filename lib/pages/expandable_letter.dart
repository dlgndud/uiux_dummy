import 'package:flutter/material.dart';
import 'package:uiux_dummy/pages/dummy_pageview.dart';

class ExpandableLetter extends StatefulWidget {
  const ExpandableLetter({Key? key}) : super(key: key);

  @override
  State<ExpandableLetter> createState() => _ExpandableLetterState();
}

class _ExpandableLetterState extends State<ExpandableLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // column에 ListView 위젯은 렌더링 에러
          const DummyPageView(),
          Expanded(
            child: PageView(
              children: const [
                Text('1111'),
                Text('2222'),
                Text('3333'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
