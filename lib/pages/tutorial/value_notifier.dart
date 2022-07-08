import 'package:flutter/material.dart';

class ValueNotifierTutorial extends StatefulWidget {
  const ValueNotifierTutorial({Key? key}) : super(key: key);

  @override
  State<ValueNotifierTutorial> createState() => _ValueNotifierTutorialState();
}

class _ValueNotifierTutorialState extends State<ValueNotifierTutorial> {
  late ValueNotifier<int> _counter;

  @override
  void initState() {
    _counter = ValueNotifier<int>(0); // initialize
    super.initState();
  }

  /*
  * setState()를 사용하지 않고 데이터 변경을 처리
  * getx, provider를 사용하지 않고 처리
  * 전역으로 사용할 때는 WidgetsBinding.instance.addPostFrameCallback 사용
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('value notifier tutorial'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed the button this many times:'),
              ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, val, _) => Text('$val'),
                child: Text('good ${_counter.value}'),
              ),
              Text('${_counter.value}')
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _counter.value += 1;
          },
        ));
  }
}
