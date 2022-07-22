import 'package:flutter/material.dart';

class SliverTutorial extends StatefulWidget {
  const SliverTutorial({Key? key}) : super(key: key);

  @override
  State<SliverTutorial> createState() => _SliverTutorialState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SliverTutorialState extends State<SliverTutorial> {
  final _scrollController = ScrollController();
  double _opacity = .0;
  double _offsetOpacity = .0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        // min-max scale!
        // 테스트 진행 중... 2022-07-22
        _offsetOpacity = (_scrollController.offset * 2 -
                _scrollController.position.maxScrollExtent) /
            (_scrollController.position.minScrollExtent -
                _scrollController.position.maxScrollExtent);

        _opacity = _offsetOpacity;
        if (_opacity > 1) {
          _opacity = 1;
        } else if (_opacity < 0) {
          _opacity = 0;
        }
        print('_opacity $_opacity, _offsetOpacity $_offsetOpacity');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverOpacity(
          opacity: 1,
          sliver: SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: List.generate(
                20,
                (index) => Card(
                      child: ListTile(
                        title: Text('$index'),
                      ),
                    )),
          ),
        ),
      ],
    ));
  }
}
